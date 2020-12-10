package com.allhomes.myapp.mypage;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.purchase.PurchaseDaoImp;
import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.register.RegisterVO;

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
	@RequestMapping(value="/userEdit",produces="application/text;charset=UTF-8")
	public ModelAndView userEdit(HttpSession session,MypageUpdateVO vo,RegisterVO vo1) {
		
		MypageUpdateDaoImp dao = sqlSession.getMapper(MypageUpdateDaoImp.class);
		ModelAndView mav = new ModelAndView();	
				
		if(session.getAttribute("m_no")!=null) {	//로그인 성공하고 들어올때 명령 1.주소데이터가 있을대와 2.주소데이터가 없을때
					
			int m_no = (Integer)session.getAttribute("m_no");
			vo.setM_no(m_no);
						
			MypageUpdateVO resultVO = dao.addrSelect(vo);
				
			if(resultVO==null) {	//주소지 데이터가 없을때
									
			}else {//주소지 데이터가 있을때
						
//					//만약에 이 사람이 배송을 안시켜서 주소 데이터가 없다면 공란으로 남겨두기
//					if(resultVO.getReceiver()==null || resultVO.getZipcode()==0 || resultVO.getAddr()==null || resultVO.getAddrdetail()==null ||resultVO.getTel()==null) {
//						mav.addObject("receiver","");
//						mav.addObject("zipcode",0);
//						mav.addObject("addr","");
//						mav.addObject("addrdetail","");
//						mav.addObject("tel","");
//										
//						mav.setViewName("mypage/userEditForm");	//어차피 전부 not null값들이라 하나 비었으면 다비었을것 그냥 view로 보냄
//					
					//}else {
						mav.addObject("receiver",resultVO.getReceiver());
						mav.addObject("zipcode",resultVO.getZipcode());
						mav.addObject("addr",resultVO.getAddr());
						mav.addObject("addrdetail",resultVO.getAddrdetail());
						mav.addObject("tel",resultVO.getTel());
						
						mav.setViewName("mypage/userEditForm");
				//	}
				}
			
		}else {	//로그인 안하고 들어올때 돌려보내야함	
			
			}
			mav.setViewName("mypage/userEditForm");
		
		return mav;
	}
	
	//수정버튼 눌렀을때
	@RequestMapping("updateOk")
	public String updateOk() {
		//vo가 주소 그리고 register 두개로 나눠져있기때문에	=>아이디는 빼고 업데이트 하면됨
		//update도 각각따로 날려줘야한다.
		
		
		
		
		return "";
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
