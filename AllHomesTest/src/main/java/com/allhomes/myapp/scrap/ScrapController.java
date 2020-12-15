package com.allhomes.myapp.scrap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.homeboard.HomeboardDaoImp;


@Controller
public class ScrapController {
	
SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/mypageScrap")
	public ModelAndView mypageScrapList(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		
		String m_pic = (String)ses.getAttribute("m_pic");
		String nickname = (String)ses.getAttribute("nickname");
		
		int m_no = (Integer)ses.getAttribute("m_no");
		
		
		ScrapDaoImp dao = sqlSession.getMapper(ScrapDaoImp.class);
		List<ScrapVO> scrapList = dao.mypageScrapList(m_no);

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("scrapList", scrapList);
		mav.addObject("m_pic", m_pic);
		mav.addObject("nickname", nickname);
		mav.addObject("m_no", m_no);
		mav.setViewName("/mypage/mypageScrap");

		return mav;
	}
	
	@RequestMapping("/scrapAdd")
	public ModelAndView scrapAdd(ScrapVO vo, HttpServletRequest req, @RequestParam("b_no") int b_no) {
		
		HttpSession ses = req.getSession();
		ModelAndView mav = new ModelAndView();
		vo.setM_no ((Integer)ses.getAttribute("m_no"));
		ScrapDaoImp dao = sqlSession.getMapper(ScrapDaoImp.class);
		
		HomeboardDaoImp hbDao = sqlSession.getMapper(HomeboardDaoImp.class);
		hbDao.homeboardScrapAdd(b_no);
		
		int result = dao.scrapAdd(vo);
		mav.addObject("result", result);
		mav.addObject("b_no", b_no);
		mav.setViewName("/homeboard/scrapResult");

		return mav;
	}
	
	
	
	@RequestMapping("/scrapAddAndMyScrap")
	public ModelAndView scrapAddAnd(ScrapVO vo, HttpSession ses, @RequestParam("b_no") int b_no) {
		
		ModelAndView mav = new ModelAndView();
		vo.setM_no ((Integer)ses.getAttribute("m_no"));
		ScrapDaoImp dao = sqlSession.getMapper(ScrapDaoImp.class);
		
		dao.scrapAdd(vo);
		
		HomeboardDaoImp hbDao = sqlSession.getMapper(HomeboardDaoImp.class);
		hbDao.homeboardScrapAdd(b_no);
		
		mav.setViewName("redirect:mypageScrap");
		
		
		return mav;
	}
	
	
	
	@RequestMapping("/scrapCancel")
	public ModelAndView scrapCancle(int b_no) {
		ModelAndView mav = new ModelAndView();
		ScrapDaoImp dao= sqlSession.getMapper(ScrapDaoImp.class);
		int result = dao.scrapCancel(b_no);
		
		
		HomeboardDaoImp hbDao = sqlSession.getMapper(HomeboardDaoImp.class);
		hbDao.homeboardSrapMinus(b_no);
		
		
		mav.addObject("b_no", b_no);
		mav.addObject("result", result);
		mav.setViewName("/homeboard/scrapResult");
		
		
		
		return mav;
		
	}
	
	
	
}
