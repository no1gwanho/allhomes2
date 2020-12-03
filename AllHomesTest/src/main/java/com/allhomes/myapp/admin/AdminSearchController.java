package com.allhomes.myapp.admin;

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
import com.allhomes.myapp.search.ProductStoreJoinVO;
import com.allhomes.myapp.store.StoreVO;

@Controller
public class AdminSearchController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//search메인 페이지
	@RequestMapping("/adminSearchMain")
	public ModelAndView adminSearchMain(@RequestParam("key") String key) {
		ModelAndView mav = new ModelAndView();
		AdminSearchDaoImp dao = sqlSession.getMapper(AdminSearchDaoImp.class);
		
		List<RegisterVO> mList = dao.adminIntegSearchMember(key); //회원 검색
		mav.addObject("mCount", dao.adminIntegSearchMemberCount(key));
		List<HomeboardVO> hList = dao.adminIntegSearchHB(key); //homeboard 검색
		mav.addObject("hCount", dao.adminIntegSearchHBCount(key));
		List<StoreVO> sList = dao.adminIntegSearchStore(key); //Store 검색 
		mav.addObject("sCount", dao.adminIntegSearchStoreCount(key));
		List<ProductStoreJoinVO> pList = dao.adminIntegSearchProduct(key); //product 검색
		mav.addObject("pCount", dao.adminIntegSearchProductCount(key));
		
		mav.addObject("mList", mList);
		mav.addObject("hList", hList);
		mav.addObject("sList", sList);
		mav.addObject("pList", pList);
		mav.setViewName("admin/adminSearch/adminSearchMain");
		return mav;
	}
	
	
	//slider Test
	@RequestMapping("/sliderTest")
	public String test() {
		return "admin/adminSearch/sliderTest";
	}
}
