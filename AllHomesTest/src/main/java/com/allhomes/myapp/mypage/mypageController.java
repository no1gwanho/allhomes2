package com.allhomes.myapp.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mypageController {

	//mypage홈으로 이동
	@RequestMapping("/mypageHome")
	public String mypageHome() {
		return "mypage/mypageHome";
	}
	
	//mypage 회원정보수정으로이동
	@RequestMapping("/userEdit")
	public String userEdit() {
		return "mypage/userEditForm";
	}
	
	
	//mypage 나의 쇼핑으로 이동
	@RequestMapping("/mypageShopping")
	public String mypageShopping() {
		return "mypage/mypageShopping";
	}
	
	//mypage 위시리스트로 이동
	@RequestMapping("/mypageWishlist")
	public String mypageWishlist() {
		return "mypage/mypageWishlist";
	}
	
	//mypage 스크랩으로 이동
	@RequestMapping("/mypageScrap")
	public String mypageScrap() {
		return "mypage/mypageScrap";
	}
	
	//mypage 나의 작성글로 이동
	@RequestMapping("/mypageMyboard")
	public String mypageMyboard() {
		return "mypage/mypageMyboard";
	}
	
	
	
}
