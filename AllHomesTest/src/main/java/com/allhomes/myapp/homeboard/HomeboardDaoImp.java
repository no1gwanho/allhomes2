package com.allhomes.myapp.homeboard;

import java.util.List;

public interface HomeboardDaoImp {

	//레코드 전체 
	public List<HomeboardVO> homeboardAllList();
	
	//레코드 추가 - 글쓰기 
	public int homeboardInsert(HomeboardVO vo);
	
	//집들이 글보기 
	public HomeboardVO homeboardSelect(int b_no);
	
	//집들이 글번호 꺼내기 
	public int getHomeboardNumber();
	
	//집들이 테마별 리스트
	public List<HomeboardVO> homeboardThemeList(int no);
	
	//집들이-베스트 최근인기순 
	public List<HomeboardVO> homeboardBestRecentList();
	
	//집들이-베스트 인기순(전체에서)
	public List<HomeboardVO> homeboardBestList();
	
	//집들이-베스트 최신순
	public List<HomeboardVO> homeboardRecentList();
	
	//집들이-스크랩순
	public List<HomeboardVO> homeboardScrapList();
	
}