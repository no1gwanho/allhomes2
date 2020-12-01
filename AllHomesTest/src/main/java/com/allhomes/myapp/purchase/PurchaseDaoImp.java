package com.allhomes.myapp.purchase;

import java.util.List;

public interface PurchaseDaoImp {
	public List<PurchaseVO>allPurchaseList();
	
	public PurchaseVO selectOnePurchaseList(String userid);
	
	public int insertPurchaseList(PurchaseVO vo);
	
	public int editPurchaseList(PurchaseVO vo);
	
	public int delPurchaseList(PurchaseVO vo);
}
