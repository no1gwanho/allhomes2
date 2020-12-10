package com.allhomes.myapp.admin;

public class AdminSalesStoreVO {
	private int confirmCnt; //구매확정 건수
	private int sales; //판매 매출
	private int totalShippingC; //총 운송비용
	
	
	public int getTotalShippingC() {
		return totalShippingC;
	}
	public void setTotalShippingC(int totalShippingC) {
		this.totalShippingC = totalShippingC;
	}
	
	public int getConfirmCnt() {
		return confirmCnt;
	}
	public void setConfirmCnt(int confirmCnt) {
		this.confirmCnt = confirmCnt;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	
	
}
