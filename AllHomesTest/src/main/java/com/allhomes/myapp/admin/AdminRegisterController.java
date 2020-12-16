package com.allhomes.myapp.admin;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminRegisterController {

	SqlSession sqlSession;
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//로그인 페이지로 이동
		@RequestMapping("/adminLogin")
		public String adminLogin() {
			return "admin/adminRegister/adminLogin";
		}
		
		
		//회원가입 페이지로 이동(관리자 회원가입)
		@RequestMapping("/adminJoin")
		public String adminJoin() {
			return "admin/adminRegister/adminJoin";
		}
		
		//비밀번호 찾기로 이동
		@RequestMapping("/adminForgotPassword")
		public String forgotPassword() {
			return "admin/adminRegister/adminForgotPassword";
		}
		
		
		
		
	//관리자 로그인
		@RequestMapping(value="/adminLogin", method=RequestMethod.POST)
		public ModelAndView adminLogin(AdminRegisterVO vo, HttpSession ses) {
			ModelAndView mav = new ModelAndView();
		
			AdminRegisterDaoImp dao = sqlSession.getMapper(AdminRegisterDaoImp.class);
			
			//아이디, 비밀번호 체크
			AdminRegisterVO regVo = dao.adminLogin(vo);
			
			if(regVo == null) { //로그인 실패
				mav.setViewName("redirect:adminLogin");
			}else { //아이디 가져옴
				
				regVo.getEmppwd();
				ses.setAttribute("adminid", regVo.getUserid());
				ses.setAttribute("empname", regVo.getEmpname());
				ses.setAttribute("profile", regVo.getProfile());
				ses.setAttribute("logStatus", "Y");
				mav.setViewName("redirect:adminMain");
			}
			
			return mav;
		}
	
		
		//관리자 회원가입
		@RequestMapping(value="/adminRegisterOk", method=RequestMethod.POST)
		@ResponseBody
		public int adminRegisterOk(AdminRegisterVO vo, HttpSession ses) {
			
			
			AdminRegisterDaoImp dao = sqlSession.getMapper(AdminRegisterDaoImp.class);
			
			
			ModelAndView mav = new ModelAndView();
			return dao.adminInsert(vo);
			
		}
		
		
		
		//ID중복체크
		@RequestMapping(value="/idCheck")
		@ResponseBody	
		public int idCheck(String userid) {
			AdminRegisterDaoImp dao = sqlSession.getMapper(AdminRegisterDaoImp.class);
			return dao.idCheck(userid);
		}
		
		//로그아웃
		@RequestMapping("/adminLogout")
		public String adminLogout(HttpSession ses) {
			ses.invalidate();
			return "redirect:adminLogin";
		}
}
