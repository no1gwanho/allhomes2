package com.allhomes.myapp.scrap;


import java.util.HashMap;
import java.util.List;


public interface ScrapDaoImp {

	//마이페이지 홈에 4개만 선별
	public List<ScrapVO> selectScrap(int m_no);
	
	//마이페이지-스크랩에 리스트
	public List<ScrapVO> mypageScrapList(int m_no);
	
	//회원이 해당 글을 스크랩했는지 여부 확인 
	public ScrapVO scrapCheck(ScrapVO vo);

}