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

import com.allhomes.myapp.register.RegisterVO;

@Controller
public class OrderController {
	@Autowired
	SqlSession sqlSession;

	
	//주문폼으로 이동
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

		/*
		 * / PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class);
		 * vo.setUserid(userid); int result = dao.insertPurchaseList(vo);
		 * 
		 * List<PurchaseJoinVO> list = dao.joinPurchase(userid); mv.addObject("list",
		 * list); /
		 */

		mv.addObject("oList", oList); // 장바구니 리스트
		mv.addObject("rVO", rVO); // 회원정보
		mv.setViewName("order/orderForm");
		mv.addObject("purchaseName", itemName);
		
		return mv;
	}

	
	//결제 완료 후
	@RequestMapping(value = "/orderPurchase", method = RequestMethod.POST)
	public ModelAndView orderPurchase(HttpSession ses, OrderPurchaseVO vo) {
		ModelAndView mav = new ModelAndView();
		
		
		  OrderDaoImp dao = sqlSession.getMapper(OrderDaoImp.class);
		   
		   
		   
		   PurchaseVO pVO = new PurchaseVO();
		   
		   String c_noStr = (String)ses.getAttribute("c_no");
		   
		   String[] c_noStrList = c_noStr.split(",");
		  
		   
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
		   
		   pVO.setItemName(itemName);
		   pVO.setTotal_p(vo.getTotal_p());
		   pVO.setMethod(vo.getPayment());
		   
		   AddressVO aVO = dao.selectA_code(vo.getA_code());
		   pVO.setAddr(aVO.getAddr() + " " + aVO.getAddrdetail()); //주소 세팅
		   pVO.setTel(aVO.getTel()); //연락처 세팅
		   pVO.setUserid((String)ses.getAttribute("userid"));
		   
		   
		 
		   mav.setViewName("order/purchaseOk");
		   mav.addObject("vo", vo);
		   mav.addObject("pVO", pVO);
		
		   return mav;
	}

	
	@RequestMapping("/purchaseName")
	@ResponseBody
	public String purchaseName(HttpSession ses) {
		OrderDaoImp dao = sqlSession.getMapper(OrderDaoImp.class);

		String c_noStr = (String) ses.getAttribute("c_no");

		String[] c_noStrList = c_noStr.split(",");

		int[] c_noList = new int[c_noStrList.length];

		for (int i = 0; i < c_noList.length; i++) {
			c_noList[i] = Integer.parseInt(c_noStrList[i]); // 장바구니 번호 int로 바꿔서 넣기
		}

		String itemName = "";

		// itemName 세팅
		if (c_noList.length > 1) { // 두 제품 이상 구매
			itemName = dao.selectOrderCart(c_noList[0]).getPd_name() + " 외 " + (c_noList.length - 1) + "건";
		} else if (c_noList.length <= 1) { // 하나만 구매
			itemName = dao.selectOrderCart(c_noList[0]).getPd_name();
		}
		return itemName;
	}
}
