package com.allhomes.myapp.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.register.RegisterVO;

@Controller
public class AdminMemberController {
	SqlSession sqlSession;
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//회원관리 페이지로 이동(메인)
	@RequestMapping("/adminMemberMain")
	public ModelAndView adminMember() {
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		List<RegisterVO> list = dao.memberAllSelect();
		
		//count register
		int month = dao.countRegisterMonth();
		int total = dao.countRegisterTotal();
		int today = dao.countRegisterToday();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("month", month);
		mav.addObject("total", total);
		mav.addObject("today", today);
		
		mav.setViewName("admin/adminMember/adminMemberMain");
		return mav;
	}
		
	//회원관리 페이지 정렬하기
	@RequestMapping("/adminMemberMainOrder")
	public ModelAndView adminMemberMainOrder(@RequestParam("val") String val) {
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		List<RegisterVO> list = dao.memberAllSelectOrder(val);
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("val============="+val);
		
		mav.addObject("list", list);
		mav.setViewName("admin/adminMember/adminMemberMain");
		return mav;
	}
	
	//회원관리 회원정보 상세 페이지로 이동
	@RequestMapping("/adminMemberDetail")
	public ModelAndView MemberDetail(@RequestParam("m_no") int m_no) {
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		RegisterVO mVo = dao.memberSelect(m_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mVo", mVo);
		mav.setViewName("admin/adminMember/adminMemberDetail");
		return mav;
	}
	
	//멤버리스트 페이지로 이동
	@RequestMapping("/adminMemberList")
	public ModelAndView memberList() {
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		List<RegisterVO> list = dao.memberAllSelect();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("admin/adminMember/adminMemberList");
		return mav;
	}
	
	//회원리스트 -> 아이디로 검색
	@RequestMapping("/adminMemberSearchUserid")
	public ModelAndView searchMemberUserid(@RequestParam("key") String userid) {
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		List<RegisterVO> list = dao.searchMemberUserid(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("admin/adminMember/adminMemberList");
		return mav;
		
	}
	//회원리스트 -> 이름으로 검색
	@RequestMapping("/adminMemberSearchUsername")
	public ModelAndView searchMemberUsername(@RequestParam("key") String username) {
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		List<RegisterVO> list = dao.searchMemberUsername(username);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("admin/adminMember/adminMemberList");
		return mav;
		
	}
	
	//회원리스트 -> 회원번호로 검색
}
