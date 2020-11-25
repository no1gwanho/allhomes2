package com.allhomes.myapp.homeboard;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
	public String homeboardWrite() {
		return "/homeboard/homeboardWrite";
	}
	
	

	@RequestMapping(value="/homeboardWriteOk", method =  {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView homeboardWriteOk(HomeboardVO vo, HttpServletRequest r, HttpSession s) {
		vo.setIp(r.getRemoteAddr());
		vo.setUserid("hong1234"); //임시 아이디
		vo.setNickname("길동이"); //임시 닉네임
		vo.setTheme("모던"); //임시테마
		vo.setThumbnail("ThumnailTest"); //임시썸네일
		vo.setHashtag("hashtag");//임시해시태그
		
		
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		int result = dao.homeboardInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:homeboardHome");
		}else {
			mav.setViewName("homeboard/result");
		}
		return mav;

	}

	
	@RequestMapping("/homeboardView")
	public String homeboardView() {
		return "/homeboard/homeboardView";
	}
	
	@RequestMapping("/homeboardSearch")
	public String homeboardSearchPage() {
		return "/homeboard/homeboardSearch";
		
	}

}
