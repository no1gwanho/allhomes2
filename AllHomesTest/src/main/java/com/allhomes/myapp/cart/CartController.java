package com.allhomes.myapp.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.product.ProductVO;

@Controller
public class CartController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/cartList")
	public String cartList() {
		
		return "cart/cartForm";		
	}
}
	
