package com.allhomes.myapp.admin;

import java.util.List;

import com.allhomes.myapp.homeboard.HomeboardVO;

public interface AdminBoardDaoImp {
	//관리자-게시판 관리 DaoImp
	
	//오늘 올라온 homeboard 개수 
	public int countHomeBoardToday();
	//오늘 올라온 q&a 개수
	public int countQAToday();
	//오늘 올라온 review 개수
	public int countReviewToday();
	//모든 homeboard 글 가져오기
	public List<HomeboardVO> selectAllHomeBoard();
	//모든 review 가져오기
	
	//모든 q&a 가져오기
	
	//homeboard에서 검색 (Userid)
	public List<HomeboardVO> homeBoardSearchUserid(String key);
	//homeboard에서 검색(글제목)
	public List<HomeboardVO> homeBoardSearchTitle(String key);
}
