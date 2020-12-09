package com.allhomes.myapp.admin;

import java.util.List;

import com.allhomes.myapp.store.StoreVO;

public interface AdminSalesDaoImp {
	//스토어 별 매출 현황 가져오기(당일)
	public AdminSalesStoreVO storeSalesToday(int s_no);
	//스토어 별 매출 현황 가져오기(한달)
	public AdminSalesStoreVO storeSalesMonth(int s_no);
	//스토어 별 매출 현황 가져오기(세달)
	public AdminSalesStoreVO storeSalesThree(int s_no);
	//스토어 별 매출 현황 가져오기(총)
	public AdminSalesStoreVO storeSalesTotal(int s_no);
	
	//스토어 별 오늘 주문건수
	public AdminSalesStoreVO countStoreOrderToday(int s_no);
	//스토어 별 한달 주문건수
	public AdminSalesStoreVO countStoreOrderMonth(int s_no);
	//스토어 별 세달 주문건수
	public AdminSalesStoreVO countStoreOrderThree(int s_no);
}
