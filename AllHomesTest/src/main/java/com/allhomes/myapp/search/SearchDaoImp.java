package com.allhomes.myapp.search;

import java.util.HashMap;
import java.util.List;

import com.allhomes.myapp.homeboard.HomeboardVO;
import com.allhomes.myapp.product.ProductVO;
import com.allhomes.myapp.qna.QnaVO;
import com.allhomes.myapp.register.RegisterVO;
import com.allhomes.myapp.store.StoreProductCategoryVO;

public interface SearchDaoImp {

	//메인에서는 회원검색은 안하기로 함 (다른회원 스크랩 보기 기능 등이 아직 없음)
	
	//===통합검색====//
	//집들이 검색
	public List<HomeboardVO> searchHB(String key);
	
	//집들이 검색결과 (개수)
	public int searchHBCount(String key);
	
	//스토어 검색
	public List<ProductVO> searchProduct(String key);
	//질문게시판 검색
	
	//스토어 검색 결과 개수
	public int searchProductCount(String key);
	
	//질문게시판 검색
	public List<QnaVO> searchQNA(String key);
	
	//질문 게시판 검색 결과 개수
	public int searchQNACount(String key);
	
	
	//=====스토어검색======//
	public List<StoreProductCategoryVO> searchProductOrder(HashMap<String, Object> paramMap);
	
	
	//====집들이검색=====//
	public List<StoreProductCategoryVO> searchHBOrder(HashMap<String, Object> paramMap);
	
	
}
