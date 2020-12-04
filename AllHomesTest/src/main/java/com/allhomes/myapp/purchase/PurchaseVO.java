package com.allhomes.myapp.purchase;

public class PurchaseVO {
	private int pc_no;
	private int pd_no;
	private int s_no;
	private String userid;
	private int num;
	private int price;
	private int shipping_c;
	private int total_p;
	private int a_code;
	private String pc_date;
	private String payment;
	private String status;
	private String confirm;
	private String memo;
	private String o_value;
	private int rating;
	private String img;
	private String content;
	private String writedate;
  
	public String getO_value() {
		return o_value;
	}
	public void setO_value(String o_value) {
		this.o_value = o_value;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
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
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public int getTotal_p() {
		return total_p;
	}
	public void setTotal_p(int total_p) {
		this.total_p = total_p;
	}
	public int getA_code() {
		return a_code;
	}
	public void setA_code(int a_code) {
		this.a_code = a_code;
	}
	public String getPc_date() {
		return pc_date;
	}
	public void setPc_date(String pc_date) {
		this.pc_date = pc_date;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	/*
	 * @Override public String toString() { return "PurchaseVO [pc_no=" + pc_no +
	 * ", pd_no=" + pd_no + ", s_no=" + s_no + ", num=" + num + ", total_p=" +
	 * total_p + ", status=" + status + ", o_no=" + o_no + "]"; }
	 */

	@Override
	public String toString() {
		return "PurchaseVO [pc_no=" + pc_no + ", pd_no=" + pd_no + ", s_no=" + s_no + ", userid=" + userid
				+ ", pc_date=" + pc_date + ", rating=" + rating + ", img=" + img + ", content=" + content
				+ ", writedate=" + writedate + "]";
	}
}
