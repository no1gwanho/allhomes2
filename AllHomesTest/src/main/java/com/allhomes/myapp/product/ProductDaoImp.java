package com.allhomes.myapp.product;

import java.util.List;

import com.allhomes.myapp.review.ReviewVO;

public interface ProductDaoImp {
	//제품전체보기
	public List<ProductVO> productAllList(PagingVO vo);
	// 등록된 상품 수
	public int getAllProductCount(PagingVO pVo);
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
	//스토어의 총 제품 개수
	public int countProduct(int s_no);
}
