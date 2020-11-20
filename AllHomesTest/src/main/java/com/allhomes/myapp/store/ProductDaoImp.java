package com.allhomes.myapp.store;

import java.util.List;

public interface ProductDaoImp {
	
	public List<ProductVO> productAllList();
	
	public ProductVO selectProduct(int pd_no);

	public int insertProduct(ProductVO vo);
	
	public int editProduct(ProductVO vo);
	
	public int delProduct(int pd_no);	
	
}