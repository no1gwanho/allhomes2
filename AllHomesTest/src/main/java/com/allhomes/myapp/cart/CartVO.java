package com.allhomes.myapp.cart;

public class CartVO {
	private String userid;		// 회원번호
	private int m_no;
	private int pd_no;		// 제품번호
	private int num;		// 개수
	private int price;		// 가격
	private int shipping_c;
	private int discount;
	private String o_value;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getShipping_c() {
		return shipping_c;
	}
	public void setShipping_c(int shipping_c) {
		this.shipping_c = shipping_c;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getO_value() {
		return o_value;
	}
	public void setO_value(String o_value) {
		this.o_value = o_value;
	}

}