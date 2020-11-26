package com.allhomes.myapp.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StoreController {
	@Autowired 
	SqlSession sqlSes;
	 
	@Autowired 
	DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/storeHome")	
	public ModelAndView storeHome(PagingVO pVO) { 
		ProductDaoImp dao = sqlSes.getMapper(ProductDaoImp.class); 
		List<ProductVO> list = dao.productAllList(pVO);
	  
		ModelAndView mav = new ModelAndView(); mav.addObject("list", list);
		mav.setViewName("store/storeHome");
		
		return mav; 
	 }

	@RequestMapping("/storeCategory")
	public String storeCate() {
			
		return "store/storeCate";
	}
	
	@RequestMapping("/storeBest")
	public String storeBest() {
		
		return "store/storeBest";
	}
	
	@RequestMapping("/storeDetail")
	public ModelAndView storeDetail(int pd_no){
		
		ProductDaoImp dao = sqlSes.getMapper(ProductDaoImp.class); 
		ProductVO vo = dao.selectProduct(pd_no);
		
		ModelAndView mav = new ModelAndView(); mav.addObject("vo", vo);
		mav.setViewName("store/storeDetail");
		
		return mav;
	}	
}
