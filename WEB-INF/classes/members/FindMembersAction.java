package members;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import util.YogiConstants;


public class FindMembersAction  extends MembersModel{
	
	private SqlMapClient sqlMapper;
	private int chk=0;
	private String find_Id;
	
	public FindMembersAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String FindForm() {
		return "success";
	}
	
	public String FindId() throws Exception {
		try {
			MembersModel res = (MembersModel) sqlMapper.queryForObject("members.findId",this);
			if (res == null) 
				chk=1;
			else
				find_Id = res.getM_id();
		} catch (Exception e) {
			System.out.println("find id error : " + e.getMessage());
		}

		return "success";
	}
	
	public String FindPW() throws Exception {
		try {
			MembersModel check = (MembersModel) sqlMapper.queryForObject("members.findPW_check",this);
			if(check == null) 
				chk=1;
			else
				sqlMapper.update("members.findPW",this);
			
		} catch (Exception e) {
			System.out.println("find password error : " + e.getMessage());
		}

		return "success";
	}

	public int getChk() {
		return chk;
	}

	public String getFind_Id() {
		return find_Id;
	}

	
}
