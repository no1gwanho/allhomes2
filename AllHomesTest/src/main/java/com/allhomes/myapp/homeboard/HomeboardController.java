package com.allhomes.myapp.homeboard;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.admin.HomeBoardThemeDaoImp;
import com.allhomes.myapp.admin.HomeBoardThemeVO;

@Controller
public class HomeboardController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/homeboardHome")
	public String homeboardHome() {
		return "/homeboard/homeboardHome";
	}
	
	@RequestMapping("/homeboardTop")
	public String homeboardTop() {
		return "/homeboard/homeboardTop";
	}
	
	@RequestMapping("/homeboardTheme")
	public String homeboardTheme() {
		return "/homeboard/homeboardTheme";
	}
	
	

	   @RequestMapping("/homeboardWrite")
	   public ModelAndView homeboardWrite() {
	      HomeBoardThemeDaoImp themeDao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
	      List<HomeBoardThemeVO> themeList = themeDao.HomeBoardThemeAll(); //테마 리스트 불러오기 
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("themeList", themeList);
	      mav.setViewName("/homeboard/homeboardWrite");
	      
	      return mav;
	   }


	   @RequestMapping(value="/homeboardWriteOk", method = RequestMethod.POST)
	   public ModelAndView homeboardWriteOk(HomeboardVO vo, HttpServletRequest r, HttpSession s) {
	      vo.setIp(r.getRemoteAddr());
	      vo.setUserid("hong1234"); //임시 아이디
	      vo.setNickname("길동이"); //임시 닉네임
	      vo.setThumbnail("ThumnailTest"); //임시썸네일
	      
	      int b_no = 0;
	      
	      HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
	      int result = dao.homeboardInsert(vo);
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("vo", vo);
	      
	      
	      if(result>0) {
	         b_no = dao.getHomeboardNumber(); //System.out.println(b_no); --> 현재 저장된 글번호가 몇인지 확인 
	         vo.setB_no(b_no);
	         
	         mav.addObject("b_no", b_no);
	         mav.setViewName("redirect:/homeboardView");
	         
	      }else {
	         mav.setViewName("/homeboard/result");
	      }
	      return mav;
	   }



	
	@RequestMapping("/homeboardSearch")
	public String homeboardSearchPage() {
		return "/homeboard/homeboardSearch";
		
	}

}
