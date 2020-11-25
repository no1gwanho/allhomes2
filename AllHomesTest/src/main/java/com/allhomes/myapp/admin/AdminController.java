package com.allhomes.myapp.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.logging.FileHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.store.StoreDaoImp;
import com.allhomes.myapp.store.StoreVO;


@Controller
public class AdminController {

	
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	/////////////////////////////////////////////////////////////
	@RequestMapping("/adminHome")
	public String adminHome() {
		return "admin/adminHome";
	}
	
	//대시보드페이지(메인)으로 이동
	@RequestMapping("/adminMain")
	public String adminMain() {
		return "admin/adminHome";	
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
	
	//회원관리 페이지로 이동
	@RequestMapping("/adminMemberMain")
	public String adminMember() {
		return "admin/adminMember/adminMemberMain";
	}
	
	
	//회원관리 회원정보 상세 페이지로 이동
	@RequestMapping("/adminMemberDetail")
	public String MemberDetail() {
		return "admin/adminMember/adminMemberDetail";
	}
	
	//게시판관리-게시판 메인 페이지로 이동
	@RequestMapping("/adminBoardMain")
	public String adminBoardMain() {
		return "admin/adminBoard/adminBoardMain";
	}
	
	//게시판관리-게시판 카테고리 페이지로 이동
	@RequestMapping("/adminBoardCategory")
	public ModelAndView BoardCategory() {
		
		HomeBoardThemeDaoImp dao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		HomeBoardThemeVO vo = new HomeBoardThemeVO();
		
		List<HomeBoardThemeVO> list = dao.HomeBoardThemeAll(); //테마 전체 가지고 오기
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("admin/adminBoard/adminBoardCategory");
		
		return mav;
	}
	
	
	
	
	
	
	//매출관리 메인 페이지로 이동-sales
	@RequestMapping("/adminSalesMain")
	public String adminSalesMain() {
		return "admin/adminSales/adminSalesMain";
	}
	
	//매출-스토어매출로 이동
	@RequestMapping("/adminSalesStore")
	public String adminSalesStore() {
		return "admin/adminSales/adminSalesStore";
	}
	
	///////////////////////////기능//////////////////////////////////
	
	
	
	//======================register=====================================================
	
	//관리자 회원가입
	@RequestMapping(value="/adminRegisterOk", method=RequestMethod.POST)
	public ModelAndView adminRegisterOk(AdminRegisterVO vo, HttpSession ses) {
		
		
		AdminRegisterDaoImp dao = sqlSession.getMapper(AdminRegisterDaoImp.class);
		System.out.print("테스트 문장");
		
		//System.out.println("암호화 전==>"+vo.getEmppwd());
		//비밀번호 암호화
		//vo.setEmppwd(passwordEncoder.encode(vo.getEmppwd()));
		//System.out.println("암호화 후==>"+vo.getEmppwd());

		
		ModelAndView mav = new ModelAndView();
		int result = dao.adminInsert(vo);
		if(result>0) { //회원가입 성공
			mav.setViewName("redirect:adminLogin");
		}else { //회원가입 실패
			mav.setViewName("redirect:adminJoin");
		}
		return mav;
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
			ses.setAttribute("userid", regVo.getUserid());
			ses.setAttribute("empname", regVo.getEmpname());
			ses.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:adminHome");
		}
		
		return mav;
	}
	
	//ID중복체크
	@RequestMapping(value="/idCheck")
	public int idCheck(String userid) {
		AdminRegisterDaoImp dao = sqlSession.getMapper(AdminRegisterDaoImp.class);
		return dao.idCheck(userid);
	}
	
	
	//datepickerTest
	@RequestMapping("/date")
	public String datepicker() {
		return "admin/adminStore/datapickerTest";
	}
	
	//===========================Store========================
	
	
	
}
