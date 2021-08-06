package group;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.YogiUtils;

public class GroupEnrollAction extends GroupEnrollModel implements SessionAware{
	private Map session;
	private SqlMapClient sqlMapper;
	
	private MembersModel mData;
	private GroupModel detailData;
	
	private int gg_enable;
	
	public GroupEnrollAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
	try {
		detailData = (GroupModel) sqlMapper.queryForObject("jj.group_select_one", getGg_no());
		detailData.setGg_permit(detailData.getGg_total()-detailData.getGg_enable());	
		mData = (MembersModel) sqlMapper.queryForObject("jj.members_select_one_where_m_no",session.get("session_m_no"));
	} catch (SQLException e) {
		System.out.println("subscribe select e : "+e.getMessage());
	}
	return "success";
}

public String insert() {
	detailData = new GroupModel();
	detailData.setGg_no(getGg_no());
	detailData.setGg_enable(gg_enable+1);
	
	try {
		sqlMapper.update("jj.group_update_current_p", detailData);
	} catch (Exception e) {
		System.out.println("current pnum update e : "+e.getMessage());
	};
	
	setGg_no(getGg_no());
	setM_no((Integer) session.get("session_m_no"));
	try {
		sqlMapper.insert("jj.ge_insert", this);
	} catch (Exception e) {
		System.out.println("subscribe insert e : "+e.getMessage());
	}
	
	return "success";
	
}

public String delete() {
	detailData = new GroupModel();
	detailData.setGg_no(getGg_no());
	detailData.setGg_enable(gg_enable-1);
	
	setM_no((Integer) session.get("session_m_no"));
	try {
		sqlMapper.update("jj.group_delete_current_p", detailData);
	} catch (Exception e) {
		System.out.println("current pnum update e : "+e.getMessage());
	};
	
	setGg_no(getGg_no());
	setM_no((Integer) session.get("session_m_no"));
	try {	
	sqlMapper.delete("jj.ge_delete",this);
	} catch(Exception e) {
	
	}
	return "success";
}

	
@Override
public void setSession(Map session) {
	this.session = session;
}

public GroupModel getDetailData() {
	return detailData;
}

public MembersModel getmData() {
	return mData;
}

public int getGg_enable() {
	return gg_enable;
}

public void setGg_enable(int gg_enable) {
	this.gg_enable = gg_enable;
}


}

