package com.allhomes.myapp.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Autowired 
	SqlSession sqlSession;
	
	@RequestMapping(value="/reviewWriteOk", method=RequestMethod.POST)
	public ModelAndView reviewWriteOk() {
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	@RequestMapping("/reviewHitAdd")
	public String reviewHitAdd(@RequestParam("r_no") int r_no, @RequestParam("pd_no") int pd_no) {

		ReviewDaoImp dao = sqlSession.getMapper(ReviewDaoImp.class);
		int result = dao.reviewHitAdd(r_no);
		
		System.out.println(result);
		return "redirect:storeDetail?pd_no="+pd_no;
	}
	
	@RequestMapping("/reviewBest")
	public ModelAndView reviewBest(@RequestParam("pd_no") int pd_no) {
		ModelAndView mv = new ModelAndView();
		ReviewDaoImp dao = sqlSession.getMapper(ReviewDaoImp.class);

		return mv;
	}
}
