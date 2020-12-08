package com.allhomes.myapp.admin;

import java.util.HashMap;
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
		List<RegisterVO> list = dao.memberSelectMain();
		
		
		//count register
		int month = dao.countRegisterMonth();
		int allCnt = dao.countRegisterTotal();
		int today = dao.countRegisterToday();
		
		ModelAndView mav = new ModelAndView();
		

		mav.addObject("month", month);
		mav.addObject("allCnt", allCnt);
		mav.addObject("today", today);
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
	public ModelAndView memberList(AdminPagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		
		
		//paging//
		int total = dao.countRegisterTotal(); //총회원수
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "15";
		}
		vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//paging//
		
		ModelAndView mav = new ModelAndView();
		
		//paging
		mav.addObject("paging", vo);
		mav.addObject("viewAll", dao.memberAllSelect(vo));
		
		mav.setViewName("admin/adminMember/adminMemberList");
		return mav;
	}
	
	//멤버리스트 페이지로 이동 (정렬)
		@RequestMapping("/adminMemberOrder")
		public ModelAndView memberOrder(@RequestParam("order") String order,
										AdminPagingVO vo
										, @RequestParam(value="nowPage", required=false)String nowPage
										, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			
			RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
			//paging//
			int total = dao.countRegisterTotal(); //총회원수
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "15";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "15";
			}
			vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
	
			ModelAndView mav = new ModelAndView();
			//paging
			mav.addObject("paging", vo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("order", order);
			map.put("start", vo.getStart());
			map.put("end", vo.getEnd());
			mav.addObject("viewAll", dao.memberAllSelectOrder(map));
			
			mav.setViewName("admin/adminMember/adminMemberList");
			return mav;
			
		}
		
	//회원 검색(선택검색)
	@RequestMapping("/adminMemberSearch")
	public ModelAndView memberSearch(@RequestParam("value") String value
									,@RequestParam("key") String key
									,AdminPagingVO vo
									, @RequestParam(value="nowPage", required=false)String nowPage
									, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		//paging//
		int total = dao.countRegisterTotal(); //총회원수
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "15";
		}
		vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		

		ModelAndView mav = new ModelAndView();
		//paging
		mav.addObject("paging", vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("value", value);
		map.put("key", key);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		mav.addObject("viewAll", dao.memberSearch(map));
		
		mav.setViewName("admin/adminMember/adminMemberList");
		return mav;
		
	}

}
