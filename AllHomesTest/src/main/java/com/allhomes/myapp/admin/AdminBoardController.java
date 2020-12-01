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
public class AdminBoardController {
	SqlSession sqlSession;
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	//Board 메인 페이지로 이동
	@RequestMapping("/adminBoardMain")
	public ModelAndView adminBoardMain() {
		
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		int countHb = dao.countHomeBoardToday(); //오늘 올라온 게시글 수 
		int countReview = dao.countReviewToday(); 
		int countQa = dao.countQAToday();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("countHb",countHb);
		mav.addObject("countQa",countQa);
		mav.addObject("countReview",countReview);
		
		List<HomeboardVO> hList = dao.selectAllHomeBoard(); //homeboard 모든 게시물 가져오기
		
		mav.addObject("hList", hList);
		
		mav.setViewName("admin/adminBoard/adminBoardMain");
		return mav;
	}
	
	//HomeBoard 페이지로 이동
	@RequestMapping("/adminHomeBoard")
	public ModelAndView adminHomeBoard() {
		
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.selectAllHomeBoard(); //homeboard 모든 게시물 가져오기
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("hList", hList);
		
		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}
	
	
	//Homeboard 검색(Userid)
	@RequestMapping("/adminHomeboardSearchUserid")
	public ModelAndView homeBoardSearch(@RequestParam("key") String key) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.homeBoardSearchUserid(key);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("hList", hList);
		
		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}
	
	//Homeboard 검색(글제목)
	@RequestMapping("/adminHomeboardSearchTitle")
	public ModelAndView homeBoardSearchTitle(@RequestParam("key") String title) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.homeBoardSearchTitle(title);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("hList", hList);
		
		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}
	
	//Homeboard 검색(글내용)
	@RequestMapping("/adminHomeboardSearchContent")
	public ModelAndView homeBoardSearchContent(@RequestParam("key") String content) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.homeBoardSearchContent(content);
			
		ModelAndView mav = new ModelAndView();
			
		mav.addObject("hList", hList);
			
		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}
	
	//Homeboard 보기
	@RequestMapping("/adminHomeBoardView")
	public ModelAndView homeboardView(@RequestParam("b_no") int b_no) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		HomeboardVO vo = dao.adminHomeboardSelect(b_no);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", vo);
			
		mav.setViewName("admin/adminBoard/adminHomeBoardView");
		return mav;
	}
	
	
	
	//Board Category 페이지로 이동
	@RequestMapping("/adminBoardCategory")
	public ModelAndView BoardCategory() {
			
		HomeBoardThemeDaoImp dao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		HomeBoardThemeVO vo = new HomeBoardThemeVO();
			
		List<HomeBoardThemeVO> list = dao.HomeBoardThemeAll(); //테마 전체 가지고 오기
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("admin/adminBoard/adminHomeBoardView");
			
		return mav;
	}
		
		
		
	//Board Category 추가
	@RequestMapping("/homeBoardThemeAdd")
	public ModelAndView homeBoardThemeAdd(String theme) {
		
		//System.out.println("========================"+theme);
		HomeBoardThemeDaoImp dao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		int result = dao.HomeBoardThemeAdd(theme);
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:adminBoardCategory");
		}else {
			mav.addObject("msg", "카테고리 추가에 실패했습니다.");
			mav.setViewName("admin/result");
		}
		return mav;
	}
	
	//Board Category 수정
	@RequestMapping("/homeBoardThemeEdit")
	public ModelAndView homeBoardThemeEdit(HomeBoardThemeVO vo) {
		
		HomeBoardThemeDaoImp dao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		int result = dao.HomeBoardThemeEdit(vo);
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:adminBoardCategory");
		}else {
			mav.addObject("msg", "카테고리 수정에 실패했습니다.");
			mav.setViewName("admin/result");
		}
		return mav;
	}
	
	//Board Category 삭제
	@RequestMapping("/homeBoardThemeDel")
	public ModelAndView homeBoardThemeDel(@RequestParam("no") int no) {
		System.out.println("a;sldkjf;alkdsjf;alskj");
		HomeBoardThemeDaoImp dao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		int result = dao.HomeBoardThemeDel(no);
		System.out.println(("================")+no);
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:adminBoardCategory");
		}else {
			mav.addObject("msg", "카테고리 삭제에 실패했습니다.");
			mav.setViewName("admin/result");
		}
		return mav;
	}
}
