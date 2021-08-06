package admin;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;


public class AdminAction implements SessionAware{
	private Map session;
	private SqlMapClient sqlMapper;
	private MembersModel resultClass;
	
	public AdminAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	//관리자 페이지 view 띄움
	public String execute() throws Exception{
		/*if (session.get("m_no") == null) {
			return "sessionError";
		}
		
		resultClass = (MembersModel) sqlMapper.queryForObject("jj.members_select_one", 0);
		*/
		return "success";
	}
	

	@Override
	public void setSession(Map session) {
		this.session = session;
		
	}
	
}
