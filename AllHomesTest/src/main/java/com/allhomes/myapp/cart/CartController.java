 package com.allhomes.myapp.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.admin.AdminProductController;
import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.product.ProductVO;

@Controller
public class CartController {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired 
	DataSourceTransactionManager transactionManager;
	
	
	//장바구니 추가
	@RequestMapping("/cartInsert")
	public ModelAndView addCart(HttpServletRequest req, CartVO vo, @RequestParam("pd_no") int pd_no) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(vo.getO_value());
		HttpSession ses = req.getSession();				
		String userid=(String)ses.getAttribute("userid");

		ProductDaoImp pDao = sqlSession.getMapper(ProductDaoImp.class);
		
		ProductVO pVO = pDao.selectProduct(pd_no); 
		
		
		vo.setPrice(pVO.getDiscount()); //가격
		vo.setShipping_c(pVO.getShipping_c()); //배송비
		
		CartDaoImp dao = sqlSession.getMapper(CartDaoImp.class);
		vo.setUserid(userid);		
		int result = dao.addCartList(vo);
		
		List<CartJoinVO> list = dao.joinCart(userid);
		
		mv.addObject("list", list);
		mv.setViewName("cart/cartForm");

		return mv; 
	}
	
	
	//장바구니 리스트
	@RequestMapping("/cartList")
	public ModelAndView cartList(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		
		CartDaoImp dao = sqlSession.getMapper(CartDaoImp.class);
		List<CartJoinVO> list = dao.joinCart(userid);
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("cart/cartForm");

		return mv; 
		
	}
	
	//장바구니 수정
	@RequestMapping(value="/cartEdit",method=RequestMethod.POST)
	public ModelAndView cartEdit(CartVO vo) {
		CartDaoImp dao = sqlSession.getMapper(CartDaoImp.class);
		
		int result = dao.cartUpdate(vo); //장바구니 수정
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:cartList");
		
		return mv;
	}
	
	//장바구니 삭제
	@RequestMapping("/cartDel")
	public ModelAndView cartDel(@RequestParam("c_no") String c_no) {
		
		CartDaoImp dao = sqlSession.getMapper(CartDaoImp.class);
		
		String StrC_no[] = c_no.split(",");
		int[] c_noList = new int[StrC_no.length]; //장바구니 번호 배열
		
		for(int i=0; i<StrC_no.length; i++) { //장바구니 배열 String-> int로 변환
			c_noList[i] = Integer.parseInt(StrC_no[i]);
		}
		
		try { //c_no 넣어서 삭제
			for(int i=0; i<c_noList.length; i++) {
				dao.cartDel(c_noList[i]);
			}
		}catch(NullPointerException e) {}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:cartList");
		
		return mv;
		
	}
}