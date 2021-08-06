package admin;

import java.util.Date;

import lendplace.LendplaceModel;

public class AdminPlaceModel extends LendplaceModel{
	private String m_id;
	
	private Date l_date;

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public Date getL_date() {
		return l_date;
	}

	public void setL_date(Date l_date) {
		this.l_date = l_date;
	}
	
	
}
