package com.allhomes.myapp.purchase;

import java.util.List;

public interface PurchaseDaoImp {
	public List<PurchaseVO> allPurchaseList();
	
	public List<PurchaseVO> joinPurchaseReview();
	
	public PurchaseVO selectOnePurchaseList(String userid);
	
	public List<PurchaseVO> selectPurchaseListPdno(int pd_no);
	
	public int insertPurchaseList(PurchaseVO vo);
	
	public int editPurchaseList(PurchaseVO vo);
	
	public int editConfirmCheck(PurchaseVO vo);
	
	public int delPurchaseList(PurchaseVO vo);
}
