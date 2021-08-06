package mypage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import group.GroupModel;

import config.SqlMapper;
import util.PagingCalculator;

public class MypageZzimHistoryAction implements SessionAware{

	private SqlMapClient sqlMapper;
	
	private List<GroupModel> Zlist= new ArrayList<>();
	
	// 검색스트링과 멤버 회원번호담을 객체변수(m_no는 int니까, string이랑 int 둘다 담기위하여)
	private GroupModel groupModel;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingCalculator page;
	private Map session;
	
	
	public MypageZzimHistoryAction(){
		sqlMapper=SqlMapper.getMapper();
	}
	
	@SuppressWarnings("unchecked")
	public String execute() {
		
		try {
			
			Zlist= sqlMapper.queryForList("my.liketit_select_all", (int)session.get("session_m_no"));
			totalCount = Zlist.size();
			PagingCalculator page = new PagingCalculator("mypageZzimHistory", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			Zlist = Zlist.subList(page.getStartCount(), lastCount);
			
		} catch (SQLException e) {
			System.out.println("writeHistoryGroup : "+e.getMessage());
		}
		return "success";
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


	public Map getSession() {
		return session;
	}


	public void setSession(Map session) {
		this.session = session;
	}


	public List<GroupModel> getZlist() {
		return Zlist;
	}


	public void setZlist(List<GroupModel> zlist) {
		Zlist = zlist;
	}
	
}
		

