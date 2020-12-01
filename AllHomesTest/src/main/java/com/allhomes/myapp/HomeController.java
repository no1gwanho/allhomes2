package com.allhomes.myapp;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSes() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSes(SqlSession sqlSes) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping("/application")
	public String applyStore() {
		
		return "landing/applyForm";
	}
}
