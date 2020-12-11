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

@Controller
public class OrderController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/order")
	public ModelAndView orderPage(HttpServletRequest req, @RequestParam("c_no") String c_no) {
		ModelAndView mv = new ModelAndView();
		
		OrderDaoImp dao = sqlSession.getMapper(OrderDaoImp.class);
		
		HttpSession ses = req.getSession();		
		String userid = (String)ses.getAttribute("userid");
		
		String StrC_no[] = c_no.split(",");
		
		int[] c_noList = new int[StrC_no.length];
		
		
		for(int i=0; i<StrC_no.length; i++) {
			c_noList[i] = Integer.parseInt(StrC_no[i]);
		}
		
		//System.out.println("카트 번호"+c_noList[0]+c_noList[1]);
		
		List<OrderVO> oList = new ArrayList<OrderVO>();
		
		try {
			for(int i=0; i<c_noList.length; i++) {
				oList.add(dao.selectOrderCart(c_noList[i]));
				
				}
		}catch(NullPointerException e) {
		}
		
		try {
			System.out.println("s;dlkf");
			for(OrderVO vo: oList) {
				System.out.println("번호!!!!!!!!!!!!!!!"+vo.getC_no());
			}

		}catch(NullPointerException e) {
			
		}
			/*
		}
		 * PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class);
		 * vo.setUserid(userid); int result = dao.insertPurchaseList(vo);
		 * 
		 * List<PurchaseJoinVO> list = dao.joinPurchase(userid); mv.addObject("list",
		 * list);
		 */
		
		mv.addObject("oList", oList);
		mv.setViewName("order/orderForm");
		
		return mv; 
	}
}
