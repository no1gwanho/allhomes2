package com.allhomes.myapp.homeboard;

public class HomeboardCommentVO {
	
	private int hb_c_no;
	private String userid;
	private String hb_comment;
	private String writedate;
	private String editdate;
	private int b_no;
	private int step;
	private int lvl;
	private int comment_no;
	private String m_pic;
	
	public String getM_pic() {
		return m_pic;
	}
	public void setM_pic(String m_pic) {
		this.m_pic = m_pic;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getHb_comment() {
		return hb_comment;
	}
	public void setHb_comment(String hb_comment) {
		this.hb_comment = hb_comment;
	}
	public int getHb_c_no() {
		return hb_c_no;
	}
	public void setHb_c_no(int hb_c_no) {
		this.hb_c_no = hb_c_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getEditdate() {
		return editdate;
	}
	public void setEditdate(String editdate) {
		this.editdate = editdate;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

}
