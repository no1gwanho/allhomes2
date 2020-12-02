package com.allhomes.myapp.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.purchase.PurchaseDaoImp;
import com.allhomes.myapp.store.StoreDaoImp;
import com.allhomes.myapp.store.StoreVO;

@Controller
public class mypageController {
	@Autowired
	SqlSession sqlSession;

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
	public ModelAndView purchaseList() {
		PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class); 
		ModelAndView mav = new ModelAndView();
				
		mav.addObject("vo", dao.allPurchaseList());
		mav.setViewName("mypage/mypageShopping");
		
		return mav;
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
	
	//mypage 회원 정보 수정으로 이동
	@RequestMapping("/mypageEdit")
	public String mypageSetting() {
		return "mypage/userEditForm";
	}
	
}
