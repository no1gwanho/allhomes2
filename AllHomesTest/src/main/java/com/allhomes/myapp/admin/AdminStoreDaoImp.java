package com.allhomes.myapp.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.allhomes.myapp.store.StoreDetailSearchVO;
import com.allhomes.myapp.store.StoreVO;

public interface AdminStoreDaoImp {
	
	//스토어 추가
	public int storeAdd(StoreVO vo);
	//전체 스토어 목록 불러오기
	public List<StoreVO> storeAll(AdminPagingVO vo);
	// 스토어 목록
	public List<StoreVO> selectStoreJoin();
	//스토어 선택
	public StoreVO storeSelect(int s_no);
	//스토어 삭제
	public int storeDel(int s_no);
	//스토어 수정
	public int storeEdit(StoreVO vo);
	//스토어 개수
	public int storeCount();
	
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
	
	//선택 검색
	public List<StoreVO> adminStoreSearch(@Param("key") String key, @Param("value") String value);
	
	//상세검색
	public List<StoreVO> adminStoreDetailSearch(StoreDetailSearchVO vo);
}
