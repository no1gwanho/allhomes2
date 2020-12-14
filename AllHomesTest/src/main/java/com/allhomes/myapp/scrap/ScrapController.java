package com.allhomes.myapp.scrap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


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
	
	
}
