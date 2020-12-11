package com.allhomes.myapp.order;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.purchase.PurchaseDaoImp;
import com.allhomes.myapp.purchase.PurchaseJoinVO;
import com.allhomes.myapp.purchase.PurchaseVO;
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
		
		int m_no = dao.selectM_no((String)ses.getAttribute("userid"));
		RegisterVO rVO = dao.selectRegis(m_no); //회원정보 얻어오기
		
		String StrC_no[] = c_no.split(",");
		int[] c_noList = new int[StrC_no.length]; //장바구니 번호 배열
		
		
		for(int i=0; i<StrC_no.length; i++) { //장바구니 배열 String-> int로 변환
			c_noList[i] = Integer.parseInt(StrC_no[i]);
		}
		
		//System.out.println("카트 번호"+c_noList[0]+c_noList[1]);
		
		List<OrderVO> oList = new ArrayList<OrderVO>(); //orderVO 배열
		
		try { //c_no 넣어서 주문 VO로 들고 나오기
			for(int i=0; i<c_noList.length; i++) {
				oList.add(dao.selectOrderCart(c_noList[i]));
			}
		}catch(NullPointerException e) {}
		
		mv.addObject("aList", dao.selectAddr(m_no)); //주소지 리스트
		
		
		/* * PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class);
		 * vo.setUserid(userid); int result = dao.insertPurchaseList(vo);
		 * 
		 * List<PurchaseJoinVO> list = dao.joinPurchase(userid); mv.addObject("list",
		 * list);
		 */
		
		mv.addObject("oList", oList); //장바구니 리스트
		mv.addObject("rVO", rVO); //회원정보 
		mv.setViewName("order/orderForm");
		
		return mv; 
	}
	
	
}
