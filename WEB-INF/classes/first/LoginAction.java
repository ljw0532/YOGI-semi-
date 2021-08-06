package first;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.YogiConstants;

public class LoginAction implements SessionAware{
	private SqlMapClient sqlMapper;
	private Map session;
	
	private String m_id;
	private String m_password;
	
	public String index() throws Exception{
			return "success";
	}
	
	public LoginAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String login() throws Exception{
		MembersModel data = new MembersModel();
		data.setM_id(m_id);
		data.setM_password(m_password);
		
		MembersModel resultData = (MembersModel)sqlMapper.queryForObject("members.loginCheck", data);
		
		if(resultData != null){
			session.put(YogiConstants.M_ID, resultData.getM_id());
			session.put(YogiConstants.M_NAME, resultData.getM_name());
			session.put(YogiConstants.M_NO, resultData.getM_no());
			session.put(YogiConstants.M_PHONE, resultData.getM_phone());
			
			return "success";
		}
		return "error";
	}
	
	public String logout() throws Exception{
		if(session.get(YogiConstants.M_ID) != null){
			session.remove(YogiConstants.M_ID);
			session.remove(YogiConstants.M_NAME);
			session.remove(YogiConstants.M_NO);
			session.remove(YogiConstants.M_PHONE);

			if(session.get(YogiConstants.SAVEURI) != null){
				session.remove(YogiConstants.SAVEURI);
			}
		}
		return "success";
	}
	
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

}
