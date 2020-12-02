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
	
}
