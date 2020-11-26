package com.allhomes.myapp.product;

import java.util.List;

public interface ProductDaoImp {
	
	public List<ProductVO> productAllList(PagingVO pVO);
	
	public int getAllRecordCount(PagingVO pageVO);
	
	public ProductVO selectProduct(int pd_no);

	public int insertProduct(ProductVO vo);
	
	public int editProduct(ProductVO vo);
	
	public int delProduct(int pd_no);		
}
