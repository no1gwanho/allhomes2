package com.allhomes.myapp.purchase;

import java.util.List;

import com.allhomes.myapp.review.ReviewVO;

public interface PurchaseDaoImp {
	public List<PurchaseVO> allPurchaseList();
	
	public List<PurchaseVO> joinPurchaseReview(String userid);
	
	public PurchaseVO selectPurchaseListString(String userid);
	
	public PurchaseVO selectPurchaseListInt(int pd_no);
	
	public int insertPurchaseList(PurchaseVO vo);
	
	public int editPurchaseList(PurchaseVO vo);
	
	public int editConfirmCheck(int pc_no);
	
	public int delPurchaseList(PurchaseVO vo);
}
