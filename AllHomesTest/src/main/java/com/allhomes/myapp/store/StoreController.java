package com.allhomes.myapp.store;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.PagingVO;
import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.product.ProductJoinVO;
import com.allhomes.myapp.review.ReviewDaoImp;

import com.allhomes.myapp.review.ReviewJoinVO;
import com.allhomes.myapp.review.ReviewVO;


@Controller
public class StoreController {
	
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired 
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Autowired 
	DataSourceTransactionManager transactionManager;
		
	@RequestMapping("/storeHome")
	public ModelAndView storeHome(@RequestParam("order") String order, StoreProductCategoryVO vo) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		ModelAndView mav = new ModelAndView();
	
		
		List<StoreProductCategoryVO> shList = dao.storeOrderList(order);
		
		mav.addObject("shList", shList);
		mav.addObject("order", order);
		mav.setViewName("store/storeHome");
		
		return mav;
	}
	
	
	@RequestMapping("/storeBest")
	public ModelAndView storeBest(@RequestParam("order") String order) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		List<StoreProductCategoryVO> bestList = dao.storeOrderList(order);
		
		mav.addObject("bestList", bestList);
		mav.addObject("order", order);
		mav.setViewName("store/storeBest");
		
		
		return mav;
	}
	
	
	@RequestMapping("/storeCategory")
	public ModelAndView storeCatey(@RequestParam("main_c") String main_c, @RequestParam("sub_c") String sub_c) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> paramMap = new HashMap();
		paramMap.put("main_c", main_c);
		paramMap.put("sub_c", sub_c);
		
		List<StoreProductCategoryVO> categoryList = dao.storeCategoryList(paramMap);
		
		mav.addObject("categoryList", categoryList);
		mav.addObject("main_c", main_c);
		mav.addObject("sub_c", sub_c);
		mav.addObject("paramMap", paramMap);
		mav.setViewName("store/storeCate");
		
		return mav;
	}


	@RequestMapping("/storeDetail")
	public ModelAndView storeDetail(@RequestParam("pd_no") int pd_no, HttpServletRequest r){
		ModelAndView mav = new ModelAndView();
		
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		ReviewDaoImp rDao = sqlSession.getMapper(ReviewDaoImp.class);
		HttpSession ses = r.getSession();
		
		String userid = (String)ses.getAttribute("userid");
		
		ProductJoinVO vo = dao.selectDetailPage(pd_no);
		
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
		mav.addObject("userid", userid);
		mav.addObject("rvo", rDao.avgReview(pd_no));
		mav.addObject("result", rDao.countReview(pd_no));
		mav.addObject("rList", rDao.selectReview(pd_no));		
		
		mav.setViewName("store/storeDetail");	
			
		return mav;
	}
}

	/* @은빈

	@RequestMapping("/storeHome")	
	public ModelAndView storeHome(@RequestParam(value="sortPd", required=false) String sortPd) {
		ModelAndView mav = new ModelAndView();
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		List<ProductVO> list = dao.productAllList(sortPd);
		
		CategoryDaoImp cateDao = sqlSession.getMapper(CategoryDaoImp.class);
		List<CategoryVO> categoryList = cateDao.categoryList();
		
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
		 */
