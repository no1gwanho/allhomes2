package com.allhomes.myapp.admin;

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
	public String BoardCategory() {
		return "admin/adminBoard/adminBoardCategory";
	}
	
	
	//스토어-주문내역 페이지로 이동
	@RequestMapping("/adminStoreOrder")
	public String StoreOrder() {
		return "admin/adminStore/adminStoreOrder";
	}
	
	//스토어관리-스토어 페이지로 이동
	@RequestMapping("/adminStore")
	public String adminStore() {
		return "admin/adminStore/adminStoreStore";
	}
	
	
	//스토어관리-스토어 상세 보기로 이동
	@RequestMapping("/adminStoreDetail")
	public ModelAndView StoreDetail() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/adminStore/adminStoreStoreDetail");
		return mav;
	}
	
	//스토어관리-제품 추가 페이지로 이동
	@RequestMapping("/productAdd")
	public String productAdd() {
		return "admin/adminStore/adminStoreProductAdd";
	}
	
	
	//스토어-스토어 추가 페이지로 이동
	@RequestMapping("/storeAdd")
	public String StoreAdd() {
		return "admin/adminStore/adminStoreStoreAdd";
	}
	
	//스토어-카테고리 페이지로 이동
	@RequestMapping("/adminCategory")
	public String adminCategory() {
		return "admin/adminStore/adminStoreCategory";
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
	
	///////////////////////////기능
	
	//관리자 회원가입
	@RequestMapping(value="/adminRegisterOk", method=RequestMethod.POST)
	public ModelAndView adminRegisterOk(AdminRegisterVO vo, HttpSession ses) {
		
		AdminRegisterDaoImp dao = sqlSession.getMapper(AdminRegisterDaoImp.class);
		
		//System.out.println("암호화 전==>"+vo.getEmppwd());
		//비밀번호 암호화
		vo.setEmppwd(passwordEncoder.encode(vo.getEmppwd()));
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
	
	//datepickerTest
	@RequestMapping("/date")
	public String datepicker() {
		return "admin/adminStore/datapickerTest";
	}

}
