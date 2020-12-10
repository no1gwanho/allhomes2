package com.allhomes.myapp.homeboard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


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

	
	//집들이 - 댓글리스트 가져오기 
	@RequestMapping("/commentList")
	@ResponseBody
	public List<HomeboardCommentVO> commentAllSelect(int b_no, HttpSession ses) {
		HomeboardCommentDaoImp commentDao = sqlSession.getMapper(HomeboardCommentDaoImp.class);
		List<HomeboardCommentVO> commentList = commentDao.commentAllSelect(b_no);

		return commentList;
	}
	

	//집들이- 새로운 댓글쓰기 
	@RequestMapping(value="/commentWrite", method= RequestMethod.GET)
	@ResponseBody
	public int commentInsert(HomeboardCommentVO vo, HttpSession ses) {
		vo.setUserid((String)ses.getAttribute("userid")); //현재 로그인한 사람의 아이디를 코멘트 쓸때 아이디로 넣음
		HomeboardCommentDaoImp commentDao = sqlSession.getMapper(HomeboardCommentDaoImp.class);
		int result = commentDao.commentInsert(vo);
		
		return result;	
	}
	
	//집들이 - 댓글 수정하기 
	@RequestMapping(value="/commentEdit")
	@ResponseBody
	public int commentEdit(HomeboardCommentVO vo, HttpSession ses) {
		vo.setUserid((String)ses.getAttribute("userid"));
		
		HomeboardCommentDaoImp commentDao = sqlSession.getMapper(HomeboardCommentDaoImp.class);
		int result = commentDao.commentEdit(vo);
		
		return result;	
	}
	
	
	//댓글 삭제하기
	@RequestMapping(value="/commentDel")
	@ResponseBody
	public int commentDelete(int hb_c_no) {
		HomeboardCommentDaoImp commentDao = sqlSession.getMapper(HomeboardCommentDaoImp.class);
		int result = commentDao.commentDelete(hb_c_no);
		
		return result;
	}
	
}
