package com.allhomes.myapp.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class StoreController {

	@RequestMapping("/storeHome")
	public String storeHome() {

		return "store/storeHome";
	}
	
	@RequestMapping("/storeCategory")
	public String storeCate() {
			
		return "store/storeCate";
	}
	
	@RequestMapping("/storeBest")
	public String storeBest() {
		
		return "store/storeBest";
	}
	
	@RequestMapping("/storeDetail")
	public String storeDetail(){
		
		return "store/storeDetail";
	}	
}
