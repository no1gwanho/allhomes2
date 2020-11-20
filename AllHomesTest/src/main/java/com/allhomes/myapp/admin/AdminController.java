package com.allhomes.myapp.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

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
	
	@RequestMapping("/adminSalesStore")
	public String adminSalesStore() {
		return "admin/adminSales/adminSalesStore";
	}
	

}
