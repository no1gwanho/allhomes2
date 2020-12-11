package com.allhomes.myapp.admin;

public class AdminMemberInfoCountVO {
	public int boardCnt; //게시글 개수
	public int wishCnt; //위시리스트 개수
	public int scrapCnt; //스크랩 개수
	public int orderCnt; //주문 개수
	
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	public int getWishCnt() {
		return wishCnt;
	}
	public void setWishCnt(int wishCnt) {
		this.wishCnt = wishCnt;
	}
	public int getScrapCnt() {
		return scrapCnt;
	}
	public void setScrapCnt(int scrapCnt) {
		this.scrapCnt = scrapCnt;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}
	
	
}
