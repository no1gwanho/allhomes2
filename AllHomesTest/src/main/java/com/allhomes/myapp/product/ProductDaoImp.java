package com.allhomes.myapp.product;

import java.util.List;

public interface ProductDaoImp {
	//제품전체보기
	public List<ProductVO> productAllList();
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
	
}
