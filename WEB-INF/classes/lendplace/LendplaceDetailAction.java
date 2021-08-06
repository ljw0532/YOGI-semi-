package lendplace;
import java.io.File;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import lendplace.LendplaceModel;
import util.YogiUtils;

public class LendplaceDetailAction implements SessionAware, ServletRequestAware{
	private LendplaceModel detailData = new LendplaceModel();
	private SqlMapClient sqlMapper;
	private int currentPage;
	private int l_no;
	
	private Map session;
	private HttpServletRequest request;
	
	
	public LendplaceDetailAction(){
		sqlMapper=SqlMapper.getMapper();
	}
	public String execute(){
		YogiUtils.savePageURI(request, session);
		try {
			detailData = (LendplaceModel) sqlMapper.queryForObject("lendplace_select_one", getL_no());
		} catch (SQLException e) {
			System.out.println("lendplace_select_one EX : "+e.getMessage());
		}
		return "success";
	}
	
	public String delete(){
		try {
			detailData = (LendplaceModel) sqlMapper.queryForObject("lendplace_select_one",getL_no());
			
			File deleteFile = new File(detailData.getL_rep_img());
			deleteFile.delete();
			
			sqlMapper.delete("lendplace_delete",getL_no()); //getL_no
		} catch (Exception e) {
			System.out.println("lendplace delete error : "+e.getMessage());
		}
		return "success";
	}
	
	
	public LendplaceModel getDetailData() {
		return detailData;
	}

	public void setDetailData(LendplaceModel detailData) {
		this.detailData = detailData;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getL_no() {
		return l_no;
	}

	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}

