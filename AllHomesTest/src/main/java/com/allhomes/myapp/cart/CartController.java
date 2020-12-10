package com.allhomes.myapp.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.register.RegisterVO;

@Controller
public class CartController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/cartInsert")
	public ModelAndView cartInsert(@RequestParam("pd_no") int pd_no, RegisterVO vo) {
		ModelAndView mav = new ModelAndView();
			
		CartDaoImp dao = sqlSession.getMapper(CartDaoImp.class);
		RegisterDaoImp reg =sqlSession.getMapper(RegisterDaoImp.class);

		mav.setViewName("cart/cartForm");
		return mav;		
	}
}
	
