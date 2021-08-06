package lendplace;

import java.util.Date;

//대관신청 테이블
public class LendplaceModel {

	//장소번호 
    private int l_no;
    
    //제목
	private String l_subject;
	
	//장소(세부주소)
	private String l_addr;
	
	//내용 
	private String l_content;
	
	//리스트 대표 이미지 
	private String l_rep_img;
	
	//모임인원 
	private int l_enable;
	
	//대관시작날짜 
	private Date l_sdate;
	
	//대관종료날
	private Date l_edate;
	
	//예약여부
	private int l_reserve;
	
	//유/무료 여부 
	private int l_payment;
	
	//회원번호
	private int m_no;
		
	
	// 장소등록시 날짜부분이 스트링값으로 넘어와 String 날짜변수생성
	private String l_t_sdate; //대관시작
	private String l_t_edate; //대관종료
	
	
	public int getL_no() {
		return l_no;
	}
	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	public String getL_subject() {
		return l_subject;
	}
	public void setL_subject(String l_subject) {
		this.l_subject = l_subject;
	}
	public String getL_addr() {
		return l_addr;
	}
	public void setL_addr(String l_addr) {
		this.l_addr = l_addr;
	}
	public String getL_content() {
		return l_content;
	}
	public void setL_content(String l_content) {
		this.l_content = l_content;
	}
	public String getL_rep_img() {
		return l_rep_img;
	}
	public void setL_rep_img(String l_rep_img) {
		this.l_rep_img = l_rep_img;
	}
	public int getL_enable() {
		return l_enable;
	}
	public void setL_enable(int l_enable) {
		this.l_enable = l_enable;
	}

	public Date getL_sdate() {
		return l_sdate;
	}
	public void setL_sdate(Date l_sdate) {
		this.l_sdate = l_sdate;
	}
	public Date getL_edate() {
		return l_edate;
	}
	public void setL_edate(Date l_edate) {
		this.l_edate = l_edate;
	}
	public int getL_reserve() {
		return l_reserve;
	}
	public void setL_reserve(int l_reserve) {
		this.l_reserve = l_reserve;
	}
	public int getL_payment() {
		return l_payment;
	}
	public void setL_payment(int l_payment) {
		this.l_payment = l_payment;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getL_t_sdate() {
		return l_t_sdate;
	}
	public void setL_t_sdate(String l_t_sdate) {
		this.l_t_sdate = l_t_sdate;
	}
	public String getL_t_edate() {
		return l_t_edate;
	}
	public void setL_t_edate(String l_t_edate) {
		this.l_t_edate = l_t_edate;
	}
	
}