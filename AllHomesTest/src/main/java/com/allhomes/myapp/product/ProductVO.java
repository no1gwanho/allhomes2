package com.allhomes.myapp.product;

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
	private String pd_img;      // 제품 설명사진(여러개 가능)
	private String pd_exp;      // 짧은 제품설명
	private int shipping_c;		// 배송비
	private String o_value;		//옵션
	private String main_c;		//메인카테고리
	private int wishlist;		//위시리스트 (혹시몰라추가 -은지)
	private int sale;			//판매 (혹시몰라추가 -은지)ㅊ
	

	
	
	public String getMain_c() {
		return main_c;
	}
	public void setMain_c(String main_c) {
		this.main_c = main_c;
	}
	public int getWishlist() {
		return wishlist;
	}
	public void setWishlist(int wishlist) {
		this.wishlist = wishlist;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
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
	public String getPd_img() {
		return pd_img;
	}
	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
	}
	public String getPd_exp() {
		return pd_exp;
	}
	public void setPd_exp(String pd_exp) {
		this.pd_exp = pd_exp;
	}
	public int getShipping_c() {
		return shipping_c;
	}
	public void setShipping_c(int shipping_c) {
		this.shipping_c = shipping_c;
	}
	public String getO_value() {
		return o_value;
	}
	public void setO_value(String o_value) {
		this.o_value = o_value;
	}
}
