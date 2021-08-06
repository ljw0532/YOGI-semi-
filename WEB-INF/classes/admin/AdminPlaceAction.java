package admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import lendplace.LendplaceModel;
import util.PagingCalculator;

public class AdminPlaceAction {
	private static final int SEARCHKEY_LENDPLACE_SUBJECT = 0;
	private static final int SEARCHKEY_LENDPLACE_ADDR = 1;
	private static final int SEARCHKEY_MEMBER_ID = 2;
	
	private List<AdminPlaceModel> lendPList = new ArrayList<>();
	private SqlMapClient sqlMapper;
	private AdminPlaceModel data;
	private int m_no;
	private String m_id;
	private Map session;
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingCalculator page;
	
	private int searchKeyP = -1;
	private String searchWordP = "";
	
	public AdminPlaceAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	public String execute() {
		try {
			if(searchKeyP != -1 && searchWordP.length() > 0){
				search();
			} else {
				lendPList = sqlMapper.queryForList("jj.lendplaceAdmin_select_all");
				
			}
			//페이징
			totalCount = lendPList.size();
			page = new PagingCalculator("adminPlace", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			lendPList = lendPList.subList(page.getStartCount(), lastCount);
			
		} catch (Exception e) {
			System.out.println("lendPList Ex : "+e.getMessage());
		}
		return "success";
	}
	
	private void search() throws SQLException{
		data = new AdminPlaceModel();
		data.setL_subject(getSearchWordP());
		data.setL_addr(getSearchWordP());
		data.setM_id(getSearchWordP());
		switch (getSearchKeyP()) {
		case SEARCHKEY_LENDPLACE_SUBJECT:
			lendPList = sqlMapper.queryForList("jj.LendplaceAdmin_search_l_subject_select_all", data);
			break;
		case SEARCHKEY_LENDPLACE_ADDR:
			lendPList = sqlMapper.queryForList("jj.LendplaceAdmin_search_l_addr_select_all", data);
			break;
		case SEARCHKEY_MEMBER_ID:
			lendPList = sqlMapper.queryForList("jj.LendplaceAdmin_search_m_id_select_all", data);
			break;
		}
	}
	
	
	//장소 삭제
	public String delete() {
		
		return "success";
	}
	
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	//장소 예약 변경
	public String modify() {
		
		return "success";
	}
	public List<AdminPlaceModel> getLendPList() {
		return lendPList;
	}
	public void setLendPList(List<AdminPlaceModel> lendPList) {
		this.lendPList = lendPList;
	}
	public AdminPlaceModel getData() {
		return data;
	}
	public void setData(AdminPlaceModel data) {
		this.data = data;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
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
	public PagingCalculator getPage() {
		return page;
	}
	public void setPage(PagingCalculator page) {
		this.page = page;
	}
	public int getSearchKeyP() {
		return searchKeyP;
	}
	public void setSearchKeyP(int searchKeyP) {
		this.searchKeyP = searchKeyP;
	}
	public String getSearchWordP() {
		return searchWordP;
	}
	public void setSearchWordP(String searchWordP) {
		this.searchWordP = searchWordP;
	}
	
	
	
	
}
