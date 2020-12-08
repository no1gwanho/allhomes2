package com.allhomes.myapp.admin;


import java.text.DecimalFormat;

import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	
	
	
	//메인으로 이동
	@RequestMapping("/adminMain")
	public ModelAndView adminMain() {
		AdminHomeDaoImp dao = sqlSession.getMapper(AdminHomeDaoImp.class);
		int memberCnt = dao.countAllMember();
		int boardCnt = dao.countAllQna() + dao.countAllReview() + dao.countAllHomeboard();
		int storeCnt = dao.countAllStore();
		int saleSum = dao.sumAllSale();
		
		//별점 비율
		AdminBoardDaoImp bDao = sqlSession.getMapper(AdminBoardDaoImp.class);
		

		float ratingOne = Math.round((float)bDao.selectReviewOne() / dao.countAllReview()*100);
		float ratingTwo = Math.round((float)bDao.selectReviewTwo() / dao.countAllReview()*100);
		float ratingThree = Math.round((float)bDao.selectReviewThree() / dao.countAllReview()*100);
		float ratingFour = Math.round((float)bDao.selectReviewFour() / dao.countAllReview()*100);
		float ratingFive = Math.round((float)bDao.selectReviewFive() / dao.countAllReview()*100);
		
		System.out.println("a;sldf"+ratingThree);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminHome");
		
		mav.addObject("memberCnt",memberCnt); //총회원수
		mav.addObject("boardCnt",boardCnt); //총 게시판 수
		mav.addObject("storeCnt",storeCnt); //총 스토어 수
		mav.addObject("saleSum",saleSum); //총 매출 수
		mav.addObject("one", ratingOne);
		mav.addObject("two", ratingTwo);
		mav.addObject("three", ratingThree);
		mav.addObject("four", ratingFour);
		mav.addObject("five", ratingFive);
		
		//rating 별점 비율
		
		return mav;	
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
	
	
}
