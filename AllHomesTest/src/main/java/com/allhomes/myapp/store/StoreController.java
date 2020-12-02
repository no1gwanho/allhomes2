package com.allhomes.myapp.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
				
		ReviewVO rv = new ReviewVO();
		int pd_no = rv.getPd_no();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.productAllList(pvo));		
		mav.addObject("pageVO", pageVO);		
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
		PurchaseDaoImp dAo = sqlSession.getMapper(PurchaseDaoImp.class);
		
		ModelAndView mav = new ModelAndView(); 
		
		List<ProductVO> po = dao.joinProductOption();
		List<PurchaseVO> pr = dAo.joinPurchaseReview();

		mav.addObject("po", po);
		mav.addObject("pr", pr);
		mav.setViewName("store/storeDetail");
		
		return mav;
	}
}
