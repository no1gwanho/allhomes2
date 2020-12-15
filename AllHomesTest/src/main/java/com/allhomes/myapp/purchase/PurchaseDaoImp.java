package com.allhomes.myapp.purchase;

import java.util.List;

import com.allhomes.myapp.review.ReviewVO;

public interface PurchaseDaoImp {
	public List<PurchaseVO> allPurchaseList();
	
	public List<PurchaseJoinVO> purchaseList(PurchaseJoinVO vo);
	
	public PurchaseVO selectPurchaseList();
	
	public int insertPurchaseList(PurchaseVO vo);
	
	public int editPurchaseList(PurchaseVO vo);
	
	public int editConfirmCheck(int pc_no);
	
	public int delPurchaseList(PurchaseVO vo);
	
	public List<PurchaseJoinVO> joinPurchase(String userid);
}
