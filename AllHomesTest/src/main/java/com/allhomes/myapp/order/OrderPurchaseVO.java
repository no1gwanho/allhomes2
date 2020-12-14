package com.allhomes.myapp.order;

public class OrderPurchaseVO {
	
	private String c_no; //장바구니 번호
	private int a_code; //배송지 번호
	private int m_no; //회원번호
	private String userid; //회원 아이디
	private int shipping_c; //배송비
	private int total_p; //총 가격(제품)
	private String payment; //결제 유형
	private String memo; //배송메모
	private String email; //이메일
	private String tel; //전화번호
	private String username; //수신자 
	
	

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getC_no() {
		return c_no;
	}
	public void setC_no(String c_no) {
		this.c_no = c_no;
	}
	public int getA_code() {
		return a_code;
	}
	public void setA_code(int a_code) {
		this.a_code = a_code;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getShipping_c() {
		return shipping_c;
	}
	public void setShipping_c(int shipping_c) {
		this.shipping_c = shipping_c;
	}
	public int getTotal_p() {
		return total_p;
	}
	public void setTotal_p(int total_p) {
		this.total_p = total_p;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
}
