package com.allhomes.myapp.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class QnaCommentController {
	
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/qnaCommentList")
	@ResponseBody
	public List<QnaCommentVO> commentAllSelect(int q_no, HttpSession ses){
		
		QnaCommentDaoImp commentDao = sqlSession.getMapper(QnaCommentDaoImp.class);
		List<QnaCommentVO> commentList = commentDao.commentAllSelect(q_no);
		
		return commentList;
	}
	
	@RequestMapping(value="/qnaCommentWrite", method= RequestMethod.GET)
	@ResponseBody
	public int commentInsert(QnaCommentVO vo, HttpSession ses, @RequestParam("q_no")int q_no) {
		vo.setUserid((String)ses.getAttribute("userid")); //현재 로그인한 사람의 아이디를 Comment-UserID로 넣음
		QnaCommentDaoImp commentDao = sqlSession.getMapper(QnaCommentDaoImp.class);
		int result = commentDao.commentInsert(vo);
		
		QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);
		dao.addAnswer(q_no);
		
		return result;
	}
	
	@RequestMapping(value="/qnaCommentEdit")
	@ResponseBody
	public int commentEdit(QnaCommentVO vo, HttpSession ses) {
		vo.setUserid((String)ses.getAttribute("userid"));
		
		QnaCommentDaoImp commentDao = sqlSession.getMapper(QnaCommentDaoImp.class);
		int result = commentDao.commentEdit(vo);	

		return result;	
	}
	
	@RequestMapping(value="/qnaCommentDel")
	@ResponseBody
	public int commentDelete(int q_c_no, @RequestParam("q_no") int q_no) {
		QnaCommentDaoImp commentDao = sqlSession.getMapper(QnaCommentDaoImp.class);
		int result = commentDao.commentDelete(q_c_no);
		
		QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);
		dao.minusAnswer(q_no);
		
		return result;	
	}
}
