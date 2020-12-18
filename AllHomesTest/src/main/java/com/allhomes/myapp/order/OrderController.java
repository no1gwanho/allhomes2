package com.allhomes.myapp.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.cart.CartDaoImp;
import com.allhomes.myapp.cart.CartVO;
import com.allhomes.myapp.mypage.AddressDaoImp;
import com.allhomes.myapp.purchase.PurchaseDaoImp;
import com.allhomes.myapp.purchase.PurchaseJoinVO;
import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.register.RegisterVO;

@Controller
public class OrderController {
	@Autowired
	SqlSession sqlSession;

	// 주문폼으로 이동
	@RequestMapping("/order")
	public ModelAndView orderPage(HttpServletRequest req, @RequestParam("c_no") String c_no) {
		ModelAndView mv = new ModelAndView();

		HttpSession ses = req.getSession();
		OrderDaoImp dao = sqlSession.getMapper(OrderDaoImp.class);
		ses.setAttribute("c_no", c_no);

		int m_no = dao.selectM_no((String) ses.getAttribute("userid"));
		RegisterVO rVO = dao.selectRegis(m_no); // 회원정보 얻어오기

		String StrC_no[] = c_no.split(",");
		int[] c_noList = new int[StrC_no.length]; // 장바구니 번호 배열

		for (int i = 0; i < StrC_no.length; i++) { // 장바구니 배열 String-> int로 변환
			c_noList[i] = Integer.parseInt(StrC_no[i]);
		}

		String itemName = "";

		// itemName 세팅
		if (c_noList.length > 1) { // 두 제품 이상 구매
			itemName = dao.selectOrderCart(c_noList[0]).getPd_name() + " 외 " + (c_noList.length - 1) + "건";
		} else if (c_noList.length <= 1) { // 하나만 구매
			itemName = dao.selectOrderCart(c_noList[0]).getPd_name();
		}

		List<OrderVO> oList = new ArrayList<OrderVO>(); // orderVO 배열

		try { // c_no 넣어서 주문 VO로 들고 나오기
			for (int i = 0; i < c_noList.length; i++) {
				oList.add(dao.selectOrderCart(c_noList[i]));
			}
		} catch (NullPointerException e) {
		}

		mv.addObject("aList", dao.selectAddr(m_no)); // 주소지 리스트
		mv.addObject("oList", oList); // 장바구니 리스트
		mv.addObject("rVO", rVO); // 회원정보
		mv.setViewName("order/orderForm");
		mv.addObject("purchaseName", itemName);

		return mv;
	}

	// 결제 완료 후
	@RequestMapping(value = "/orderPurchase", method = RequestMethod.POST)
	public ModelAndView orderPurchase(HttpSession ses, OrderPurchaseVO vo) {
		ModelAndView mav = new ModelAndView();
		
		
		  OrderDaoImp dao = sqlSession.getMapper(OrderDaoImp.class);
		  CartDaoImp cDao = sqlSession.getMapper(CartDaoImp.class);
		  
		   PurchaseVO pVO = new PurchaseVO(); //구매 VO
		   
		   String c_noStr = (String)ses.getAttribute("c_no");
		   
		   String[] c_noStrList = c_noStr.split(",");
		  
		   //장바구니 번호 배열
		   int[] c_noList = new int[c_noStrList.length];
		   
		   for(int i=0; i<c_noList.length; i++) {
			   c_noList[i] = Integer.parseInt(c_noStrList[i]); //장바구니 번호 int로 바꿔서 넣기
		   }
		   
		   
		   String itemName = "";
		   
		   //itemName 세팅
		   if(c_noList.length>1) { //두 제품 이상 구매
			   itemName = dao.selectOrderCart(c_noList[0]).getPd_name()+" 외 "+(c_noList.length-1)+"건";
		   }else if(c_noList.length<=1) { //하나만 구매
				  dao.selectOrderCart(c_noList[0]).getPd_name();
		   }
		   
		   
		   //주문VO
		   List<OrderVO> oList = new ArrayList<OrderVO>(); // orderVO 배열
			try { // c_no 넣어서 주문 VO로 들고 나오기
				for (int i = 0; i < c_noList.length; i++) {
					oList.add(dao.selectOrderCart(c_noList[i]));
				}
			} catch (NullPointerException e) {
			}
			
			pVO.setTotal_p(vo.getTotal_p()+vo.getShipping_c()); //총가격 세팅
			pVO.setUserid((String)ses.getAttribute("userid")); //id
			pVO.setM_no(dao.selectM_no((String)ses.getAttribute("userid"))); //m_no 세팅
			pVO.setPayment(vo.getPayment()); //구매 유형
			pVO.setStatus("결제완료"); //상태 세팅
			pVO.setA_code(vo.getA_code()); //주소 번호
			pVO.setConfirm("Y");
			pVO.setMemo(vo.getMemo()); //배송 메모
			
			CartOrderVO cVO = new CartOrderVO();
			OrderVO oVO = new OrderVO();
			
			int pc_no = 0; //결제번호
			
			 for(int i=0; i<oList.size(); i++) {
				 oVO = oList.get(i);
				 cVO = dao.selectCart(oVO.getC_no()); //장바구니 VO 가져오기
				 
				 pVO.setPd_no(cVO.getPd_no()); //제품 번호 세팅
				 pVO.setNum(cVO.getNum()); //개수 세팅
				 pVO.setPrice(cVO.getPrice()*cVO.getNum()); //제품당 가격 세팅
				 pVO.setShipping_c(cVO.getShipping_c()); //배송비
				 pVO.setO_value(cVO.getO_value()); //옵션 세팅
				 pVO.setS_no(oVO.getS_no()); //스토어 번호 세팅
				 pc_no = dao.getLastSQ();
				 pVO.setPc_no(pc_no); //시퀀스 세팅
				 
				 if(i==0) {
					 dao.insertPurchaseCurrval(pVO); //다음 상품
				 }else {
					 dao.insertPurchase(pVO); //장바구니 처음 상품 
				 }
			 }
		   
		   AddressVO aVO = dao.selectA_code(vo.getA_code());
		  
		   
		
		   mav.addObject("aVO",dao.selectA_code(vo.getA_code())); //주소지 세팅
		   mav.addObject("oList", oList); // 장바구니 상품 리스트
		   mav.setViewName("order/purchaseOk");
		   mav.addObject("itemName", itemName); //결제 이름
		   mav.addObject("pc_no", pc_no);
		   mav.addObject("vo", vo);
		   mav.addObject("pVO", pVO);
		
		   return mav;
	}

	
	@RequestMapping("/orderCancel")
	public ModelAndView orderDel(@RequestParam("pc_no") String pc_no, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("userid");
		
		String strPc_no[] = pc_no.split("/");
		int[] pc_noList = new int[strPc_no.length];
		
		for(int i=0; i<strPc_no.length; i++) {
			pc_noList[i] = Integer.parseInt(strPc_no[i]);
		}
		
		PurchaseJoinVO pvo = new PurchaseJoinVO();
		pvo.setUserid(userid);
		
		try {
			for(int i=0; i<pc_noList.length; i++) {
				pvo.setPc_no(pc_noList[i]);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}					
		
		PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class);
		List<PurchaseJoinVO> list = dao.purchaseList(pvo); 
		
		mv.setViewName("order/orderCancel");
		
		return mv;
	}
	
	
	@RequestMapping(value="/orderCancelOk", method = RequestMethod.POST)
	public ModelAndView orderCancelOk(@RequestParam("pc_no") int pc_no, HttpServletRequest req,
									@RequestParam("pd_name") String pd_name, @RequestParam("total_p") int total_p) {
		ModelAndView mv = new ModelAndView();
		
		PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class);
		
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("userid");
		
		PurchaseJoinVO pvo = new PurchaseJoinVO();
		pvo.setUserid(userid);
		pvo.setPc_no(pc_no);
		pvo.setPd_name(pd_name);
		pvo.setTotal_p(total_p);
			
		System.out.println("주문 취소 잘 됐어?????????? " + pvo.getChk_c());
		
		List<PurchaseJoinVO> list = dao.orderCancelList(pvo);
		
		mv.addObject("pList", list);
		mv.setViewName("redirect:mypageShopping");
		
		return mv;
	}



	
	
	
	


}
