package com.allhomes.myapp.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.OptionDaoImp;
import com.allhomes.myapp.product.OptionVO;
import com.allhomes.myapp.product.PagingVO;
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
	public ModelAndView storeHome(PagingVO pvo) {
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);		
		ReviewDaoImp review = sqlSession.getMapper(ReviewDaoImp.class);
		
		PagingVO pageVO = new PagingVO();
		pageVO.setTotalRecord(dao.getAllProductCount(pageVO));
				
		ReviewVO rVo = review.allReviewList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.productAllList(pvo));		
		mav.addObject("pageVO", pageVO);
		mav.addObject("rList", rVo);
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
		OptionDaoImp oDao = sqlSession.getMapper(OptionDaoImp.class);
		ReviewDaoImp rDao = sqlSession.getMapper(ReviewDaoImp.class);
		PurchaseDaoImp pDao = sqlSession.getMapper(PurchaseDaoImp.class);		
		
		ProductVO vo = dao.selectProduct(pd_no);
		List<OptionVO> oList = oDao.selectOption(pd_no);
		List<ReviewVO> rList = rDao.selectReview(pd_no);
		int result = rDao.countReview(pd_no);
		List<PurchaseVO> pList = pDao.selectPurchaseListPdno(pd_no);
				
		ModelAndView mav = new ModelAndView(); 
		
		mav.addObject("vo", vo);
		mav.addObject("oList", oList);
		mav.addObject("rList", rList);
		mav.addObject("result", result);
		mav.addObject("pVo", pList);
		
		mav.setViewName("store/storeDetail");		
				
		return mav;
	}
}
