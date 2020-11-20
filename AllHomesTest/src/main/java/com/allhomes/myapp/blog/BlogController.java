package com.allhomes.myapp.blog;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BlogController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/blogHome")
	public String blogHome() {
		return "/blog/blogHome";
	}
	
	@RequestMapping("/blogTop")
	public String blogTop() {
		return "/blog/blogTop";
	}
	
	@RequestMapping("/blogTheme")
	public String blogTheme() {
		return "/blog/blogTheme";
	}
	
	@RequestMapping("/blogWrite")
	public String blogWrite() {
		return "/blog/blogWrite";
	}
	
	@RequestMapping("/blogView")
	public String blogView() {
		return "/blog/blogView";
	}
	
	@RequestMapping("/blogSearch")
	public String blogSearchPage() {
		return "/blog/blogSearch";
		
	}
	
	
}
