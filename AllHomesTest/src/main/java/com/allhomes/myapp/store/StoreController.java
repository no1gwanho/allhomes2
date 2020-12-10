package com.allhomes.myapp.store;

import java.util.ArrayList;
import java.util.List;
import java.util.Spliterator;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.CategoryDaoImp;
import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.product.ProductJoinVO;
import com.allhomes.myapp.product.ProductVO;
import com.allhomes.myapp.product.Sub_cDaoImp;
import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.review.ReviewDaoImp;

@Controller
public class StoreController {
	@Autowired 
	SqlSession sqlSession;
	 
	@Autowired 
	DataSourceTransactionManager transactionManager;
		
	@RequestMapping("/storeHome")	
	public ModelAndView storeHome(@RequestParam(value="sortPd", required=false) String sortPd) {
		ModelAndView mav = new ModelAndView();
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		List<ProductVO> list = dao.productAllList(sortPd);
		
		StoreDaoImp sdao = sqlSession.getMapper(StoreDaoImp.class);
		List<StoreVO> lst = sdao.selectStoreJoin();
		
		for(int i=0; i<lst.size(); i++) {
			StoreVO vo = lst.get(i);
			String s_name = vo.getS_name();
			
			mav.addObject("list", list);
			mav.addObject("lst", lst);
			mav.addObject("s_name", s_name);
			mav.addObject("sortPd", sortPd);
			mav.setViewName("store/storeHome");	
		}
		
		String sql = sqlSession.getConfiguration().getMappedStatement("productAllList").getBoundSql(sortPd).getSql();
		System.out.println("sql->"+sql);
	
		return mav;	
	 }

	@RequestMapping("/storeCategory")
	public ModelAndView storeCate(@RequestParam(value="c_code", required=false) int c_code) {
		
		System.out.println("스토어 카테고리 넘어가?");
		System.out.println("카테고리값: "+c_code);
		ModelAndView mav = new ModelAndView();
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		List<ProductJoinVO> cList = dao.productCateList(c_code);
		
		StoreDaoImp sdao = sqlSession.getMapper(StoreDaoImp.class);
		List<StoreVO> lst = sdao.selectStoreJoin();
		
		mav.addObject("cList", cList);
		mav.addObject("c_code", c_code);
		mav.setViewName("store/storeCate");			

		return mav;	
	}
	
	@RequestMapping("/storeBest")
	public String storeBest() {
		
		return "store/storeBest";
	}
	
	@RequestMapping("/storeDetail")
	public ModelAndView storeDetail(@RequestParam("pd_no") int pd_no, HttpSession ses){
		ModelAndView mav = new ModelAndView();
		
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		ReviewDaoImp rDao = sqlSession.getMapper(ReviewDaoImp.class);
		Sub_cDaoImp sub = sqlSession.getMapper(Sub_cDaoImp.class);
		
		ProductVO vo = dao.selectProduct(pd_no);
		
		try {
			if(!vo.getO_value().isEmpty()) {
				String options[] = vo.getO_value().split(",");			
				mav.addObject("options", options);
			}else {
				String options = "";
				mav.addObject("options", options);
			}
		}catch(NullPointerException e) {
			
		}
		
		
		mav.addObject("vo", vo);
		mav.addObject("sub", sub.selectSubC(pd_no));
		mav.addObject("result", rDao.countReview(pd_no));	
		mav.setViewName("store/storeDetail");	
			
		return mav;
	}
}
