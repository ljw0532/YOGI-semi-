package group;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import util.FileUploadService;
import util.YogiConstants;
import util.YogiUtils;

public class CkImageUploadAction implements ServletResponseAware,ServletRequestAware{
	private int CKEditorFuncNum; //ckeditor image upload �����ѹ�
	private File upload; //ckimage ���δ����� ���޹��� file ��ü
	private String uploadFileName; //���ε��� ���� ���ϸ�
	private String uploadContentType; //���ε��� ������ ������ Ÿ��
	private String serverFullPath; //������ ���� ������ ��ü ���

	private HttpServletResponse response;
	private HttpServletRequest request;
	
	public String execute(){
		String basePath = YogiConstants.UPLOAD_TEMP_PATH; //TepConstants�� �⺻�̹��� ���ε� ��ΰ� ���� basePath�� ����.
		System.out.println(basePath);
		FileUploadService fs = new FileUploadService(); //���� ���ε� ���� fs ��ü ����.
		try {
			uploadFileName = System.currentTimeMillis()+"_"+uploadFileName; //���ε��� ���� ���ϸ� = �ý����� ����ð�+"_"+���ε��� ���� ���ϸ� ���� ����.
			serverFullPath = fs.saveFile(upload, basePath, uploadFileName); //saveFile �Լ� ���� ��  serverFullPath = basePath + "/" + fileName �� ���ϵǾ� serverFullPath ����. 
			YogiUtils.setCookie(response, YogiConstants.CKIMG_PATH, serverFullPath); //response�� ���� �̸�(TepConstants.CKIMG_PATH)�� ��(severFullPath)���� ��Ű ����.
		} catch (Exception e) {
			System.out.println("ck image upload error : "+e.getMessage());
		}
		return "success";
	}
	
	public String modify(){
		
		
		return "success";
	}

	public void setCKEditorFuncNum(int cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}

	public int getCKEditorFuncNum() {
		return CKEditorFuncNum;
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

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
