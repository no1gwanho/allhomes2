package com.allhomes.myapp.product;

import java.util.HashMap;
import java.util.List;

public interface ProductDaoImp {
	//제품전체보기
	public List<ProductVO> productAllList(String sortPd);
	// 제품 전체 보기(리뷰 & 스토어)
	public List<ProductVO> productList(String sortPd);
	// 제품전체보기(메인페이지)
	public List<ProductVO >productMainList();
	// 등록된 상품 수
	public int getAllProductCount();
	//제품선택(제품번호로)
	public ProductVO selectProduct(int pd_no);
	//제품추가
	public int insertProduct(ProductVO vo);
	//제품수정
	public int editProduct(ProductVO vo);
	//제품삭제
	public int delProduct(int pd_no);
	//제품 선택(스토어 번호로)
	public List<ProductVO> selectStoreProduct(int s_no);
	public List<ProductVO> selectStoreProductOrder(HashMap<String, Object> map);
	//스토어의 총 제품 개수
	public int countProduct(int s_no);
	//방금 insert한 제품의 제품번호
	public ProductVO selectOptionProductNo(); 
	
	public ProductVO joinProductStore();
	
	public List<ProductJoinVO> productCateList(int c_code);
	
	public ProductJoinVO selectDetailPage(int pd_no);
	
	public int updateWishlistAdd(ProductVO vo);
	
	public int updateWishlistRevert(ProductVO vo);
}

