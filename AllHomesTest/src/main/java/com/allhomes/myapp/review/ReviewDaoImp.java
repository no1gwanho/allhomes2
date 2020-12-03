package com.allhomes.myapp.review;

import java.util.List;

public interface ReviewDaoImp {
	// 제품 리뷰 조회
	public ReviewVO allReviewList();
	
	public List<ReviewVO> reviewList();
	
	public List<ReviewVO> selectReview(int pd_no);
		
	public int insertReview(ReviewVO vo);
	
	public int editReview(ReviewVO vo);
	
	public int delReview(ReviewVO vo);

	public int countReview(int pd_no);
}
