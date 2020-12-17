package com.allhomes.myapp.homeboard;

import java.util.List;

public interface HomeboardDaoImp {

	//레코드 전체 
	public List<HomeboardVO> homeboardAllList();
	
	//인기순 정렬 
	public List<HomeboardVO> homeboardAllListHit();
	
	//집들이 테마별 리스트
	public List<HomeboardVO> homeboardThemeList(int bh_theme_no);
	
	//집들이 베스트 리스트
	public List<HomeboardVO> homeboardBestList(String order);
	
	//레코드 추가 - 글쓰기 
	public int homeboardInsert(HomeboardVO vo);
	
	//집들이 글번호 꺼내기 (글쓰기 후 바로 해당페이지보이게)
	public int getHomeboardNumber();
	
	//집들이 쓴 글쓴이 찾기 
	public String getHomeboardWriter(int b_no);
	
	//집들이 기존에 선택한 테마 찾기 
	public int getOriginalTheme(int b_no);
	
	//집들이 글보기 
	public HomeboardVO homeboardSelect(int b_no);
	
	//집들이 글 수정 내용보기
	public HomeboardVO homeboardEditSelect(int b_no);
	
	//집들이 글 수정하기
	public int homeboardEdit(HomeboardVO vo);
	
	//집들이 글 삭제하기
	public int homeboardDelete(int b_no);
	
	//집들이 글 클릭할때마다 조회수 증가
	public void homeboardHit(int b_no);
	
	//집들이 스크랩 클릭할때마다 스크랩 증가
	public void homeboardScrapAdd(int b_no);
	
	//집들이 스크랩 취소할떄마다 스크랩 감소
	public void homeboardSrapMinus(int b_no);
	
	//집들이 -- 내가쓴글 보기
	public List<HomeboardVO> myHomeboardList(String userid);
	
	//집들이-해시태그 불러오기
	public String hashtagList();
	
	
	
	
	
}