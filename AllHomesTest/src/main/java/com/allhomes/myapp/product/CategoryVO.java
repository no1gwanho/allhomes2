package com.allhomes.myapp.product;

public class CategoryVO {
	private String main_c;
	private int priority;
	private String img;
	private String sub_c;
	private int main_c_no;
	

	public int getMain_c_no() {
		return main_c_no;
	}
	public void setMain_c_no(int main_c_no) {
		this.main_c_no = main_c_no;
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
	public String getSub_c() {
		return sub_c;
	}
	public void setSub_c(String sub_c) {
		this.sub_c = sub_c;
	}
}
