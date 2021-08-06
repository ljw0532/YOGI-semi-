package main;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import members.MembersModel;
import group.GroupModel;
import util.YogiConstants;
import config.SqlMapper;

public class MainAction implements SessionAware {
	private SqlMapClient sqlMapper;
	private Map session;
	private List<GroupModel> res;
	private List<GroupModel> add;
	String m_id;
	String m_fav_area;

	public MainAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	public String about() {
		return "success";
	}

	public String execute() throws Exception {
		session.put(YogiConstants.SAVEURI, "main.action");
		String fav_area = (String) sqlMapper.queryForObject("members.fav_area", session.get(YogiConstants.M_ID));
		String fav_field = (String) sqlMapper.queryForObject("members.fav_field", session.get(YogiConstants.M_ID));
		String[] area;
		String[] field;
		String sql = "";
		int check=0;
		
		if(fav_area != null) {
			check = 1;
			area = fav_area.split(", ");
			sql += "gg_place like ";
			for (int i = 0; i < area.length; i++) {
				sql += ("'%" + area[i] + "%'");
				if (i != area.length - 1) 
					sql += (" or gg_place like ");
				}
			}
		
		if(fav_field != null) {
			field = fav_field.split(", ");
			if(check == 1)
				sql += " or ";
			sql += " gg_category in (";
			for (int i = 0; i < field.length; i++) {
				sql += " '"+ (field[i])+"'";
				if (i != field.length - 1) 
					sql += ',';
			}
			sql += ")";
		}
		if(fav_area != null || fav_field != null)
			res= sqlMapper.queryForList("members.recommend", sql);
		else
			res= sqlMapper.queryForList("members.no_recommend");
		
		int rep=0;
		add= sqlMapper.queryForList("members.no_recommend");
		if(res.size() == 0)
			res = sqlMapper.queryForList("members.no_recommend");
		else if(res.size() < 3) {
			for(int i=0; i<3-res.size(); i++) {
				for(int j=0; j<=i; j++) {
					if(add.get(i).getGg_no() != res.get(j).getGg_no())
						rep++;
				}
				if(rep == 3-res.size())
					res.add(add.get(i));
				else
					res.add(add.get(i+3));
				rep=0;
			}
		}
	return"success";
	}
	
	

	public List<GroupModel> getRes() {
		return res;
	}

	public void setRes(List<GroupModel> res) {
		this.res = res;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

}
