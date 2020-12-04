package com.allhomes.myapp.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.purchase.PurchaseDaoImp;
import com.allhomes.myapp.purchase.PurchaseVO;

@Controller
public class ReviewController {
	@Autowired 
	SqlSession sqlSession;
	
	@RequestMapping(value="/reviewWriteOk", method=RequestMethod.POST)
	public ModelAndView reviewWriteOk() {
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
}
