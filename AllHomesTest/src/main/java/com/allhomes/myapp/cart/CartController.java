 package com.allhomes.myapp.cart;

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

@Controller
public class CartController {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired 
	DataSourceTransactionManager transactionManager;
	
	
	//장바구니 추가
	@RequestMapping("/cartInsert")
	public ModelAndView addCart(HttpServletRequest req, CartVO vo, @RequestParam("pd_no") int pd_no) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(vo.getO_value());
		HttpSession ses = req.getSession();				
		String userid=(String)ses.getAttribute("userid");

		System.out.println("123123"+userid);
		
		CartDaoImp dao = sqlSession.getMapper(CartDaoImp.class);
		vo.setUserid(userid);		
		int result = dao.addCartList(vo);
		
		List<CartJoinVO> list = dao.joinCart(userid);
		
		mv.addObject("list", list);
		mv.setViewName("cart/cartForm");

		return mv; 
	}
	
	@RequestMapping("/cartList")
	public String viewCart() {
		
		return "cart/cartForm";
	}
	
	//장바구니 리스트
	@RequestMapping("/cartList")
	public ModelAndView cartList(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		
		CartDaoImp dao = sqlSession.getMapper(CartDaoImp.class);
		List<CartJoinVO> list = dao.joinCart(userid);
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("cart/cartForm");

		return mv; 
		
	}
}