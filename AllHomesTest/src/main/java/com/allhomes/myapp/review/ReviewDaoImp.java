package com.allhomes.myapp.review;

import java.util.List;

import com.allhomes.myapp.product.PagingVO;
import com.allhomes.myapp.purchase.PurchaseJoinVO;
import com.allhomes.myapp.register.RegisterVO;

public interface ReviewDaoImp {
	// 제품 리뷰 조회
	public List<ReviewVO> allReviewList();
	
	public List<ReviewVO> selectReview(int pd_no);
	
	public ReviewJoinVO reviewSetting(ReviewJoinVO vo);
	
	public ReviewVO avgReview(int pd_no);	
	
	public ReviewVO selectOneReview(ReviewVO vo);
	
	public ReviewJoinVO selectReviewList(int chk_no);
	
	public int reviewHitAdd(int r_no);
	
	public int countReview(int pd_no);
		
	public int insertReview(ReviewVO vo);
	
	public int editReview(ReviewVO vo);
	
	public int delReviewUserid(String userid);
	
	public int delReviewPd_no(int pd_no);
	
	public int getAllReview(PagingVO vo);
	
	public ReviewJoinVO reviewInfo(PurchaseJoinVO vo);
}
