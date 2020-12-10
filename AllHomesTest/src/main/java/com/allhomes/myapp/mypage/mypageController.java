package com.allhomes.myapp.mypage;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.purchase.PurchaseDaoImp;
import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.review.ReviewDaoImp;
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
	public String userEdit(HttpSession session) {
				
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		
		
		session.getAttribute("m_no");
		
		
		//로그인 성공해서 들어오는 경우 ->데이터 셀렉트작업[세션 아이디 값이랑 같은정보 db추출]
		
		
		
		
		//1차 기본정보 쿼리(userEdit)
		//RegisterVO resultVO = dao.
		
		//2차 배송지정보 쿼리(addrEdit)
		
		
		
//		if(session.getAttribute("logStatus") == "N" || session.getAttribute("logStatus") == null) {
//			session.setAttribute("logStatus","N");
//		}
		
	
		return "mypage/userEditForm";
	}
	
	
	//mypage 나의 쇼핑으로 이동
	@RequestMapping("/mypageShopping")
	public ModelAndView purchaseList(HttpSession ses) {
		PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class);

		String userid = (String)ses.getAttribute("userid");
		ModelAndView mav = new ModelAndView();
				
		mav.addObject("pList", dao.allPurchaseList());

		mav.setViewName("mypage/mypageShopping");
		
		return mav;
	}
	
	// 나의 쇼핑 페이지에서 구매확정 버튼 눌렀을 때 
	@RequestMapping(value="/setInPurchase", method=RequestMethod.POST)
	public ModelAndView purchaseUpdate(@RequestParam("pc_no") int pc_no, HttpSession ses) {
		PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class);
		int result = dao.editConfirmCheck(pc_no);
		
		ModelAndView mav = new ModelAndView();
				
		if(result > 0) {			
			ses.setAttribute("confirm", "Y");
			mav.setViewName("mypage/mypageShopping");
		}else {
			mav.addObject("msg", "구매확정에 실패했습니다");
			mav.setViewName("landing/resultPage");
		}		
		
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
