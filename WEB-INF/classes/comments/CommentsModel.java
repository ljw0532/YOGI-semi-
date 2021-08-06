package comments;

import java.util.Date;

public class CommentsModel {
	private int c_no; //댓글 번호
	private int m_no; //작성자 번호
	private String c_content; //댓글내용
	private Date c_date; //댓글날짜
	private int gg_no; //모임번호
	private String m_name; //작성자
	
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	
	public int getGg_no() {
		return gg_no;
	}
	public void setGg_no(int gg_no) {
		this.gg_no = gg_no;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	
}
