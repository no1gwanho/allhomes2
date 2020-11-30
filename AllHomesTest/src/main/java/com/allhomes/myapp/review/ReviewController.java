package com.allhomes.myapp.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Autowired 
	SqlSession sqlSession;
	
	@RequestMapping("")
	@ResponseBody
	public String reviewWriteForm() {
				
		return "mypage/reviewForm";
	}
}
