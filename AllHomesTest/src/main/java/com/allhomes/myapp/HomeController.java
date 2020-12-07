package com.allhomes.myapp;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.product.ProductVO;
import com.allhomes.myapp.review.ReviewDaoImp;
import com.allhomes.myapp.review.ReviewVO;
import com.allhomes.myapp.store.StoreDaoImp;
import com.allhomes.myapp.store.StoreVO;

@Controller
public class HomeController {
	SqlSession sqlSession;
	

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		ProductDaoImp pDao = sqlSession.getMapper(ProductDaoImp.class);
		List<ProductVO> list = pDao.productMainList();		
		
		ModelAndView mav = new ModelAndView();			
		mav.addObject("list", list);
		mav.setViewName("home");
				
		return mav;
	}
	
	@RequestMapping("/application")
	public String applyStore() {
		
		return "landing/applyForm";
	}
	
	@RequestMapping("/test")
	public String test() {
		
		return "headerTest/home2";
	}
}
