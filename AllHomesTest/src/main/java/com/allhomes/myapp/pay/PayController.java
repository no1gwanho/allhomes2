package com.allhomes.myapp.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {

	@RequestMapping("/payForm")
	public String payment() {
		
		return "pay/payApi";
	}
}
