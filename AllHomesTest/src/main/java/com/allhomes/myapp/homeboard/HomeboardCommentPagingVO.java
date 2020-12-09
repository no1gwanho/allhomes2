package com.allhomes.myapp.homeboard;

public class HomeboardCommentPagingVO {
	
	private int nowPage = 1; // 현재페이지 
	private int totalRecord = 0; // 총 댓글 수
	private int totalPage = 0;// 총페이지수
	private int onePageRecord = 10; //한페이지에 표시될 댓글 개수
	private int onePageNumCount = 10; //한번에 보여줄 페이지 개수 
	private int startPageNum = 1; //페이지번호의 시작페이지 
	private int lastPageRecordCount = 10;
	
	
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		//페이징 - 시작페이지 번호 
		startPageNum = (nowPage-1)/onePageNumCount*onePageNumCount+1;
	}
	
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		//총페이지수 구하기
		totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord); //4.0
		
		//마지막에 선택할 레코드 수 
		if(nowPage ==totalPage && totalPage%onePageRecord!=0) {
			lastPageRecordCount = totalRecord%onePageRecord;
		}else {
			lastPageRecordCount = onePageRecord;
		}
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getOnePageNumCount() {
		return onePageNumCount;
	}
	public void setOnePageNumCount(int onePageNumCount) {
		this.onePageNumCount = onePageNumCount;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getLastPageRecordCount() {
		return lastPageRecordCount;
	}
	public void setLastPageRecordCount(int lastPageRecordCount) {
		this.lastPageRecordCount = lastPageRecordCount;
	}	

}
