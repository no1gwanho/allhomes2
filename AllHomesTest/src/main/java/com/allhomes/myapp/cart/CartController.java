package com.allhomes.myapp.cart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {
	
	@RequestMapping("/cartList")
	public String cartList() {
		
		return "cart/cartForm";		
	}
}
	
