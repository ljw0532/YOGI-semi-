package lendplace;

import java.util.Map;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import likeit.LikeitModel;
import members.MembersModel;
import util.YogiConstants;
import util.YogiUtils;

public class DateCheckAction implements SessionAware{
	private SqlMapClient sqlMapper;
	
	private PlacebookModel vo;
	private String l_date;
	private int l_no;
	private Map session;
	
	
	public DateCheckAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		PlacebookModel ch = new PlacebookModel();
		ch.setL_no(l_no);
		ch.setL_date(YogiUtils.dateParse(l_date));
		System.out.println(l_date);
		System.out.println(YogiUtils.dateParse(l_date));
		vo = (PlacebookModel)sqlMapper.queryForObject("dateCheck", ch);
		System.out.println(vo);
		
		if(vo == null){
			session.put(YogiConstants.REG_DATE_CHECK, "allow");
		}else{
			session.put(YogiConstants.REG_DATE_CHECK, "reject");
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
	
	
	
}