package com.allhomes.myapp.homeboard;

public class HomeboardVO {
	
	private int b_no;
	private String title;
	private String thumbnail;
	private String content;
	private String theme;
	private String hashtag;
	private String userid;
	private String nickname;
	private int hit;
	private int scrap;
	private String ip;
	private String writedate;
	private String order;
	private String hashtaglist;
	
	
	public String getHashtaglist() {
		return hashtaglist;
	}
	public void setHashtaglist(String hashtaglist) {
		this.hashtaglist = hashtaglist;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	//조인을 위한 프로필 사진
	private String m_pic;
	
	
	public String getM_pic() {
		return m_pic;
	}
	public void setM_pic(String m_pic) {
		this.m_pic = m_pic;
	}
	//조인을 위해 추가한 테마번호
	private int hb_theme_no;
	
	public int getHb_theme_no() {
		return hb_theme_no;
	}
	public void setHb_theme_no(int hb_theme_no) {
		this.hb_theme_no = hb_theme_no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getScrap() {
		return scrap;
	}
	public void setScrap(int scrap) {
		this.scrap = scrap;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
}