package com.allhomes.myapp.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminSearchController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//search메인 페이지
	@RequestMapping("/adminSearchMain")
	public String adminSearchMain() {
		return "admin/adminSearch/adminSearchMain";
	}
	
	
	//slider Test
	@RequestMapping("/sliderTest")
	public String test() {
		return "admin/adminSearch/sliderTest";
	}
}
