package com.allhomes.myapp.store;

public class StoreProductCategoryVO {
	
	//추가
	private int sale;
	private int wishlist;
	
	
	
	
	//Product 
	private int pd_no;
	private int s_no;
	private String pd_name;
	private int price;
	private int discount;
	private String main_img;
	private int stock;
	private String status;
	private String sub_c;
	private String pd_img;
	private String pd_exd;
	private int shipping;
	private String o_value;
	
	
	//Main Category
	private String main_c;
	private int priority;
	private String img;
	private int main_c_no;
	
	//Sug Category
	//private String sub_c; --> Product에 있음 
	//private int main_c_no; --> Main cagetory에 있음 
	private int c_code; //
	
	//Store
	//private int s_no; --> 상품에 이미 있음
	private String s_num;
	private String s_name;
	private String s_pic; //스토어 프로필 사진
	private String openingdate;
	private String s_id;
	private String staff_n;
	private String staff_t;
	private String staff_e;
	private String s_homepage;
	//private String status; --> 상품에 있음 
	
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
	public String getPd_exd() {
		return pd_exd;
	}
	public void setPd_exd(String pd_exd) {
		this.pd_exd = pd_exd;
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}
	public String getO_value() {
		return o_value;
	}
	public void setO_value(String o_value) {
		this.o_value = o_value;
	}
	public String getMain_c() {
		return main_c;
	}
	public void setMain_c(String main_c) {
		this.main_c = main_c;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getMain_c_no() {
		return main_c_no;
	}
	public void setMain_c_no(int main_c_no) {
		this.main_c_no = main_c_no;
	}
	public int getC_code() {
		return c_code;
	}
	public void setC_code(int c_code) {
		this.c_code = c_code;
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
	


}
