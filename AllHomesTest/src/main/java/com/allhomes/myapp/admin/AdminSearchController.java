package com.allhomes.myapp.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.homeboard.HomeboardVO;
import com.allhomes.myapp.register.RegisterVO;
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
		AdminSearchDaoImp dao = sqlSession.getMapper(AdminSearchDaoImp.class);
		List<RegisterVO> mList = dao.adminIntegSearchMember(key); //회원 검색
		List<HomeboardVO> hList = dao.adminIntegSearchHB(key); //homeboard 검색
		List<StoreVO> sList = dao.adminIntegSearchStore(key); //Store 검색 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mList", mList);
		mav.addObject("hList", hList);
		mav.addObject("sList", sList);
		mav.setViewName("admin/adminSearch/adminSearchMain");
		return mav;
	}
	
	
	//slider Test
	@RequestMapping("/sliderTest")
	public String test() {
		return "admin/adminSearch/sliderTest";
	}
}
