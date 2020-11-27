package com.allhomes.myapp.homeboard;

public interface HomeboardDaoImp {

	//레코드 추가 - 글쓰기 
	public int homeboardInsert(HomeboardVO vo);
	
	public HomeboardVO homeboardSelect(int b_no);
	
	public int getHomeboardNumber();
	
}
