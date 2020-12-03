package com.allhomes.myapp.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.homeboard.HomeboardVO;
import com.allhomes.myapp.product.ProductVO;
import com.allhomes.myapp.register.RegisterVO;

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
		
		//List<RegisterVO> mList = dao.searchMember(key);// 회원 결과 
		//질문과 답변 결과

		ModelAndView mav = new ModelAndView();

		//mav.addObject("mList", mList);
		mav.addObject("hList", hList);
		mav.addObject("hCount", hCount);
		mav.addObject("pList", pList);
		mav.addObject("pCount", pCount);
		mav.addObject("key", key);

		mav.setViewName("/search/search");
		return mav;
	}

	@RequestMapping("/searchStore")
	public String storeResult() {

		return "/search/storeSearch";
	}
}
