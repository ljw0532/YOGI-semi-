package lendplace;

import java.io.File;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.YogiConstants;
import util.YogiUtils;

public class PlacebookAction implements SessionAware{
	private Map session;
	private SqlMapClient sqlMapper;
	private String l_date;
	private int l_no;
	private int m_no;
	
	private LendplaceModel detailData = new LendplaceModel();
	
	
	public PlacebookAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		/*
		try {
			if(session != null && session.get(YogiConstants.REG_DATE_CHECK) == null){
				return "reject";
			} else {
				if(session.get(YogiConstants.REG_DATE_CHECK).equals("reject")){
					return "reject";
				}
			}
			
			sqlMapper.insert("placebook_insert", this);
		} catch (Exception e) {
			System.out.println("placebook insert e : "+e.getMessage());
		}*/
		setM_no(m_no);
		try {
			PlacebookModel ch = new PlacebookModel();
			ch.setL_no(l_no);
			ch.setM_no(m_no);
			ch.setL_date(YogiUtils.dateParse(l_date));
			sqlMapper.insert("placebook_insert", ch);
		}catch(Exception e) {
			System.out.println("placebook insert e : "+e.getMessage());
			
		}
		
	return "success";
}
	
	public String delete(){
		try {
			detailData = (LendplaceModel) sqlMapper.queryForObject("lendplace_select_one",getL_no());
			
			sqlMapper.delete("placebook_delete",getL_no()); //getL_no
		} catch (Exception e) {
			System.out.println("placebook delete error : "+e.getMessage());
		}
		return "success";
	}


	
@Override
public void setSession(Map session) {
	this.session = session;
}

public String getL_date() {
	return l_date;
}

public void setL_date(String l_date) {
	this.l_date = l_date;
}

public int getL_no() {
	return l_no;
}

public void setL_no(int l_no) {
	this.l_no = l_no;
}

public int getM_no() {
	return m_no;
}

public void setM_no(int m_no) {
	this.m_no = m_no;
}


}

