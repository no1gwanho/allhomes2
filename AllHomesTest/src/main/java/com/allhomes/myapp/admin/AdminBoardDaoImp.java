package com.allhomes.myapp.admin;

public interface AdminBoardDaoImp {
	//관리자-게시판 관리 DaoImp
	
	//오늘 올라온 homeboard 개수 
	public int countHomeBoardToday();
	//오늘 올라온 q&a 개수
	public int countQAToday();
	//오늘 올라온 review 개수
	public int countReviewToday();
}
