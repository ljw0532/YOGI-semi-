package group;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import config.SqlMapper;
import group.GroupModel;
import group.GroupSearchModel;
import util.PagingCalculator;
import util.YogiConstants;
import util.YogiUtils;
import likeit.LikeitModel;

public class GroupAction implements SessionAware, ServletRequestAware, ServletResponseAware, Preparable, ModelDriven<GroupSearchModel>
{
	private List<GroupModel> list;
	private SqlMapClient sqlMapper;
	
	private int currentPage = 1; 
	private int totalCount;
	private int blockCount = 6; 
	private int blockPage = 3;
	
	private String pagingHtml;
	
	private Map session;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private GroupSearchModel sModel;
	private int gg_no;
	
	public GroupAction(){
		sqlMapper = SqlMapper.getMapper();
	}

	public String execute() {
		YogiUtils.savePageURI(request, session);
		try {
			list = sqlMapper.queryForList("jj.group_select_all");
			totalCount = list.size(); 
			PagingCalculator page = new PagingCalculator("group", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString(); 					
			int lastCount = totalCount;
			if(page.getEndCount() < totalCount){ 
				lastCount = page.getEndCount()+1; 
			} 
			
			list = list.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("openmeet listAll error : "+e.getMessage());
		}
		return "success";
	}
			
	public String search(){
		try {
			String query = createQuery();
			if(query.length() > 0){
				list = sqlMapper.queryForList("jj.group_search", query);
			} else {
				execute();
			}
			
		} catch (Exception e) {
			System.out.println("search openmeet error : "+e.getMessage());
		}
		return "success";
	}
	
	private String createQuery(){
		List<String> queryList = new ArrayList<String>();
		
		if(sModel.getSearchWord() != null && sModel.getSearchWord().length() > 0){ 
			queryList.add("(gg_name like '%"+sModel.getSearchWord()+"%' or gg_simple like '%"+sModel.getSearchWord()+"%' or gg_detail like '% "+sModel.getSearchWord()+"%')");
		} 
		
		if(sModel.getSearchCategory() != null && sModel.getSearchCategory().length() > 0){
			queryList.add("REGEXP_LIKE(gg_category,'"+sModel.getSearchCategory()+"')");
		} //
		
		if(sModel.getSearchAddr() != null && sModel.getSearchAddr().length() > 0){
			queryList.add("REGEXP_LIKE(gg_place,'"+sModel.getSearchAddr()+"')");

		}
		
		if(sModel.getSearchPay() != null && sModel.getSearchPay().length() > 0) {
			if(sModel.getSearchPay().equals("유료")){
				queryList.add("gg_cost > 0");	
			} if(sModel.getSearchPay().equals("무료")){ 
				queryList.add("gg_cost <= 0");
			}
		}
				
		if(sModel.getSearchMStart() != null){
			queryList.add("(gg_date LIKE '%"+sModel.getSearchMStart()+"%')");
		}
		
		System.out.println(sModel.getSearchWord());
		System.out.println(sModel.getSearchCategory());	
		System.out.println(sModel.getSearchAddr());
		System.out.println(sModel.getSearchPay());
		System.out.println(sModel.getSearchMStart());
		
		
		
		String query = "";
		if(queryList.size() > 1){
			for (int i = 0; i < queryList.size(); i++) {
				query += queryList.get(i);
				if(queryList.size()-1 == i){
					continue;
				}
				query += " and ";
			}
		} else if(queryList.size() == 1){
			query = queryList.get(0);
		}
//		System.out.println(query);
		return query;
	}

	
	@Override
	public GroupSearchModel getModel() {
		return sModel;
	}

	@Override
	public void prepare() throws Exception {
		sModel = new GroupSearchModel();
		
	}

	@Override
	public void setServletResponse(HttpServletResponse Response) {
		this.response = response;
		
	}

	@Override
	public void setServletRequest(HttpServletRequest Request) {
		this.request = request;
		
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
		
	}

	public List<GroupModel> getList() {
		return list;
	}

	public void setList(List<GroupModel> list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public int getGg_no() {
		return gg_no;
	}

	public void setGg_no(int gg_no) {
		this.gg_no = gg_no;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
}