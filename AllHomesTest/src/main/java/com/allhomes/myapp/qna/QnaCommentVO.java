package com.allhomes.myapp.qna;

public class QnaCommentVO {
	
	private int q_c_no;
	private String userid;
	private String q_comment;
	private int q_no;
	private String writedate;
	private String editdate;
	private String writer;
	private String m_pic;

	public String getM_pic() {
		return m_pic;
	}
	public void setM_pic(String m_pic) {
		this.m_pic = m_pic;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getQ_c_no() {
		return q_c_no;
	}
	public void setQ_c_no(int q_c_no) {
		this.q_c_no = q_c_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getQ_comment() {
		return q_comment;
	}
	public void setQ_comment(String q_comment) {
		this.q_comment = q_comment;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
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
	
	

}
