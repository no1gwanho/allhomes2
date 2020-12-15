package com.allhomes.myapp.register;

public class RegisterVO {
	private int m_no;
	private String userid;
	private String userpwd;
	private String username;
	private String nickname;
	private String m_pic;
	private String tel;
	private String email;
	private String regdate;
	private String regcode;
	
	//이메일 조합변수
	private String email1;
	private String email2;
	//탈퇴관련 변수
	private String outmemo;
	
	
	
	
	
	
	
	public String getOutmemo() {
		return outmemo;
	}
	public void setOutmemo(String outmemo) {
		this.outmemo = outmemo;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getM_pic() {
		return m_pic;
	}
	public void setM_pic(String m_pic) {
		this.m_pic = m_pic;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email=email1+"@"+email2;
	}
	public void setEmail(String email) {
		String emailSplit[]=email.split("@");
			
			email1 = emailSplit[0];
			email2 = emailSplit[1];
			
		this.email = email1+email2;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getRegcode() {
		return regcode;
	}
	public void setRegcode(String regcode) {
		this.regcode = regcode;
	}
	
	
}
