package com.allhomes.myapp.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/cartList")
	public ModelAndView cartList() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("cart/cartForm");
		
		return mav;		
	}
}
	
