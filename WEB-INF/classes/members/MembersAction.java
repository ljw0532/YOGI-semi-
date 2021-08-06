package members;

import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import util.YogiConstants;

public class MembersAction extends MembersModel implements SessionAware{
	
	private SqlMapClient sqlMapper;
	private Map session;

	public MembersAction() {
		sqlMapper = SqlMapper.getMapper();
	}

	public String MemberForm() {
		return "success";
	}
	
	public String ModifyForm() {
		return "success";
	}

	public String Insert() throws Exception {
		try {
			if(session != null && session.get(YogiConstants.REG_ID_CHECK) == null){
				return "reject";
			} else {
				if(session.get(YogiConstants.REG_ID_CHECK).equals("reject")){
					return "reject";
				}
			}

			setM_date(Calendar.getInstance().getTime());
			sqlMapper.insert("members.insertMember", this);
			
		} catch (Exception e) {
			System.out.println("member insert error : " + e.getMessage());
		}

		return "success";
	}
	
	public String Modify() throws Exception {
		try {
			sqlMapper.update("members.updateMember", this);

		} catch (Exception e) {
			System.out.println("member update error : " + e.getMessage());
		}

		return "success";
	}
	
	public String Delete() throws Exception {
		try {
			sqlMapper.delete("members.deleteMember", session.get(YogiConstants.M_ID));
			sqlMapper.delete("members.deleteGroup", (int)session.get(YogiConstants.M_NO));

		} catch (Exception e) {
			System.out.println("member delete error : " + e.getMessage());
		}
		return "success";
	}
	

	@Override
	public void setSession(Map session) {
		this.session = session;
	}
}
