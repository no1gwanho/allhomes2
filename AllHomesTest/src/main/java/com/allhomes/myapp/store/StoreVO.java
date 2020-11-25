package com.allhomes.myapp.store;

public class StoreVO {
	private int s_no; //스토어번호
	private String s_num; //사업자번호
	private String s_name; //스토어명
	private String s_pic; //스토어 이미지
	private String openingdate; //입점일
	private String s_id; //판매자 아이디
	private String staff_n; //담당자 이름
	private String staff_t; //담당자 전화번호
	private String staff_e; //담당자 이메일
	private String s_homepage; //홈페이지
	private String status; //승인여부
	
	
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_pic() {
		return s_pic;
	}
	public void setS_pic(String s_pic) {
		this.s_pic = s_pic;
	}
	public String getOpeningdate() {
		return openingdate;
	}
	public void setOpeningdate(String openingdate) {
		this.openingdate = openingdate;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getStaff_n() {
		return staff_n;
	}
	public void setStaff_n(String staff_n) {
		this.staff_n = staff_n;
	}
	public String getStaff_t() {
		return staff_t;
	}
	public void setStaff_t(String staff_t) {
		this.staff_t = staff_t;
	}
	public String getStaff_e() {
		return staff_e;
	}
	public void setStaff_e(String staff_e) {
		this.staff_e = staff_e;
	}
	public String getS_homepage() {
		return s_homepage;
	}
	public void setS_homepage(String s_homepage) {
		this.s_homepage = s_homepage;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
