package com.allhomes.myapp.store;


import java.util.ArrayList;
import java.util.HashMap;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.product.ProductJoinVO;
import com.allhomes.myapp.product.Sub_cDaoImp;
import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.register.RegisterVO;
import com.allhomes.myapp.review.ReviewDaoImp;
import com.allhomes.myapp.review.ReviewVO;

@Controller
public class StoreController {
	
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired 
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Autowired 
	DataSourceTransactionManager transactionManager;
		
	@RequestMapping("/storeHome")
	public ModelAndView storeHome(@RequestParam("order") String order) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		List<StoreProductCategoryVO> shList = dao.storeOrderList(order);
		
		mav.addObject("shList", shList);
		mav.addObject("order", order);
		mav.setViewName("store/storeHome");
		
		return mav;
	}
	
	
	@RequestMapping("/storeBest")
	public ModelAndView storeBest(@RequestParam("order") String order) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		List<StoreProductCategoryVO> bestList = dao.storeOrderList(order);
		
		mav.addObject("bestList", bestList);
		mav.addObject("order", order);
		mav.setViewName("store/storeBest");
		
		
		return mav;
	}
	
	
	@RequestMapping("/storeCategory")
	public ModelAndView storeCatey(@RequestParam("main_c") String main_c, @RequestParam("sub_c") String sub_c) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> paramMap = new HashMap();
		paramMap.put("main_c", main_c);
		paramMap.put("sub_c", sub_c);
		
		List<StoreProductCategoryVO> categoryList = dao.storeCategoryList(paramMap);
		
		mav.addObject("categoryList", categoryList);
		mav.addObject("main_c", main_c);
		mav.addObject("sub_c", sub_c);
		mav.addObject("paramMap", paramMap);
		mav.setViewName("store/storeCate");
		
		return mav;
	}

	@RequestMapping("/storeDetail")
	public ModelAndView storeDetail(HttpServletRequest r, @RequestParam("pd_no") int pd_no){
		ModelAndView mav = new ModelAndView();
		
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		ReviewDaoImp rDao = sqlSession.getMapper(ReviewDaoImp.class);

		ProductJoinVO vo = dao.selectDetailPage(pd_no);
		
		try {
			if(!vo.getO_value().isEmpty()) {
				String options[] = vo.getO_value().split(",");			
				mav.addObject("options", options);
			}else {
				String options = "";
				mav.addObject("options", options);
			}
		}catch(NullPointerException e) {
			
		}
		
		mav.addObject("vo", vo);
		mav.addObject("rvo", rDao.avgReview(pd_no));
		mav.addObject("result", rDao.countReview(pd_no));
		mav.addObject("rList", rDao.selectReview(pd_no));		
		
		mav.setViewName("store/storeDetail");	
			
		return mav;
	}
}