package com.allhomes.myapp.review;

import java.util.List;

public interface ReviewDaoImp {
	// 제품 리뷰 조회
	public List<ReviewVO> productReviewList(int pd_no);
	
	public ReviewVO selectOneReview(int pd_no);
	
	public int insertReview(ReviewVO vo);
	
	public int editReview(ReviewVO vo);
	
	public int delReview(ReviewVO vo);
}
