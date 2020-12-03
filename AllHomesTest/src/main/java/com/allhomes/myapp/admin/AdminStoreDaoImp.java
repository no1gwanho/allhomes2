package com.allhomes.myapp.admin;

import java.util.List;

import com.allhomes.myapp.store.StoreVO;

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
	
	//===========스토어 검색======================
	//스토어명으로 검색
	public List<StoreVO> adminStoreSearchS_name(String key);
	
	//판매자 id로 검색
	public List<StoreVO> adminStoreSearchS_id(String key);
	
	//담당자 연락처로 검색
	public List<StoreVO> adminStoreSearchStaff_t(String key);
	
	//담당자 이메일로 검색
	public List<StoreVO> adminStoreSearchStaff_e(String key);
}
