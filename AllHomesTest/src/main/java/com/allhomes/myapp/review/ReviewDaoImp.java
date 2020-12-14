package com.allhomes.myapp.review;

import java.util.List;

public interface ReviewDaoImp {
	// 제품 리뷰 조회
	public List<ReviewVO> allReviewList();
	
	public List<ReviewVO> selectReview(int pd_no);
	
	public ReviewJoinVO ratioReview1(int pd_no);
	
	public ReviewJoinVO ratioReview2(int pd_no);
	
	public ReviewJoinVO ratioReview3(int pd_no);
	
	public ReviewJoinVO ratioReview4(int pd_no);
	
	public ReviewJoinVO ratioReview5(int pd_no);
	
	public ReviewVO avgReview(int pd_no);	
	
	public ReviewVO selectOneReview();
	
	public int reviewHitAdd(int r_no);
	
	public int countReview(int pd_no);
		
	public int insertReview(ReviewVO vo);
	
	public int editReview(ReviewVO vo);
	
	public int delReviewUserid(String userid);
	
	public int delReviewPd_no(int pd_no);
}
