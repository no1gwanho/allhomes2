package com.allhomes.myapp.search;

import java.util.List;

import com.allhomes.myapp.homeboard.HomeboardVO;
import com.allhomes.myapp.product.ProductVO;
import com.allhomes.myapp.register.RegisterVO;

public interface SearchDaoImp {
	//회원 검색
	//public List<RegisterVO> searchMember(String key);
	//homeboard 검색
	public List<HomeboardVO> searchHB(String key);
	//product 검색
	public List<ProductVO> searchProduct(String key);
	//질문게시판 검색
	
	//product 검색 결과 개수
	public int searchProductCount(String key);
	//homeboard 검색 결과 개수
	public int searchHBCount(String key);
	//질문 게시판 검색 결과 개수
}
