package mypage;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import members.MembersModel;
import mypage.MypageReportModel;
import group.GroupModel;
import lendplace.LendplaceModel;
import config.SqlMapper;

public class MypageReportAction implements SessionAware {
	
	private Map session;
	private SqlMapClient sqlMapper;
	private int m_no;
	private int gg_no;
	

	
	private MembersModel Mdata;
	private GroupModel Gdata;
	
	private GroupModel groupmodel = new GroupModel();
	
	public MypageReportAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	
	public String execute(){
	

		try {
			MypageReportModel rp = new MypageReportModel();
			rp.setGg_no(gg_no); //그룹 번호
			rp.setM_no(m_no); //내 번호
			sqlMapper.insert("my.report_insert",rp);
			
			Gdata = (GroupModel)sqlMapper.queryForObject("jj.group_select_one",gg_no);
			sqlMapper.update("my.gg_update_penalty",gg_no);
			sqlMapper.update("my.mb_update_penalty",Gdata.getM_no());//그룹 개설한 사람 번호
			
			
		}catch(Exception e) {
			System.out.println("report insert e : "+e.getMessage());
			
		}
		
	return "success";

	}
	public String cancel() throws Exception{
		
		try {
			groupmodel = (GroupModel) sqlMapper.queryForObject("jj.group_select_one",getGg_no());
			
			sqlMapper.delete("my.report_cancel",getGg_no()); //getL_no
		} catch (Exception e) {
			System.out.println("placebook delete error : "+e.getMessage());
		}
		return "success";
		
	}
	

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public int getGg_no() {
		return gg_no;
	}

	public void setGg_no(int gg_no) {
		this.gg_no = gg_no;
	}
	

	public MembersModel getMdata() {
		return Mdata;
	}

	public void setMdata(MembersModel mdata) {
		Mdata = mdata;
	}

	public GroupModel getGdata() {
		return Gdata;
	}

	public void setGdata(GroupModel gdata) {
		Gdata = gdata;
	}

	
	

}
