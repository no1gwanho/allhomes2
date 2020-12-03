package com.allhomes.myapp.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	
	//homeboard 선택
	public HomeboardVO adminHomeboardSelect(int b_no);

	
	//homeboard 선택검색
	public List<HomeboardVO> adminHBSearch(@Param("key") String key, @Param("value") String value);
	
	
	//homeboard 상세 검색(userid)
	public List<HomeboardVO> HBDetailSearchUserid(String userid, String date, String date2);
	//homeboard 상세 검색(title)
	public List<HomeboardVO> HBDetailSearchTitle(String title, String date, String date2);
	//homeboard 상세 검색(content)
	public List<HomeboardVO> HBDetailSearchContent(String content, String date, String date2);
	//homeboard 상세 검색(기간만)
	public List<HomeboardVO> HBDetailSearch(String date, String date2);
}
