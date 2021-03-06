package com.allhomes.myapp.product;

public class ProductJoinVO {
	private int pd_no;			// 제품번호
	private int s_no;			// 스토어번호
	private String pd_name;		// 제품명
	private int price;			// 가격
	private int discount;		// 할인율
	private String main_img;	// 썸네일대표이미지
	private int stock;			// 재고
	private String status;		// 상태(품절임박, 입고예정 등)
	private String sub_c;		// 서브카테고리
	private String pd_img;      // 제품 설명사진(여러개 가능)
	private String pd_exp;      // 짧은 제품설명
	private int shipping_c;		// 배송비
	private String o_value;		//옵션
	private int dc_price;
	private int num;
	
	private String s_name;
	private String userid;
	private String img;
	private String content;
	private String writedate;
	private int rating;
	private int avg_rating;
	
	private int pc_no;
	private String pc_date;
	
	private String main_c;
	private int c_code;
	
	public int getC_code() {
		return c_code;
	}
	public void setC_code(int c_code) {
		this.c_code = c_code;
	}	
	public String getMain_c() {
		return main_c;
	}
	public void setMain_c(String main_c) {
		this.main_c = main_c;
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
	public int getDc_price() {
		return dc_price;
	}
	public void setDc_price(int dc_price) {
		this.dc_price = dc_price;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getAvg_rating() {
		return avg_rating;
	}
	public void setAvg_rating(int avg_rating) {
		this.avg_rating = avg_rating;
	}
	public int getPc_no() {
		return pc_no;
	}
	public void setPc_no(int pc_no) {
		this.pc_no = pc_no;
	}
	public String getPc_date() {
		return pc_date;
	}
	public void setPc_date(String pc_date) {
		this.pc_date = pc_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
