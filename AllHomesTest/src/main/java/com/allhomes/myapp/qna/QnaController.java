package com.allhomes.myapp.qna;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String qnaMain() {
		return "/qna/qnaMain";
	}
	
	@RequestMapping("/qnaWrite")
	public String qnaWrite() {
		return "/qna/qnaWrite";
	}
	
	@RequestMapping("/qnaView")
	public String qnaView() {
		return "/qna/qnaView";
		
	}
}
