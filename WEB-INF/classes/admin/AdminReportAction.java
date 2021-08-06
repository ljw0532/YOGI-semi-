package admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import group.GroupModel;
import members.MembersModel;
import util.PagingCalculator;
import util.YogiConstants;

public class AdminReportAction extends GroupModel{
	private static final int SEARCHKEY_GROUP_NAME = 0;
	private static final int SEARCHKEY_MEMBER_ID = 1;
	private static final int SEARCHKEY_MEMBER_NAME = 2;
	
	private List<AdminReportModel> reportList = new ArrayList<>();
	private SqlMapClient sqlMapper;
	private AdminReportModel data;
	private int m_no;
	private Map session;
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingCalculator page;
	
	private int searchKeyR = -1;
	private String searchWordR = "";
	
	public AdminReportAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	public String execute() {
		try {
			if(searchKeyR != -1 && searchWordR.length() > 0){
				search();
			} else {
				reportList = sqlMapper.queryForList("jj.report_select_all");
				
			}
			//페이징
			totalCount = reportList.size();
			page = new PagingCalculator("adminReport", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			reportList = reportList.subList(page.getStartCount(), lastCount);
			
		} catch (Exception e) {
			System.out.println("reportList Ex : "+e.getMessage());
		}
		return "success";
	}
	
	private void search() throws SQLException{
		AdminReportModel data = new AdminReportModel();
		data.setM_name(getSearchWordR());
		data.setM_id(getSearchWordR());
		data.setGg_name(getSearchWordR());
		switch (getSearchKeyR()) {
		case SEARCHKEY_GROUP_NAME:
			reportList = sqlMapper.queryForList("jj.ReportList_search_gg_name_select_all", data);
			break;
		case SEARCHKEY_MEMBER_ID:
			reportList = sqlMapper.queryForList("jj.ReportList_search_m_id_select_all", data);
			break;
		case SEARCHKEY_MEMBER_NAME:
			reportList = sqlMapper.queryForList("jj.ReportList_search_m_name_select_all", data);
			break;
		}
	}
	
	public String deleteMember() {
		try {
			sqlMapper.delete("jj.comments_delete_where_m_no", getM_no());
			sqlMapper.delete("jj.likeit_delete_where_m_no", getM_no());
			sqlMapper.delete("jj.ge_delete_where_m_no", getM_no());
			sqlMapper.delete("jj.placebook_delete_where_m_no", getM_no());
			
			List groupList = sqlMapper.queryForList("jj.gg_no_select_where_m_no", getM_no());
			for (int i = 0; i < groupList.size(); i++) {
				sqlMapper.delete("jj.comments_delete_all", groupList.get(i));
				sqlMapper.delete("jj.likeit_delete_all", groupList.get(i));
				sqlMapper.delete("jj.ge_delete_all", groupList.get(i));
			}
			
			sqlMapper.delete("jj.group_delete_where_m_no", getM_no());
			sqlMapper.delete("jj.member_delete_where_m_no", getM_no());

		} catch (Exception e) {
			System.out.println("admin delete member error : " + e.getMessage());
		}
		
		return "success";
	}
	
	
	public List<AdminReportModel> getReportList() {
		return reportList;
	}
	public void setReportList(List<AdminReportModel> reportList) {
		this.reportList = reportList;
	}
	public AdminReportModel getData() {
		return data;
	}
	public void setData(AdminReportModel data) {
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
	public int getSearchKeyR() {
		return searchKeyR;
	}
	public void setSearchKeyR(int searchKeyR) {
		this.searchKeyR = searchKeyR;
	}
	public String getSearchWordR() {
		return searchWordR;
	}
	public void setSearchWordR(String searchWordR) {
		this.searchWordR = searchWordR;
	}
	
	
}
