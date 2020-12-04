package com.allhomes.myapp.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.product.ProductVO;
import com.allhomes.myapp.purchase.PurchaseDaoImp;
import com.allhomes.myapp.purchase.PurchaseVO;
import com.allhomes.myapp.review.ReviewDaoImp;
import com.allhomes.myapp.review.ReviewVO;

@Controller
public class StoreController {
	@Autowired 
	SqlSession sqlSession;
	 
	@Autowired 
	DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/storeHome")	
	public ModelAndView storeHome() {
		ModelAndView mav = new ModelAndView();
		
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);		
		
		mav.addObject("list", dao.productAllList());		
		mav.setViewName("store/storeHome");		

		
		return mav;	
	 }

	@RequestMapping("/storeCategory")
	public String storeCate() {
			
		return "store/storeCate";
	}
	
	@RequestMapping("/storeBest")
	public String storeBest() {
		
		return "store/storeBest";
	}
	
	@RequestMapping("/storeDetail")
	public ModelAndView storeDetail(@RequestParam("pd_no") int pd_no){
    
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		ReviewDaoImp rDao = sqlSession.getMapper(ReviewDaoImp.class);
		PurchaseDaoImp pDao = sqlSession.getMapper(PurchaseDaoImp.class);		
    
    ProductVO vo = dao.selectProduct(pd_no);
		int result = rDao.countReview(pd_no);
		List<ReviewVO> rList = rDao.selectReview(pd_no);
		PurchaseVO pvo = pDao.selectPurchaseListInt(pd_no);
		
		ModelAndView mav = new ModelAndView(); 
		
		mav.addObject("vo", vo);
		mav.addObject("result", result);
		mav.addObject("rList", rList);
		mav.addObject("pvo", pvo);
		
		mav.setViewName("store/storeDetail");		
				
		return mav;
	}
}
