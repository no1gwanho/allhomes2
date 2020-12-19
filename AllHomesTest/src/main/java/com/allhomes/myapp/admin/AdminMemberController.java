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

	// 회원관리 페이지로 이동(메인)
	@RequestMapping("/adminMemberMain")
	public ModelAndView adminMember() {
		AdminMemberDaoImp dao = sqlSession.getMapper(AdminMemberDaoImp.class);

		List<RegisterVO> list = dao.memberSelectMain();

		// count register
		int month = dao.countRegisterMonth();
		int allCnt = dao.countRegisterTotal();
		int today = dao.countRegisterToday();

		ModelAndView mav = new ModelAndView();

		// 일주일 간 가입한 회원 수
		for (int i = 0; i < 7; i++) {
			mav.addObject("count" + i, dao.countRegisMain(i));
		}

		mav.addObject("out", dao.countRegisOut());
		mav.addObject("month", month);
		mav.addObject("allCnt", allCnt);
		mav.addObject("today", today);
		mav.addObject("list", list);

		mav.setViewName("admin/adminMember/adminMemberMain");
		return mav;
	}

	// 회원정보 상세 페이지로 이동
	/*
	 * @RequestMapping("/adminMemberDetail") public ModelAndView
	 * MemberDetail(@RequestParam("m_no") int m_no, AdminPagingVO vo
	 * , @RequestParam(value="nowPage", required=false)String nowPage
	 * , @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
	 * 
	 * AdminMemberDaoImp dao = sqlSession.getMapper(AdminMemberDaoImp.class);
	 * RegisterVO mVo = dao.memberSelect(m_no); //회원 정보
	 * 
	 * 
	 * // paging// int total = dao.homeboardCnt(mVo.getUserid()); // 총 집들이게시판 수 if
	 * (nowPage == null && cntPerPage == null) { nowPage = "1"; cntPerPage = "10"; }
	 * else if (nowPage == null) { nowPage = "1"; } else if (cntPerPage == null) {
	 * cntPerPage = "10"; } // paging//
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.addObject("mVo", mVo);
	 * 
	 * //집들이 페이징 vo = new AdminPagingVO(total, Integer.parseInt(nowPage),
	 * Integer.parseInt(cntPerPage)); mav.addObject("HBpaging", vo); //집들이 리스트
	 * mav.addObject("hbList",dao.memberHomeboard(vo));
	 * 
	 * 
	 * //주문 페이징
	 * 
	 * total = dao.orderCnt(mVo.getUserid()); vo = new AdminPagingVO(total,
	 * Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	 * mav.addObject("orderpaging", vo);
	 * 
	 * //주문 리스트 List<AdminOrderVO> oList = dao.memberPurchase(mVo.getUserid());
	 * //주문내역
	 * 
	 * 
	 * //집들이 게시판
	 * 
	 * //회원 정보 AdminMemberInfoCountVO infoVO = new AdminMemberInfoCountVO();
	 * infoVO.setBoardCnt(dao.memberHBCnt(mVo.getUserid())+dao.memberQnaCnt(mVo.
	 * getUserid())+ dao.memberReviewCnt(m_no));
	 * infoVO.setOrderCnt(dao.memberOrderCnt(mVo.getUserid()));
	 * infoVO.setScrapCnt(dao.memberScrapCnt(m_no));
	 * infoVO.setWishCnt(dao.memberWishCnt(dao.memberSelect(m_no).getUserid()));
	 * 
	 * 
	 * mav.addObject("infoVO", infoVO);//회원 정보 //mav.addObject("oList", oList);
	 * //주문내역 mav.setViewName("admin/adminMember/adminMemberDetail"); return mav; }
	 */

	
	
	// 멤버리스트 페이지로 이동
	@RequestMapping("/adminMemberList")
	public ModelAndView memberList(AdminPagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		AdminMemberDaoImp dao = sqlSession.getMapper(AdminMemberDaoImp.class);

		// paging//
		int total = dao.countRegisterTotal(); // 총회원수
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "15";
		}
		vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		// paging//

		ModelAndView mav = new ModelAndView();

		// paging
		mav.addObject("paging", vo);
		mav.addObject("viewAll", dao.memberAllSelect(vo));

		mav.setViewName("admin/adminMember/adminMemberList");
		return mav;
	}

	// 멤버리스트 페이지로 이동 (정렬)
	@RequestMapping("/adminMemberOrder")
	public ModelAndView memberOrder(@RequestParam("order") String order, AdminPagingVO vo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		AdminMemberDaoImp dao = sqlSession.getMapper(AdminMemberDaoImp.class);

		// paging//
		int total = dao.countRegisterTotal(); // 총회원수
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
		// paging
		mav.addObject("paging", vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("order", order);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		mav.addObject("viewAll", dao.memberAllSelectOrder(map));

		mav.setViewName("admin/adminMember/adminMemberOrderOk");
		mav.addObject("order", order);
		return mav;

	}

	// 회원 검색(선택검색)
	@RequestMapping("/adminMemberSearch")
	public ModelAndView memberSearch(@RequestParam("value") String value, @RequestParam("key") String key,
			AdminPagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		AdminMemberDaoImp dao = sqlSession.getMapper(AdminMemberDaoImp.class);

		
		HashMap<String, Object> cntMap = new HashMap<String, Object>();
		cntMap.put("value", value);
		cntMap.put("key", key);
		
		// paging//
		int total = dao.memberSearchCnt(cntMap);//선택검색한 회원 수
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "15";
		}
		vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//맵
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("value", value);
		map.put("key", key);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		
		
		ModelAndView mav = new ModelAndView();
		// paging
		mav.addObject("paging", vo);
		mav.addObject("v", value);
		mav.addObject("k", key);
		
		
		mav.addObject("viewAll", dao.memberSearch(map));
		mav.setViewName("admin/adminMember/adminMemberSearchOk");
		
		return mav;

	}

	// 회원 상세 검색
	@RequestMapping("/MemberDetailSearch")
	public ModelAndView memberDeatilSearch(RegisterDetailSearchVO regVo, AdminPagingVO vo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		AdminMemberDaoImp dao = sqlSession.getMapper(AdminMemberDaoImp.class);

		//count 위한 map
		HashMap<String, Object> cntMap = new HashMap<String, Object>();
		cntMap.put("userid", regVo.getUserid());
		cntMap.put("nickname", regVo.getNickname());
		cntMap.put("tel", regVo.getTel());
		cntMap.put("email", regVo.getEmail());
		// paging//
		int total = dao.memberSearchDetailCnt(cntMap);//상세 검색 한 결과의 수
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
	
		mav.addObject("paging", vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", regVo.getUserid());
		map.put("nickname", regVo.getNickname());
		map.put("tel", regVo.getTel());
		map.put("email", regVo.getEmail());
		
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		
		mav.addObject("viewAll", dao.memberSearchDetail(map));

		mav.setViewName("admin/adminMember/adminMemberDetailSearchOk");
		return mav;

	}

}
