package com.allhomes.myapp.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/qnaMain")
	public ModelAndView qnaMain() {
		QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);
		List<QnaVO> list = dao.qnaAllList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/qna/qnaMain");
		
		return mav;
	}
	
	@RequestMapping("/qnaWrite")
	public ModelAndView qnaWrite() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/qna/qnaWrite");
		
		
		return mav;
	}
	
	
	
	@RequestMapping("/qnaView")
	public ModelAndView qnaView(int q_no, HttpSession ses) {
		
		QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);
		//--> 조회수 증가 넣을 곳 
		QnaVO vo = dao.qnaSelect(q_no);
		
		String loginId = (String)ses.getAttribute("userid");
		String loginNickname = (String)ses.getAttribute("nickname");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", vo);
		mav.addObject("loginId", loginId);
		mav.addObject("loginNickname", loginNickname);
		mav.setViewName("/qna/qnaView");
		
		return mav;
	}
}
