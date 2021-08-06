package lendplace;
import java.io.File;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import util.FileUploadService;
import util.YogiConstants;
import util.YogiUtils;

public class LendplaceFormAction extends LendplaceModel implements ServletRequestAware,SessionAware{
	private SqlMapClient sqlMapper;
	
	private File upload; //업로드할 실제파일
	private String uploadFileName; //업로드할 로컬 파일명
	private String uploadContentType; //업로드할 파일의 컨텐츠 타입
	private String serverFullPath; //저장할 실제 파일의 전체 경로

	private Map session;
	private HttpServletRequest request;
	
	public LendplaceFormAction(){
		sqlMapper=SqlMapper.getMapper();
	}
	
	public String execute(){
		return "success";
	}
	
	
	public String insert() throws Exception{
		String basePath = YogiConstants.UPLOAD_TEMP_PATH;
		FileUploadService fs = new FileUploadService();
		try {
			uploadFileName = System.currentTimeMillis()+"_"+uploadFileName;
			serverFullPath = fs.saveFile(upload, basePath, uploadFileName);
		} catch (Exception e) {
			System.out.println("file upload error : "+e.getMessage());
		}
		
		try {
			int m_no = (int) session.get("session_m_no"); //세션에 저장된 회원번호를 가져와서 (로그인한 회원)
		    setL_sdate(YogiUtils.dateParse(getL_t_sdate())); //시작날짜
			setL_edate(YogiUtils.dateParse(getL_t_edate())); //끝날짜
			setL_rep_img(serverFullPath); //대표 이미지
			setM_no(m_no); //회원번호
	
			sqlMapper.insert("lendplace_insert",this);
			//lendplace_insert 쿼리문으로 데이터(장소) 등록.
			
		} catch (Exception e) {
			System.out.println("LendplaceFormAction insert ex : "+e.getMessage());
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
	public Map getSession() {
		return session;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
}
