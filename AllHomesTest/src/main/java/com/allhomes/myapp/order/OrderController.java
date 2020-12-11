package com.allhomes.myapp.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.purchase.PurchaseDaoImp;
import com.allhomes.myapp.purchase.PurchaseJoinVO;
import com.allhomes.myapp.purchase.PurchaseVO;

@Controller
public class OrderController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/order")
	public ModelAndView orderPage(HttpServletRequest req, PurchaseVO vo) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession ses = req.getSession();		
		String userid = (String)ses.getAttribute("userid");
		PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class);
		vo.setUserid(userid);
		int result = dao.insertPurchaseList(vo);
		
		List<PurchaseJoinVO> list = dao.joinPurchase(userid);
		
		mv.addObject("list", list);
		mv.setViewName("order/oderForm");
		
		return mv; 
	}
}
