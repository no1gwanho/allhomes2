package com.allhomes.myapp;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.review.ReviewDaoImp;
import com.allhomes.myapp.review.ReviewVO;

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
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);		
		ReviewDaoImp review = sqlSession.getMapper(ReviewDaoImp.class);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.productMainList());
		mav.addObject("rList", review.reviewList());
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping("/application")
	public String applyStore() {
		
		return "landing/applyForm";
	}
}
