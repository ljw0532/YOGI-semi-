package mypage;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;

public class MypageAction extends MembersModel implements SessionAware {
	private SqlMapClient sqlMapper;
	private Map session;

	private MembersModel resultClass;
	
	public MypageAction() {
		sqlMapper = SqlMapper.getMapper();
	}

	public String execute() throws Exception {
		if (session.get("session_m_id") == null) {
			return "sessionError";
		}
		else if( session.get("session_m_id").equals("admin" )) {
			return "admin";
		}
		
		
		resultClass = (MembersModel) sqlMapper.queryForObject("my.selectOneMember", session.get("session_m_id"));
		return "success";
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public MembersModel getResultClass() {
		return resultClass;
	}
}
