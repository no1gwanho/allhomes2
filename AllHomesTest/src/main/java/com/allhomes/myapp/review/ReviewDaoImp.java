package com.allhomes.myapp.review;

import java.util.List;

public interface ReviewDaoImp {
	// 제품 리뷰 조회
	public List<ReviewVO> allReviewList();
	
	public List<ReviewVO> selectReview(int pd_no);
	
	public List<ReviewVO> reviewRatingCnt(int pd_no);
	
	public ReviewVO avgReview(int pd_no);	
	
	public ReviewVO selectOneReview();
	
	public int countReview(int pd_no);
		
	public int insertReview(ReviewVO vo);
	
	public int editReview(ReviewVO vo);
	
	public int delReviewUserid(String userid);
	
	public int delReviewPd_no(int pd_no);
}
