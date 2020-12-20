package com.allhomes.myapp.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.homeboard.HomeboardDaoImp;
import com.allhomes.myapp.homeboard.HomeboardVO;
import com.allhomes.myapp.mypage.MypageOrderDaoImp;
import com.allhomes.myapp.mypage.MypageWishlistDaoImp;
import com.allhomes.myapp.mypage.MypageWishlistJoinVO;
import com.allhomes.myapp.qna.QnaDaoImp;
import com.allhomes.myapp.qna.QnaVO;
import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.register.RegisterVO;
import com.allhomes.myapp.scrap.ScrapDaoImp;
import com.allhomes.myapp.scrap.ScrapVO;

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

	@RequestMapping("/adminMemberDetail")
	public ModelAndView memberDetail(@RequestParam("userid") String userid) {
		ModelAndView mv = new ModelAndView();
      
	     
	      RegisterDaoImp reg = sqlSession.getMapper(RegisterDaoImp.class);      
	      RegisterVO vo = reg.oneMeberSelect(userid);
	      AdminMemberDaoImp mDao = sqlSession.getMapper(AdminMemberDaoImp.class);
	      
	      MypageWishlistDaoImp wish = sqlSession.getMapper(MypageWishlistDaoImp.class);
	      List<MypageWishlistJoinVO> list = wish.wishlistPage(userid);
	      
	      int m_no = reg.oneMeberSelect(userid).getM_no();
	      ScrapDaoImp scrap = sqlSession.getMapper(ScrapDaoImp.class);

	      List<ScrapVO> sList = scrap.mypageScrapList(m_no);
	      
	      //나의글리스트 (집들이/질문답변 따로 불러오기)
	      //집들이
	      HomeboardDaoImp myHbDao = sqlSession.getMapper(HomeboardDaoImp.class);
	      List<HomeboardVO> myHbList = myHbDao.myHomeboardList(userid);
	      
	      //질문답변 
	      QnaDaoImp myQnaDao = sqlSession.getMapper(QnaDaoImp.class);
	      List<QnaVO> myQnaList = myQnaDao.myQnaList(userid);
	      
	      //주문 현황 상태
	      MypageOrderDaoImp oDao = sqlSession.getMapper(MypageOrderDaoImp.class);
	      mv.addObject("cntConfirm",oDao.countOrderStatus(userid, "결제완료"));
	      mv.addObject("cntPre",oDao.countOrderStatus(userid, "입금대기"));
	      mv.addObject("cntDelivery",oDao.countOrderStatus(userid, "배송중"));
	      mv.addObject("cntDeliveryDone",oDao.countOrderStatus(userid, "배송완료"));
	      mv.addObject("cntConfirmPur",oDao.countOrderStatus(userid, "구매확정"));
	      mv.addObject("cntReviewDone",oDao.countOrderStatus(userid, "리뷰완료"));
	      
	      
	      mv.addObject("list", list);    //위시리스트
	      mv.addObject("sList", sList); //스크랩
	      mv.addObject("myHbList", myHbList); //내가쓴 집들이
	      mv.addObject("myQnaList", myQnaList); //내가 쓴 질문글 
	      mv.addObject("vo", vo);
	      
	      mv.setViewName("mypage/mypageHome");
	      
	      return mv;
	}
	
	
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
		mav.addObject("order", "");
		mav.addObject("view", "");
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

		mav.setViewName("admin/adminMember/adminMemberList");
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
