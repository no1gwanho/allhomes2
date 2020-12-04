package com.allhomes.myapp.admin;

import java.util.List;

import com.allhomes.myapp.purchase.PurchaseVO;

public interface AdminOrderDaoImp {
	//모든 주문 리스트
	public List<AdminOrderVO> allPurchase();
	//오늘 들어온 주문
	public List<AdminOrderVO> purchaseToday();
	//한달 주문
	public List<AdminOrderVO> purchaseMonth();
	//3개월 주문
	public List<AdminOrderVO> purchaseThreeMonth();
}
