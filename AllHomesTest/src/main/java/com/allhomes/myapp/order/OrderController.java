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
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.register.RegisterVO;

@Controller
public class OrderController {
	@Autowired
	SqlSession sqlSession;

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

		return mv;
	}

	
	
	@RequestMapping(value = "/orderPurchase", method = RequestMethod.POST)
	public ModelAndView orderPurchase(HttpSession ses, OrderPurchaseVO vo) {
		ModelAndView mav = new ModelAndView();
		
		
		  OrderDaoImp dao = sqlSession.getMapper(OrderDaoImp.class);
		   
		   
		   
		   PayApiVO pVO = new PayApiVO();//결제 VO
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
		   
		   
		   
		   /*
			 
			 * if(c_noList.length>1) { //구매에 2개 이상 itemName =
			 * dao.selectOrderCart(c_noList[0]).getPd_name()+"외 "+(c_noList.length-1)+"건";
			 * //ex)원목테이블 외 3건
			 * 
			 * 
			 * }else if(c_noList.length<=1) { //하나만 구매 itemName =
			 * dao.selectOrderCart(c_noList[0]).getPd_name(); }
			 * 
			 * OrderVO oVO = new OrderVO(); String[] pd_name = new String[c_noList.length];
			 * //제품 이름 int[] pd_no = new int[c_noList.length]; //제품 번호 int[] num = new
			 * int[c_noList.length]; //개수 int[] price = new int[c_noList.length]; //가격
			 * 
			 * for(int i=0; i<c_noList.length;i++) { oVO = dao.selectOrderCart(c_noList[i]);
			 * pd_name[i] = oVO.getPd_name(); pd_no[i] = oVO.getPd_no(); num[i] =
			 * oVO.getNum(); price[i] = oVO.getPrice(); }
			 * 
			 * AddressVO aVO = dao.selectA_code(vo.getA_code());
			 * 
			 * 
			 * pVO.setItemName(itemName); //구매이름
			 * //pVO.setTotal_p(vo.getTotal_p()+vo.getShipping_c()); //총 가격
			 * pVO.setMethod(vo.getPayment()); //구매 유형
			 * 
			 * pVO.setPd_name(pd_name);//아이템 이름 pVO.setPd_no(pd_no);//제품 번호
			 * pVO.setNum(num);//개수 pVO.setPrice(price);//가격
			 * 
			 */
		   
		   
		  

		
		//mav.setViewName("order/purchaseTest");
		mav.setViewName("pay/payApi");
		mav.addObject("vo", vo);
		mav.addObject("pVO", pVO);
		
		return mav;
	}

}
