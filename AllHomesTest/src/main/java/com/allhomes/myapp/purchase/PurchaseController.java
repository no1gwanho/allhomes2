package com.allhomes.myapp.purchase;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchaseController {
	@Autowired 
	SqlSession sqlSession;
	 
	@RequestMapping("/setInPurchase")
	public ModelAndView purchaseUpdate(@RequestParam("m_no") int m_no) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("landing/confirmResult");
		
		return mav;
	}
}
