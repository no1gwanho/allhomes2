package com.allhomes.myapp.purchase;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchaseController {
	@Autowired 
	SqlSession sqlSession;
	 
	@RequestMapping("/setInPurchase")
	public ModelAndView purchaseUpdate(PurchaseVO vo) {
		vo.setConfirm("Y");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("landing/confirmResult");
		
		System.out.println("confirm의 값===============================> "+vo);
		
		return mav;
	}
}
