package com.allhomes.myapp.homeboard;

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
public class HomeboardController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/homeboardHome")
	public String homeboardHome() {
		return "/homeboard/homeboardHome";
	}
	
	@RequestMapping("/homeboardTop")
	public String homeboardTop() {
		return "/homeboard/homeboardTop";
	}
	
	@RequestMapping("/homeboardTheme")
	public String homeboardTheme() {
		return "/homeboard/homeboardTheme";
	}
	
	@RequestMapping("/homeboardWrite")
	public String homeboardWrite() {
		return "/homeboard/homeboardWrite";
	}
	
	
	
	
	
	
	
	@RequestMapping("/homeboardView")
	public String homeboardView() {
		return "/homeboard/homeboardView";
	}
	
	@RequestMapping("/homeboardSearch")
	public String homeboardSearchPage() {
		return "/homeboard/homeboardSearch";
		
	}

}
