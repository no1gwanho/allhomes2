package com.allhomes.myapp.search;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.homeboard.HomeboardVO;
import com.allhomes.myapp.product.ProductVO;
import com.allhomes.myapp.qna.QnaVO;
import com.allhomes.myapp.register.RegisterVO;
import com.allhomes.myapp.store.StoreProductCategoryVO;

@Controller
public class SearchController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 통합검색
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam("key") String key) {
		
		SearchDaoImp dao = sqlSession.getMapper(SearchDaoImp.class);
		
		List<ProductVO> pList = dao.searchProduct(key); // 제품결과(스토어)
		int pCount = dao.searchProductCount(key); //제품 결과 개수
		
		List<HomeboardVO> hList = dao.searchHB(key);// 집들이게시판 결과 
		int hCount = dao.searchHBCount(key);
		
		
		
		List<QnaVO> qList = dao.searchQNA(key);
		int qCount = dao.searchQNACount(key);
		
		int totalCount = pCount + hCount + qCount;
		

		ModelAndView mav = new ModelAndView();

		
		mav.addObject("hList", hList);
		mav.addObject("hCount", hCount);
		mav.addObject("pList", pList);
		mav.addObject("pCount", pCount);
		mav.addObject("qList", qList);
		mav.addObject("qCount", qCount);
		
		mav.addObject("key", key);
		mav.addObject("totalCount", totalCount);
		

		mav.setViewName("/search/search");
		return mav;
	}
	

	@RequestMapping("/searchStore")
	public ModelAndView searchStore(@RequestParam("key") String key, @RequestParam("order") String order) {
		
		SearchDaoImp dao = sqlSession.getMapper(SearchDaoImp.class);
		ModelAndView mav = new ModelAndView();
		

		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("key", key);
		paramMap.put("order", order);
		
		
		List<StoreProductCategoryVO> pList = dao.searchProductOrder(paramMap);
		
		int pCount = dao.searchProductCount(key);
		
		
		mav.addObject("pList", pList);
		mav.addObject("pCount", pCount);
		mav.addObject("key", key);
		mav.addObject("order", order);
		mav.setViewName("/search/searchStore");
		

		return mav;
	}
	
	
	@RequestMapping("/searchHb")
	public ModelAndView searchHb(@RequestParam("key") String key, @RequestParam("order") String order) {
		ModelAndView mav = new ModelAndView();
		SearchDaoImp dao = sqlSession.getMapper(SearchDaoImp.class);
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("key", key);
		paramMap.put("order", order);
		
		List<StoreProductCategoryVO> hList = dao.searchHBOrder(paramMap);
		
		int hCount = dao.searchHBCount(key);
		
		mav.addObject("hList", hList);
		mav.addObject("hCount", hCount);
		mav.addObject("key", key);
		mav.addObject("order", order);
		mav.setViewName("/search/searchHomeboard");

		return mav;
	}
	
	
	@RequestMapping("/searchQna")
	public ModelAndView searchQna(@RequestParam("key")String key) {
		ModelAndView mav = new ModelAndView();
		
		SearchDaoImp dao = sqlSession.getMapper(SearchDaoImp.class);
		List<QnaVO> qList = dao.searchQNA(key);
		int qCount = dao.searchQNACount(key);
		
		
		mav.addObject("key", key);
		mav.addObject("qList", qList);
		mav.addObject("qCount", qCount);
		mav.setViewName("/search/searchQna");
		
		return mav;
		
	}
	
	
	
	
}
