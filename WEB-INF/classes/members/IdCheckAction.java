package members;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.YogiConstants;

public class IdCheckAction implements SessionAware{
	private SqlMapClient sqlMapper;
	
	private MembersModel vo;
	private String m_id;
	private int chkId;
	private Map session;
	
	public IdCheckAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		vo = (MembersModel)sqlMapper.queryForObject("members.idCheck", getM_id());
		
		if(vo == null){
			chkId=0;
			session.put(YogiConstants.REG_ID_CHECK, "allow");
		}else{
			chkId=1;
			session.put(YogiConstants.REG_ID_CHECK, "reject");
		}
		return "success";
	}

	public MembersModel getVo() {
		return vo;
	}

	public void setVo(MembersModel vo) {
		this.vo = vo;
	}

	

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getChkId() {
		return chkId;
	}

	public void setChkId(int chkId) {
		this.chkId = chkId;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}
	
}