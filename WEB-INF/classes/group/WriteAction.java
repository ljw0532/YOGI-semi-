package group;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.FileUploadService;
import util.YogiConstants;
import util.YogiUtils;

public class WriteAction extends GroupModel implements SessionAware{
	private SqlMapClient sqlMapper;
	private Map session;

	private File upload; //업로드할 실제파일
	private String uploadFileName; //업로드할 로컬 파일명
	private String uploadContentType; //업로드할 파일의 컨텐츠 타입
	private String serverFullPath; //저장할 실제 파일의 전체 경로
	private String uploadSmallFileName;//썸네일 파일명
	private String serverSmallFullPath;//저장할 썸네일 파일의 전체 경로
	
	private HttpServletRequest request;
	private int m_grade;
	private int m_no1;
	
	public WriteAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		return "success";
	}
	
	public String insert() {
		String basePath = YogiConstants.UPLOAD_TEMP_PATH;
		String basePathSmall = YogiConstants.UPLOAD_TEMP_THEMNAIL_PATH;
		
		FileUploadService fs = new FileUploadService();
		
		MembersModel mModel = new MembersModel();
		int m_no1 =(int) session.get("session_m_no");
		mModel.setM_no((int) m_no1);
		
		try {
			uploadFileName = System.currentTimeMillis()+"_"+uploadFileName;
			serverFullPath = fs.saveFile(upload, basePath, uploadFileName);
			uploadSmallFileName = System.currentTimeMillis()+"_small_"+uploadSmallFileName;
			serverSmallFullPath = fs.saveFile(upload, basePathSmall, uploadSmallFileName);
			File srcFile = new File(serverFullPath);
			File smallFile = new File(serverSmallFullPath+".jpg");
			fs.resize(srcFile, smallFile, 305, 254);
		} catch (IOException e) {
			System.out.println("file upload error : "+e.getMessage());
		}
		
		try {

			int m_no = (int) session.get("session_m_no");
			

			/*GroupOpenModel mdata = (GroupOpenModel) sqlMapper.queryForObject("jis.members_select_one_where_m_no",m_no);
			*/

			setGg_img(serverFullPath);
			setGg_small_img(serverSmallFullPath);
			
			try {
				setGg_date(YogiUtils.dateParse(getTemp_gg_date()));
				System.out.println(getTemp_gg_date());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			setM_no(m_no);		
			sqlMapper.insert("jj.group_insert",this);
			mModel.setM_grade(m_grade+10);
			sqlMapper.update("jj.members_grade", mModel);
		} catch (SQLException e) {
			System.out.println("openmeet insert error : "+e.getMessage());
		}
		
		return "success";
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
