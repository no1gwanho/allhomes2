package com.allhomes.myapp.scrap;


import java.util.HashMap;
import java.util.List;


public interface ScrapDaoImp {
	
	//마이페이지-스크랩에 리스트
	public List<ScrapVO> mypageScrapList(int m_no);
	
	//회원이 해당 글을 스크랩했는지 여부 확인 
	public ScrapVO scrapCheck(ScrapVO vo);
	
	//스크랩하기 
	public int scrapAdd(ScrapVO vo);
	
	//스크랩하고 스크랩북가기
	public int scrapAddAnd(ScrapVO vo);
	
	//스크랩 취소하기
	public int scrapCancel(int b_no);
	
	
	
	//DB에 스크랩개수 늘리기 --> HomeboardDao에서  
	//DB에서 스크랩개수 뺴기 --> HomeboardDao에서

}