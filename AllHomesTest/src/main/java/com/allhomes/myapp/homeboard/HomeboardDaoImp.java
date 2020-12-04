package com.allhomes.myapp.homeboard;

import java.util.List;

public interface HomeboardDaoImp {

	//레코드 전체 
	public List<HomeboardVO> homeboardAllList();
	
	//메인페이지용 집들이 글 리스트 (최근인기글 8개)
	public List<HomeboardVO> homeboardListForMain();
	
	//집들이 메인 - 집들이 인기글 
	
	
	
	
	//레코드 추가 - 글쓰기 
	public int homeboardInsert(HomeboardVO vo);
	
	//집들이 글보기 
	public HomeboardVO homeboardSelect(int b_no);
	
	//집들이 글번호 꺼내기 
	public int getHomeboardNumber();
	
	//집들이 테마별 리스트
	public List<HomeboardVO> homeboardThemeList(int bh_theme_no);
	
	//집들이 베스트 리스트
	public List<HomeboardVO> homeboardBestList(String order);
	
	
}