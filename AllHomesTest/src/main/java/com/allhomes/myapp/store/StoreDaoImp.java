package com.allhomes.myapp.store;

import java.util.HashMap;
import java.util.List;

public interface StoreDaoImp {
	
	//전체 스토어 목록 불러오기
	public List<StoreProductCategoryVO> storeAllList();
	
	//스토어 리스트 - 키워드별 정렬 (order) 
	public List<StoreProductCategoryVO> storeOrderList(String order);
	
	
	//스토어 리스트 - 카테고리별 
	public List<StoreProductCategoryVO> storeCategoryList(HashMap<String, Object> paramMap);
	
	//제품 카테고리 불러오기 
	public List<StoreProductCategoryVO> mainCategoryList();
	
	//제품 누적 판매량
	public int countPurchase(int s_no);
	
	
	
	
	//=====은빈=======

	//스토어 추가
	public int storeAdd(StoreVO vo);
	// 스토어 목록
	public List<StoreVO> selectStoreJoin();
	
	//스토어 선택
	public StoreVO storeSelect(int s_no);
	//스토어 삭제
	public int storeDel(int s_no);
	//스토어 수정
	public int storeEdit(StoreVO vo);
}
