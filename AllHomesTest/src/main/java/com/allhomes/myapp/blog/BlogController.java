package com.allhomes.myapp.blog;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
