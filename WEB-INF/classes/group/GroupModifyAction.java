package group;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import comments.CommentsModel;
import config.SqlMapper;
import util.FileUploadService;
import util.YogiConstants;
import util.YogiUtils;
import members.MembersModel;

public class GroupModifyAction extends GroupModel implements SessionAware, ServletRequestAware, ServletResponseAware {
	private List<CommentsModel> cmtData = new ArrayList<CommentsModel>();
	private SqlMapClient sqlMapper;
	private Map session;

	private File upload; // 업로드할 실제파일
	private String uploadFileName; // 업로드할 로컬 파일명
	private String uploadContentType; // 업로드할 파일의 컨텐츠 타입
	private String serverFullPath; // 저장할 실제 파일의 전체 경로
	private String uploadSmallFileName;// 썸네일 파일명
	private String serverSmallFullPath;// 저장할 썸네일 파일의 전체 경로
	
	private GroupModel detailData;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private int gg_no;
	private int m_no;
	
	private String gg_img;
	private String gg_small_img;
	private String gg_mdate;
	
	private int gg_cost;
	private String gg_detail;
	private String gg_simple;
	private String gg_place;
	private int m_grade;
	
	
	public GroupModifyAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	public String execute() {
		YogiUtils.savePageURI(request, session);
		try {
			detailData = (GroupModel) sqlMapper.queryForObject("jj.group_select_one", getGg_no());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return "success";
	}
	
	public String modify() {

		try {			
			System.out.println(getGg_detail());
			System.out.println(getGg_cost());
			System.out.println(getGg_simple());
			System.out.println(getGg_place());
			System.out.println(getGg_mdate());
					
			setGg_date(YogiUtils.dateParse(getGg_mdate()));
			System.out.println(getGg_date());
			
			sqlMapper.update("jj.group_update", this);
		}catch(Exception e){
			System.out.println("file upload error : " + e.getMessage());
		}
	
		return "success";
	}
	
	
	public String delete() {
	    	MembersModel mModel = new MembersModel();
	    	int m_no =(int) session.get("session_m_no");
			mModel.setM_no((int) m_no);
	   try {
	      detailData = (GroupModel) sqlMapper.queryForObject("jj.group_select_one", getGg_no());
	      
	      File deleteImg = new File(detailData.getGg_img());
	      deleteImg.delete();

	      File deleteThemnailImg = new File(detailData.getGg_small_img());
	      deleteThemnailImg.delete(); 
	      mModel.setM_grade(m_grade-10);
	      System.out.println(m_no);
	      System.out.println(m_grade);
	      sqlMapper.update("jj.members_grade", mModel);
	      sqlMapper.delete("jj.comments_delete_all", getGg_no());
	      sqlMapper.delete("jj.ge_delete_all", getGg_no());
	      sqlMapper.delete("jj.likeit_delete_all", getGg_no());
	      sqlMapper.delete("jj.group_delete", detailData.getGg_no());
	      
	   } catch (SQLException e) {
	   System.out.println(e.getMessage());
	   }
	   return "success";
	}
	
	
	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public String getUploadSmallFileName() {
		return uploadSmallFileName;
	}

	public void setUploadSmallFileName(String uploadSmallFileName) {
		this.uploadSmallFileName = uploadSmallFileName;
	}

	public String getServerSmallFullPath() {
		return serverSmallFullPath;
	}

	public void setServerSmallFullPath(String serverSmallFullPath) {
		this.serverSmallFullPath = serverSmallFullPath;
	}

	public GroupModel getDetailData() {
		return detailData;
	}

	public void setDetailData(GroupModel detailData) {
		this.detailData = detailData;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public int getGg_no() {
		return gg_no;
	}

	public void setGg_no(int gg_no) {
		this.gg_no = gg_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public Map getSession() {
		return session;
	}

	public HttpServletRequest getRequest() {
		return request;
	}


	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getServerFullPath() {
		return serverFullPath;
	}

	public void setServerFullPath(String serverFullPath) {
		this.serverFullPath = serverFullPath;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		
	}

	public String getGg_img() {
		return gg_img;
	}

	public void setGg_img(String gg_img) {
		this.gg_img = gg_img;
	}

	public String getGg_small_img() {
		return gg_small_img;
	}

	public void setGg_small_img(String gg_small_img) {
		this.gg_small_img = gg_small_img;
	}
	public String getGg_mdate() {
		return gg_mdate;
	}
	public void setGg_mdate(String gg_mdate) {
		this.gg_mdate = gg_mdate;
	}
	public int getGg_cost() {
		return gg_cost;
	}
	public void setGg_cost(int gg_cost) {
		this.gg_cost = gg_cost;
	}
	public String getGg_detail() {
		return gg_detail;
	}
	public void setGg_detail(String gg_detail) {
		this.gg_detail = gg_detail;
	}
	public String getGg_simple() {
		return gg_simple;
	}
	public void setGg_simple(String gg_simple) {
		this.gg_simple = gg_simple;
	}
	public String getGg_place() {
		return gg_place;
	}
	public void setGg_place(String gg_place) {
		this.gg_place = gg_place;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	
	
}
