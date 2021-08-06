package mypage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import lendplace.LendplaceModel;
import lendplace.PlacebookModel;
import util.PagingCalculator;
import util.YogiConstants;
import util.YogiUtils;

public class MypagePlacebookHistoryAction extends LendplaceModel implements SessionAware{
	private List<PlacebookModel> pblist;
	private List<LendplaceModel> Plist = new ArrayList<>();
	
	
	
	
	private SqlMapClient sqlMapper;
	private Map session;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 3;
	private String pagingHtml;
	
	public MypagePlacebookHistoryAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	@SuppressWarnings("unchecked")
	public String execute(){
		try {
			int m_no = (int) session.get(YogiConstants.M_NO);
			pblist = sqlMapper.queryForList("my.placebook_select_all",m_no);
			for(PlacebookModel data : pblist){
				
				Plist.add((LendplaceModel) sqlMapper.queryForObject("my.lendplaceHistory_select_all",data.getL_no()));
			}
			List pblist1=new ArrayList();
			for(int i=0; i<pblist.size(); i++) {
//				String new1 = new SimpleDateFormat("yyyy-MM-dd").format(pblist.get(i).getL_date()); 
//				System.out.println(new1);
//				pblist1.add(new1);
				String new2 = YogiUtils.dateParseFormat(pblist.get(i).getL_date());
				System.out.println(new2);
				pblist1.add(new2);
			}
			
			
			totalCount = Plist.size();
			PagingCalculator page = new PagingCalculator("mypagePlacebookHistory", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			for (int i = 0; i < Plist.size(); i++) {
				System.out.println(Plist.get(i).getL_rep_img());
			}
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			pblist = pblist1;
			Plist = Plist.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("mypageMeetHistory Ex : "+e.getMessage());
		}
		return "success";
	}

	public List<PlacebookModel> getPblist() {
		return pblist;
	}

	public void setGelist(List<PlacebookModel> pblist) {
		this.pblist = pblist;
	}

	public List<LendplaceModel> getPlist() {
		return Plist;
	}

	public void setMlist(List<LendplaceModel> plist) {
		Plist = plist;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
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

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
	

	
	
}
