package mypage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import group.GroupModel;

import members.MembersModel;
import group.GroupEnrollModel;
import util.PagingCalculator;
import util.YogiConstants;
public class MypageMeetHistoryAction extends GroupModel implements SessionAware{
	private List<GroupEnrollModel> gelist;
	private List<GroupModel> Mlist = new ArrayList<>();
	
	private SqlMapClient sqlMapper;
	private Map session;
	
	private MembersModel data;
	private MypageReportModel reportModel;
	private int m_no;
	private int gg_no;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 3;
	private String pagingHtml;
	
	List<Integer> reportList = new ArrayList<Integer>();
	
	public MypageMeetHistoryAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	@SuppressWarnings("unchecked")
	public String execute(){
		try {
			int m_no = (int) session.get(YogiConstants.M_NO);
			gelist = sqlMapper.queryForList("my.groupenroll_select_all",m_no);
			for(GroupEnrollModel data : gelist){
				Mlist.add((GroupModel) sqlMapper.queryForObject("my.groupgatheringHistory_select_all",data.getGg_no()));
			}
			
			totalCount = Mlist.size();
			PagingCalculator page = new PagingCalculator("mypageMeetHistory", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			for (int i = 0; i < Mlist.size(); i++) {
				System.out.println(Mlist.get(i).getGg_img());
			}
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			Mlist = Mlist.subList(page.getStartCount(), lastCount);
			for(int i=0; i<Mlist.size(); i++) {
				reportModel = new MypageReportModel();
				reportModel.setGg_no(Mlist.get(i).getGg_no());
				reportModel.setM_no(m_no);
				MypageReportModel gg_no1 = (MypageReportModel) sqlMapper.queryForObject("my.myReportList",reportModel);
				if(gg_no1 != null) {
					reportList.add(gg_no1.getGg_no());
				}else {
					reportList.add(-1);
				}
				
			}
			
		} catch (Exception e) {
			System.out.println("mypageMeetHistory Ex : "+e.getMessage());
		}
		return "success";
	}
	

	
	public void setData(MembersModel data) {
		this.data = data;
	}

	public MembersModel getData() {
		return data;
	}

	
	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public List<GroupEnrollModel> getGelist() {
		return gelist;
	}

	public void setGelist(List<GroupEnrollModel> gelist) {
		this.gelist = gelist;
	}

	public List<GroupModel> getMlist() {
		return Mlist;
	}

	public void setMlist(List<GroupModel> mlist) {
		Mlist = mlist;
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

	public int getGg_no() {
		return gg_no;
	}

	public void setGg_no(int gg_no) {
		this.gg_no = gg_no;
	}

	public List<Integer> getReportList() {
		return reportList;
	}

	public void setReportList(List<Integer> reportList) {
		this.reportList = reportList;
	}

	public MypageReportModel getReportModel() {
		return reportModel;
	}

	public void setReportModel(MypageReportModel reportModel) {
		this.reportModel = reportModel;
	}
	
	
	

	
	
}
