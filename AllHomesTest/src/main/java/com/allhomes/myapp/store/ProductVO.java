package com.allhomes.myapp.store;

public class ProductVO {
	private int pd_no;			// 제품번호
	private int s_no;			// 스토어번호
	private String pd_name;		// 제품명
	private int price;			// 가격
	private int discount;		// 할인가격
	private String main_img;	// 썸네일대표이미지
	private int stock;			// 재고
	private String status;		// 상태(품절임박, 입고예정 등)
	private String sub_c;		// 서브카테고리
	
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSub_c() {
		return sub_c;
	}
	public void setSub_c(String sub_c) {
		this.sub_c = sub_c;
	}	
}