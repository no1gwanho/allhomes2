package com.allhomes.myapp.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.homeboard.HomeboardVO;

@Controller
public class AdminHomeBoardController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// HomeBoard 페이지로 이동
	@RequestMapping("/adminHomeBoard")
	public ModelAndView adminHomeBoard() {

		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.selectAllHomeBoard(); // homeboard 모든 게시물 가져오기

		ModelAndView mav = new ModelAndView();

		mav.addObject("hList", hList);

		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}

	// Homeboard 검색(Userid)
	@RequestMapping("/adminHomeboardSearchUserid")
	public ModelAndView homeBoardSearch(@RequestParam("key") String key) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.homeBoardSearchUserid(key);

		ModelAndView mav = new ModelAndView();

		mav.addObject("hList", hList);

		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}

	// Homeboard 검색(글제목)
	@RequestMapping("/adminHomeboardSearchTitle")
	public ModelAndView homeBoardSearchTitle(@RequestParam("key") String title) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.homeBoardSearchTitle(title);

		ModelAndView mav = new ModelAndView();

		mav.addObject("hList", hList);

		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}

	// Homeboard 검색(글내용)
	@RequestMapping("/adminHomeboardSearchContent")
	public ModelAndView homeBoardSearchContent(@RequestParam("key") String content) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.homeBoardSearchContent(content);

		ModelAndView mav = new ModelAndView();

		mav.addObject("hList", hList);

		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}

	// Homeboard 보기
	@RequestMapping("/adminHomeBoardView")
	public ModelAndView homeboardView(@RequestParam("b_no") int b_no) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		HomeboardVO vo = dao.adminHomeboardSelect(b_no);

		ModelAndView mav = new ModelAndView();

		mav.addObject("vo", vo);

		mav.setViewName("admin/adminBoard/adminHomeBoardView");
		return mav;
	}
	
	
	//Homeboard 상세 검색-userid
	@RequestMapping("/HBDetailSearchUserid")
	public ModelAndView hbDetailSearchUserid(@RequestParam("key") String userid
											,@RequestParam("date") String date
											,@RequestParam("date2") String date2) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.HBDetailSearchUserid(userid, date, date2);
		ModelAndView mav = new ModelAndView();
		mav.addObject("hList", hList);

		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}
	
	//Homeboard 상세 검색-title
	@RequestMapping("/HBDetailSearchTitle")
	public ModelAndView hbDetailSearchTitle(@RequestParam("key") String title, @RequestParam("date") String date,
			@RequestParam("date2") String date2) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.HBDetailSearchTitle(title, date, date2);
		ModelAndView mav = new ModelAndView();
		mav.addObject("hList", hList);

		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}
	
	//Homeboard 상세 검색-content
	@RequestMapping("/HBDetailSearchContent")
	public ModelAndView hbDetailSearchContent(@RequestParam("key") String content, @RequestParam("date") String date,
			@RequestParam("date2") String date2) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.HBDetailSearchContent(content, date, date2);
		ModelAndView mav = new ModelAndView();
		mav.addObject("hList", hList);

		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}
	
	// Homeboard 상세 검색-기간만
	@RequestMapping("/HBDetailSearch")
	public ModelAndView hbDetailSearch(@RequestParam("date") String date, @RequestParam("date2") String date2) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.HBDetailSearch(date, date2);
		ModelAndView mav = new ModelAndView();
		mav.addObject("hList", hList);

		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}
		
		
}
