package com.allhomes.myapp.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

	@RequestMapping("/search")	//�˻�â �ӽ��ּ�
	public String search() {
	
		return "/search/search";
	}
	
	@RequestMapping("/searchStore")
	public String storeResult() {
		
		return "/search/storeSearch";
	}
}
