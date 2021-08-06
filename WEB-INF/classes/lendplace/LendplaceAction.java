package lendplace;


import java.util.ArrayList;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
//import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import util.PagingCalculator;
import util.YogiUtils;


public class LendplaceAction implements ServletRequestAware, ServletResponseAware{
	private List<LendplaceModel> list;
	private SqlMapClient sqlMapper;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 6;
	private int blockPage = 3;
	private String pagingHtml;

	//private Map session;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private String searchWord;
	private String search_area;
	private String min_pay;
	private String max_pay;
	private String l_t_date; //검색용 날짜
	
	public LendplaceAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		//TepUtils.savePageURI(request, session);
		try {
			list = sqlMapper.queryForList("lendplace_select_all");
			totalCount = list.size();
			PagingCalculator page = new PagingCalculator("lendplace", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			list = list.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("lendplace list all error : "+e.getMessage());
		}
		return "success";
	}
	
	public String search(){
		try {
//			System.out.println(searchWord); // 한번 제대로 넘어오나 확인해볼까?
//			System.out.println(search_area);
//			System.out.println(min_pay);
//			System.out.println(max_pay);
//			System.out.println(l_t_date);
			String query = createQuery();
			if(query.length() > 0){
				list = sqlMapper.queryForList("lendplace_search", query);				
			} else {
				execute();
			}
		} catch (Exception e) {
			System.out.println("search lendplace error : "+e.getMessage());
		}
		return "success";
	}
	
	private String createQuery(){
		
		List<String> queryList = new ArrayList<String>();
		
		
		
		if(searchWord != null && searchWord.length() > 0){
			queryList.add("(l_subject like '%"+searchWord+"%' or l_content like '%"+searchWord+"%')");
		}
		
		
		if(search_area != null && search_area.length() > 0){
			queryList.add("REGEXP_LIKE(l_addr,'"+search_area+"')");
		}
		
		if(min_pay != null && min_pay.length() > 0 || max_pay != null && max_pay.length() > 0){
		    if(min_pay==null || min_pay==""){
				min_pay+="0";
			}
		    if(max_pay==null || max_pay==""){
				max_pay+="999999999";
			}
			queryList.add(createPaymentQuery(min_pay,max_pay)); //여기서 왜 자꾸 null값이 넘어갈까 ㅠㅠ
		}
		if (l_t_date != null &&l_t_date.length() > 0) {
			queryList.add(createDateQuery(l_t_date));
		}
		
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
		//System.out.println("query : "+query);// 쿼리 확인 
		return query;
	}

	private String createPaymentQuery(String min_pay,String max_pay){ 
		if(min_pay!=null && max_pay!=null) {
			return "(l_payment between "+min_pay+" and "+max_pay+")";
		}
	return null;
	}
	
	private String createDateQuery(String l_t_date) {
		if (l_t_date != null) {
			return "((to_date('"+l_t_date+"', 'YY.MM.DD') between (l_sdate-1) and (l_edate+1)) and l_no not IN(select DISTINCT l_no from placebook where REGEXP_LIKE(l_date,to_date('"+l_t_date+"', 'YY.MM.DD'))))";
		}
		return null;
	}
	
	public List<LendplaceModel> getList() {
		return list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	/*@Override
	public void setSession(Map session) {
		this.session = session;
	}
	*/

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	

	public void setSearch_area(String search_area) {
		this.search_area = search_area;
	}

	public String getMin_pay() {
		return min_pay;
	}

	public void setMin_pay(String min_pay) {
		this.min_pay = min_pay;
	}

	public String getMax_pay() {
		return max_pay;
	}

	public void setMax_pay(String max_pay) {
		this.max_pay = max_pay;
	}

	public String getL_t_date() {
		return l_t_date;
	}

	public void setL_t_date(String l_t_date) {
		this.l_t_date = l_t_date;
	}

	
	
}
