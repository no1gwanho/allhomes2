package com.allhomes.myapp.find;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindController {

	@RequestMapping("/find")
	public String find(){
		return "/find/find";
	}
	
	@RequestMapping("/findConf")
	public String findConf(){
		return "/find/findConf";
	}
}
