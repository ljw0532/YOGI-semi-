package admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.PagingCalculator;

public class AdminMemberListAction {
	private static final int SEARCHKEY_MEMBER_NAME = 0;
	private static final int SEARCHKEY_MEMBER_ID = 1;
	
	private List<MembersModel> memList = new ArrayList<>();
	private SqlMapClient sqlMapper;
	private MembersModel data;
	private int m_no;
	private Map session;
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingCalculator page;
	
	private int searchKey = -1;
	private String searchWord = "";
	
	public AdminMemberListAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	//회원 리스트 뽑는 메서드
	public String execute() {
		try {
			if(searchKey != -1 && searchWord.length() > 0){
				search();
			} else {
				memList = sqlMapper.queryForList("jj.members_select_all");
			}
			//페이징
			totalCount = memList.size();
			page = new PagingCalculator("adminMemberList", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			memList = memList.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("adminMemberList Ex : "+e.getMessage());
		}
		return "success";
	}
	
	private void search() throws SQLException{
		data = new MembersModel();
		data.setM_no(m_no);
		data.setM_name(getSearchWord());
		data.setM_id(getSearchWord());
		switch (getSearchKey()) {
		case SEARCHKEY_MEMBER_NAME:
			memList = sqlMapper.queryForList("jj.MemberList_search_m_name_select_all", data);
			break;
		case SEARCHKEY_MEMBER_ID:
			memList = sqlMapper.queryForList("jj.MemberList_search_m_id_select_all", data);
			break;
		}
	}
	
	
	public List<MembersModel> getMemList() {
		return memList;
	}

	public void setMemList(List<MembersModel> memList) {
		this.memList = memList;
	}

	public MembersModel getData() {
		return data;
	}

	public void setData(MembersModel data) {
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

	public int getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(int searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
}