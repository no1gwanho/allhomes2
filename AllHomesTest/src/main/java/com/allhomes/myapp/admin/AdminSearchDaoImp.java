package com.allhomes.myapp.admin;

import java.util.List;

import com.allhomes.myapp.homeboard.HomeboardVO;
import com.allhomes.myapp.product.ProductVO;
import com.allhomes.myapp.register.RegisterVO;
import com.allhomes.myapp.store.StoreVO;

public interface AdminSearchDaoImp {
	//회원 검색
	public List<RegisterVO> adminIntegSearchMember(String key);
	//homeboard 검색
	public List<HomeboardVO> adminIntegSearchHB(String key);
	//store 검색
	public List<StoreVO> adminIntegSearchStore(String key);
	//product 검색
	public List<ProductVO> adminIntegSearchProduct(String key);
	
}
