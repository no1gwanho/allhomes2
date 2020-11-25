package com.allhomes.myapp.admin;

import java.util.List;

public interface AdminStoreDaoImp {
	
	//스토어--스토어 카테고리
	//category--메인카테고리 insert
	public int storeCategoryInsert(AdminStoreCategoryVO vo);
	
	//category--메인카테고리 전체
	public java.util.List<AdminStoreCategoryVO> storeCategoryAll();
	
	//category--서브카테고리 추가
	public int storeSubCategoryInsert(AdminStoreSubCategoryVO vo);
	
	//category--서브카테고리 전체보기
	public List<AdminStoreSubCategoryVO> storeSubCategoryAll();
	
	//category--메인카테고리 이름 가져오기
	public List<String> storeMainCategoryName();
	
	//category--서브카테고리 삭제
	public int storeSubCategoryDel(String sub_c);
	
	//category--메인카테고리 삭제
	public int storeMainCategoryDel(String main_c);
}
