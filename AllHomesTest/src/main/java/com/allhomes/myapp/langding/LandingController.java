package com.allhomes.myapp.langding;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LandingController {

	@RequestMapping(value= "/error")
	public String notFound() {
		return "landing/errorPage";
		
	}

}
