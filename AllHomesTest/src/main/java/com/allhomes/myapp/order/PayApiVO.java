package com.allhomes.myapp.order;

public class PayApiVO {
	private String itemName; //구매 이름
	private int total_p; //총 결제 가격
	private String method; //구매유형
	private String[] pd_name; //아이템 이름
	private int[] pd_no; //제품 번호
	private int[] num; //개수
	private int[] price; //가격
	private String addr; //주소
	private String tel; //연락처(")
	private String userid; //구매자 id
	
	
	
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getTotal_p() {
		return total_p;
	}
	public void setTotal_p(int total_p) {
		this.total_p = total_p;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	
	public String[] getPd_name() {
		return pd_name;
	}
	public void setPd_name(String[] pd_name) {
		this.pd_name = pd_name;
	}
	public int[] getPd_no() {
		return pd_no;
	}
	public void setPd_no(int[] pd_no) {
		this.pd_no = pd_no;
	}
	public int[] getNum() {
		return num;
	}
	public void setNum(int[] num) {
		this.num = num;
	}
	public int[] getPrice() {
		return price;
	}
	public void setPrice(int[] price) {
		this.price = price;
	}
	
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
	
}
