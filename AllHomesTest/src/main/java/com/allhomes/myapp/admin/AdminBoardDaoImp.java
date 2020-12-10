package com.allhomes.myapp.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.allhomes.myapp.homeboard.HomeBoardDetailSearchVO;
import com.allhomes.myapp.homeboard.HomeboardVO;
import com.allhomes.myapp.qna.QnaVO;

public interface AdminBoardDaoImp {
	//관리자-게시판 관리 DaoImp
	
	//오늘 올라온 homeboard 개수 
	public int countHomeBoardToday();
	//오늘 올라온 q&a 개수
	public int countQAToday();
	//오늘 올라온 review 개수
	public int countReviewToday();
	//총 homeboard 글 수
	public int countHomeBoardTotal();
	
	//메인-homeboard 10개만 가져오기
	public List<HomeboardVO> selectHomeboardTen();
	//qna 10개만
	public List<QnaVO> selectQnaTen();
	//review 10개만
	public List<AdminReviewJoinVO> selectReviewTen();
	
	//모든 homeboard 글 가져오기
	public List<HomeboardVO> selectAllHomeBoard(AdminPagingVO vo);
	//모든 homeboard 글 가져오기(정렬)
	public List<HomeboardVO> selectAllHomeBoardOrder(HashMap<String, Object> map);
	//homeboard 선택
	public HomeboardVO adminHomeboardSelect(int b_no);
	//homeboard 선택검색
	public List<HomeboardVO> adminHBSearch(HashMap<String, Object> map);
	//homeboard 선택검색 count
	public int adminHBSearchCount(HashMap<String, Object> countMap);
	//homeboard 상세 검색
	public List<HomeboardVO> adminHBSearchDetail(HomeBoardDetailSearchVO vo);
	
	
	//모든 review 가져오기
	public List<AdminReviewJoinVO> selectAllReview(AdminPagingVO vo);
	//모든 review 개수 가져오기
	public int countAllReview();
	
	//스토어별로 리뷰 가져오기
	public List<AdminReviewJoinVO> selectStoreReview(int s_no);
	//review 점수별로 가져오기(개수)
	public int selectReviewOne();
	public int selectReviewTwo();
	public int selectReviewThree();
	public int selectReviewFour();
	public int selectReviewFive();
	//store별로 review 점수별로 가져오기
	public int selectStoreReviewOne(int s_no);
	public int selectStoreReviewTwo(int s_no);
	public int selectStoreReviewThree(int s_no);
	public int selectStoreReviewFour(int s_no);
	public int selectStoreReviewFive(int s_no);
	//store 리뷰 총 개수 가져오기
	public int storeReviewCount(int s_no);
	
	//모든 q&a 가져오기
	public List<QnaVO> qnaAllList(AdminPagingVO vo);
	//qna 개수 
	public int countQnaAll();
}
