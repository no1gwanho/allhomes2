package com.allhomes.myapp.register;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterController {
	
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/login")
	public String login() {
		return "landing/loginForm";
	}
	
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk(RegisterVO vo, HttpSession ses) {
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		
		RegisterVO resultVO = dao.login(vo);
		ModelAndView mav = new ModelAndView();
		//로그인여부 : resultVO가 null이면 실패
		
		if(resultVO == null){
			mav.setViewName("redirect:login");
		}else {
			ses.setAttribute("userid", resultVO.getUserid());
			ses.setAttribute("username", resultVO.getUsername());
			ses.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession ses) {
		ses.invalidate();
		return "home";
		
	}
	
	@RequestMapping(value="/register")
	public String register() {
		return "landing/registerForm";
	}
	
	
	//@RequestMapping(value="/registerOk", method=RequestMethod.POST)
	//public ModelAndView registerOk(RegisterVO vo) {
		
		//RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		//int result = dao.customerInsert(vo);
		
		
		
		
	}

