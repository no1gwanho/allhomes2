package com.allhomes.myapp.homeboard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeboardCommentController {
	
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	@RequestMapping("/commentList")
	@ResponseBody
	public List<HomeboardCommentVO> commentAllSelect(int b_no, HttpSession ses) {
		HomeboardCommentDaoImp commentDao = sqlSession.getMapper(HomeboardCommentDaoImp.class);
		List<HomeboardCommentVO> commentList = commentDao.commentAllSelect(b_no);

		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		String writer = dao.getHomeboardWriter(b_no);
		ses.setAttribute("writer", writer);

		return commentList;
	}
	

	
	@RequestMapping(value="/commentWrite", method= RequestMethod.GET)
	@ResponseBody
	public int commentInsert(HomeboardCommentVO vo, HttpSession ses) {
		vo.setUserid((String)ses.getAttribute("userid")); //현재 로그인한 사람의 아이디를 Comment-UserID로 넣음
		HomeboardCommentDaoImp commentDao = sqlSession.getMapper(HomeboardCommentDaoImp.class);
		int result = commentDao.commentInsert(vo);
		
		return result;
		
	}
	
	@RequestMapping(value="/commentEdit")
	@ResponseBody
	public int commentEdit(HomeboardCommentVO vo, HttpSession ses) {
		vo.setUserid((String)ses.getAttribute("userid"));
		
		HomeboardCommentDaoImp commentDao = sqlSession.getMapper(HomeboardCommentDaoImp.class);
		int result = commentDao.commentEdit(vo);	
		
		
		
		return result;	
	}
	
	@RequestMapping(value="/commentDel")
	@ResponseBody
	public int commentDelete(int hb_c_no) {
		HomeboardCommentDaoImp commentDao = sqlSession.getMapper(HomeboardCommentDaoImp.class);
		int result = commentDao.commentDelete(hb_c_no);
		
		return result;
		
	}
	
	
	
	

}
