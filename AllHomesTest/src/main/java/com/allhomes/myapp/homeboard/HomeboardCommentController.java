package com.allhomes.myapp.homeboard;

import java.util.ArrayList;
import java.util.List;

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
	public List<HomeboardCommentVO> commentAllSelect(int b_no) {
		System.out.println("댓글 원글번호: "+b_no);
		HomeboardCommentDaoImp commentDao = sqlSession.getMapper(HomeboardCommentDaoImp.class);
		List<HomeboardCommentVO> list = commentDao.commentAllSelect(b_no);
		
		return list;
	}
	
	@RequestMapping(value="/commentWrite", method= RequestMethod.GET)
	@ResponseBody
	public int commentInsert(HomeboardCommentVO vo, HttpSession ses) {
		HomeboardCommentDaoImp commentDao = sqlSession.getMapper(HomeboardCommentDaoImp.class);
		int result = commentDao.commentInsert(vo);
		
		return result;
		
	}
	
	
	

}
