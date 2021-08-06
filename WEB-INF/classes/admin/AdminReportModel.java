package admin;

import java.util.Date;

import members.MembersModel;

public class AdminReportModel extends MembersModel{
	// 모임 번호
			private int gg_no;

			// 모임 이름
			private String gg_name;
			
			// 주최자 번호
			private int m_no;

			// 주최 카테고리
			private String gg_category;

			// 주최 장소
			private String gg_place;

			// 주최 날짜
			private Date gg_date;

			// 간단 사항
			private String gg_simple;
			
			// 세부 사항
			private String gg_detail;
			
			// 비용
			private int gg_cost;

			// 총 인원
			private int gg_total;
			
			// 신청 가능 인원
			private int gg_enable;
			
			// 사진 첨부
			private String gg_img;
			
			// 썸네일
			private String gg_small_img;
			
			// 누적 신고 횟수
			private int gg_penalty;

			// 현재 신청한 인원
			private int gg_permit; 
			
			
			private String temp_gg_date;
			
			//좋아요 수
			private int gg_likeit;

			public int getGg_no() {
				return gg_no;
			}

			public void setGg_no(int gg_no) {
				this.gg_no = gg_no;
			}

			public String getGg_name() {
				return gg_name;
			}

			public void setGg_name(String gg_name) {
				this.gg_name = gg_name;
			}

			public int getM_no() {
				return m_no;
			}

			public void setM_no(int m_no) {
				this.m_no = m_no;
			}

			public String getGg_category() {
				return gg_category;
			}

			public void setGg_category(String gg_category) {
				this.gg_category = gg_category;
			}

			public String getGg_place() {
				return gg_place;
			}

			public void setGg_place(String gg_place) {
				this.gg_place = gg_place;
			}

			public Date getGg_date() {
				return gg_date;
			}

			public void setGg_date(Date gg_date) {
				this.gg_date = gg_date;
			}

			public String getGg_simple() {
				return gg_simple;
			}

			public void setGg_simple(String gg_simple) {
				this.gg_simple = gg_simple;
			}

			public String getGg_detail() {
				return gg_detail;
			}

			public void setGg_detail(String gg_detail) {
				this.gg_detail = gg_detail;
			}

			public int getGg_cost() {
				return gg_cost;
			}

			public void setGg_cost(int gg_cost) {
				this.gg_cost = gg_cost;
			}

			public int getGg_total() {
				return gg_total;
			}

			public void setGg_total(int gg_total) {
				this.gg_total = gg_total;
			}

			public int getGg_enable() {
				return gg_enable;
			}

			public void setGg_enable(int gg_enable) {
				this.gg_enable = gg_enable;
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

			public int getGg_penalty() {
				return gg_penalty;
			}

			public void setGg_penalty(int gg_penalty) {
				this.gg_penalty = gg_penalty;
			}

			public int getGg_permit() {
				return gg_permit;
			}

			public void setGg_permit(int gg_permit) {
				this.gg_permit = gg_permit;
			}

			public String getTemp_gg_date() {
				return temp_gg_date;
			}

			public void setTemp_gg_date(String temp_gg_date) {
				this.temp_gg_date = temp_gg_date;
			}

			public int getGg_likeit() {
				return gg_likeit;
			}

			public void setGg_likeit(int gg_likeit) {
				this.gg_likeit = gg_likeit;
			}
			
			
			
			
}
