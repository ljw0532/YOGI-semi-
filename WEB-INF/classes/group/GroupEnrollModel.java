package group;

public class GroupEnrollModel {
	private int ge_no; //모임 신청 번호
	private int gg_no; //모임 번호
	private int m_no; //신청자 번호
	private String m_name; //
	
	
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getGe_no() {
		return ge_no;
	}
	public void setGe_no(int ge_no) {
		this.ge_no = ge_no;
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
	
}
