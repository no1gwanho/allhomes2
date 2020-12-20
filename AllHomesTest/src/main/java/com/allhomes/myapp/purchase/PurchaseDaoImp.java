package com.allhomes.myapp.purchase;

import java.util.List;

import com.allhomes.myapp.review.ReviewVO;

public interface PurchaseDaoImp {
	public List<PurchaseVO> allPurchaseList();
	
	public List<PurchaseJoinVO> purchaseList(PurchaseJoinVO vo);
	
	public List<PurchaseVO> selectPurchaseList(String userid);
	
	public int insertPurchaseList(PurchaseVO vo);
	
	public int editPurchaseList(PurchaseJoinVO vo);
	
	public int editConfirmCheck(int pc_no);
	
	public int reviewStatusUpdate(PurchaseJoinVO vo);

	public int editChk_c(int pc_no);
	
	public int delPurchaseList(int pc_no);
	
	public List<PurchaseJoinVO> joinPurchase(String userid);
	
	public List<PurchaseJoinVO> orderCancelList(String userid);
	
	public PurchaseJoinVO puchaseSelect(PurchaseJoinVO vo);
}
