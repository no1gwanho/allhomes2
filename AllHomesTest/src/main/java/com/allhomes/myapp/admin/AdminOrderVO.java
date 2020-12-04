package com.allhomes.myapp.admin;

public class AdminOrderVO {
	private int pc_no; 			//주문 번호
	private int pd_no; 			//제품번호
	private String pd_name; 	//제품 명
	private int s_no; 			//스토어번호
	private String s_name; 		//스토어 이름
	private String zipcode; 	//우편번호
	private String addr; 		//주소
	private String addrdetail;	//상세주소
	private String userid; 		//주문자 id
	private String status; 		//상태
	private String pc_date; 	//구매일
	private int num;			//개수
	private String o_value;		//옵션
	private int total_p; 		//총결제액
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getO_value() {
		return o_value;
	}
	public void setO_value(String o_value) {
		this.o_value = o_value;
	}
	public int getTotal_p() {
		return total_p;
	}
	public void setTotal_p(int total_p) {
		this.total_p = total_p;
	}
	public String getPc_date() {
		return pc_date;
	}
	public void setPc_date(String pc_date) {
		this.pc_date = pc_date;
	}
	public int getPc_no() {
		return pc_no;
	}
	public void setPc_no(int pc_no) {
		this.pc_no = pc_no;
	}
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
