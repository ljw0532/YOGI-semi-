package group;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletResponseAware;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import comments.CommentsModel;
import config.SqlMapper;
import group.GroupModel;
import members.MembersModel;
import util.PagingCalculator;
import util.YogiConstants;
import util.YogiUtils;

import likeit.LikeitModel;

public class GroupDetailAction implements SessionAware, ServletRequestAware, ServletResponseAware {

	private GroupModel detailData;
	private List<CommentsModel> cmtData = new ArrayList<CommentsModel>();
	private List<GroupModel> list = new ArrayList<GroupModel>();
	private List<GroupEnrollModel> gelist = new ArrayList<GroupEnrollModel>();	
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 6; 
	private int blockPage = 3;
	private HttpServletResponse response;
	private HttpServletRequest request;
	private String pagingHtml;
	
	private SqlMapClient sqlMapper;
	private int gg_no;
	private int c_no;
	private int m_no;
	private String c_content;
	private String likeIt;
	private String enroll;
	private int check_li=0;
	private int check_enroll=0;
	private int gg_enable;
	private int m_grade;
	private int m_no1;
	
	private Map session;
	
	
	public GroupDetailAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	

	public String execute() throws Exception {
		YogiUtils.savePageURI(request, session);
		try {
			
			detailData = (GroupModel) sqlMapper.queryForObject("jj.group_select_one", getGg_no()); 
			cmtData = sqlMapper.queryForList("jj.comments_select_all_gg_no",getGg_no());					
			gelist = sqlMapper.queryForList("jj.groupenroll_select_all", getGg_no());
			detailData.setGg_host( (String)sqlMapper.queryForObject("jj.get_host", detailData.getM_no()));
			
			LikeitModel likeitData = new LikeitModel();
			likeitData.setGg_no(getGg_no()); //
			likeitData.setM_no((int) session.get(YogiConstants.M_NO));
			//찜하기 표시
			if(getCheck_li()==0)
			{
				LikeitModel check = (LikeitModel)sqlMapper.queryForObject("jj.likeit_select_exist",likeitData);
				if(check != null)
					detailData.setGg_Ilikeit( Integer.toString(check.getLi_no()) );
				else
					detailData.setGg_Ilikeit(null);
			}
			else
				detailData.setGg_Ilikeit(getLikeIt());
			
			//신청하기 표시
			if(getCheck_enroll()==0)
			{
				GroupEnrollModel check = (GroupEnrollModel)sqlMapper.queryForObject("jj.groupenroll_select_m_no",likeitData);
				if(check != null)
					detailData.setGg_Ienroll( Integer.toString(check.getGe_no()) );
				else
					detailData.setGg_Ienroll(null);
				
			}
			else
				detailData.setGg_Ienroll(getEnroll());
			
			detailData.setGg_permit(detailData.getGg_total()-detailData.getGg_enable());
			
		
			} catch (SQLException e) {
			System.out.println("openmeet detail e : "+e.getMessage());
		}
		return "success";
	}

	@SuppressWarnings("unchecked")

	public String insertComments() throws Exception{
		MembersModel mModel = new MembersModel();
		int m_no1 =(int) session.get("session_m_no");
		mModel.setM_no((int) m_no1);
		try {				
			//insertComments()
			CommentsModel data = new CommentsModel();
			data.setC_content(getC_content());
			data.setC_date(Calendar.getInstance().getTime());
			data.setGg_no(getGg_no());
			data.setM_no((Integer) session.get("session_m_no"));
			
			mModel.setM_grade(m_grade+1);
			sqlMapper.update("jj.members_grade", mModel);	
			sqlMapper.insert("jj.comments_insert", data);
			execute();
		} catch (Exception e) {
			System.out.println("ggd insert cmt e : "+e.getMessage());
		}
		
		execute();
		
		return "success";
	}
	
	public String deleteComments() throws Exception{
		MembersModel mModel = new MembersModel();
		int m_no1 =(int) session.get("session_m_no");
		mModel.setM_no((int) m_no1);
		try {
			CommentsModel data = new CommentsModel();
			data.setC_no(c_no);
			mModel.setM_grade(m_grade-1);
			sqlMapper.update("jj.members_grade", mModel);	
			sqlMapper.delete("jj.comments_delete", data);
		} catch (Exception e) {
			System.out.println("ggd delete cmt e : "+e.getMessage());
		}
		execute();
		return "success";
	}
	
	public String likeit() throws Exception{
		try {
			LikeitModel likeitData = new LikeitModel();
			
			likeitData.setGg_no(gg_no); //
			likeitData.setM_no((int) session.get(YogiConstants.M_NO)); //
			
			LikeitModel check = (LikeitModel) sqlMapper.queryForObject("jj.likeit_select_exist",likeitData);
			if(check == null){   
				setCheck_li(1);
				sqlMapper.insert("jj.likeit_insert_group",likeitData);
				setLikeIt("likeIt");
			} else {	 
				sqlMapper.delete("jj.likeit_delete",likeitData);
				setCheck_li(0);
				setLikeIt(null);
			}
			execute();
		} catch (Exception e) {
			System.out.println("likeit insert error : "+e.getMessage());
		}
		return "success";
	}
	
	public String enroll() throws Exception{
		try {
			LikeitModel likeitData = new LikeitModel();
			detailData = new GroupModel();
			detailData.setGg_no(getGg_no());
			
			MembersModel mModel = new MembersModel();
			mModel.setM_no((int) session.get(YogiConstants.M_NO));
			
			likeitData.setGg_no(gg_no); //
			likeitData.setM_no((int) session.get(YogiConstants.M_NO)); //
			
			GroupEnrollModel check = (GroupEnrollModel) sqlMapper.queryForObject("jj.groupenroll_select_m_no",likeitData);
			if(check == null){ 
				setCheck_enroll(1);
				mModel.setM_grade(m_grade+5);
				detailData.setGg_enable(gg_enable+1);
				sqlMapper.update("jj.members_grade", mModel);
				sqlMapper.update("jj.group_update_current_p", detailData);
				sqlMapper.insert("jj.ge_insert",likeitData);
				setEnroll("Enroll");
			} else {
				detailData.setGg_enable(gg_enable-1);
				mModel.setM_grade(m_grade-5);
				sqlMapper.update("jj.members_grade", mModel);
				sqlMapper.update("jj.group_delete_current_p", detailData);
				sqlMapper.delete("jj.ge_delete",likeitData);
				setCheck_enroll(0);
				setEnroll(null);
			}
			execute();
		} catch (Exception e) {
			System.out.println("likeit insert error : "+e.getMessage());
		}
		return "success";
	}
		
	
	public int getGg_no() {
		return gg_no;
	}
	public void setGg_no(int gg_no) {
		this.gg_no = gg_no;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public List<GroupEnrollModel> getGelist() {
		return gelist;
	}


	public void setGelist(List<GroupEnrollModel> gelist) {
		this.gelist = gelist;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getBlockCount() {
		return blockCount;
	}


	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}


	public int getBlockPage() {
		return blockPage;
	}


	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}


	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	public GroupModel getDetailData() {
		return detailData;
	}

	public void setDetailData(GroupModel detailData) {
		this.detailData = detailData;
	}

	public List<CommentsModel> getCmtData() {
		return cmtData;
	}

	public void setCmtData(List<CommentsModel> cmtData) {
		this.cmtData = cmtData;
	}

	public List<GroupModel> getList() {
		return list;
	}

	public void setList(List<GroupModel> list) {
		this.list = list;
	}


	public int getM_no() {
		return m_no;
	}


	public void setM_no(int m_no) {
		this.m_no = m_no;
	}


	public String getLikeIt() {
		return likeIt;
	}


	public void setLikeIt(String likeIt) {
		this.likeIt = likeIt;
	}


	public int getCheck_li() {
		return check_li;
	}

	public void setCheck_li(int check_li) {
		this.check_li = check_li;
	}


	public int getCheck_enroll() {
		return check_enroll;
	}


	public void setCheck_enroll(int check_enroll) {
		this.check_enroll = check_enroll;
	}


	public String getEnroll() {
		return enroll;
	}


	public void setEnroll(String enroll) {
		this.enroll = enroll;
	}


	public int getGg_enable() {
		return gg_enable;
	}


	public void setGg_enable(int gg_enable) {
		this.gg_enable = gg_enable;
	}


	public int getM_grade() {
		return m_grade;
	}


	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}


	public int getM_no1() {
		return m_no1;
	}


	public void setM_no1(int m_no1) {
		this.m_no1 = m_no1;
	}	
	
}
