package com.allhomes.myapp.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminBoardController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//집들이 게시판 카테고리 추가
	@RequestMapping("/homeBoardThemeAdd")
	public ModelAndView homeBoardThemeAdd(String theme) {
		
		//System.out.println("========================"+theme);
		HomeBoardThemeDaoImp dao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		int result = dao.HomeBoardThemeAdd(theme);
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:adminBoardCategory");
		}else {
			mav.addObject("msg", "카테고리 추가에 실패했습니다.");
			mav.setViewName("admin/result");
		}
		return mav;
	}
	
	//집들이 게시판 카테고리 수정
	@RequestMapping("/homeBoardThemeEdit")
	public ModelAndView homeBoardThemeEdit(HomeBoardThemeVO vo) {
		
		HomeBoardThemeDaoImp dao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		int result = dao.HomeBoardThemeEdit(vo);
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:adminBoardCategory");
		}else {
			mav.addObject("msg", "카테고리 수정에 실패했습니다.");
			mav.setViewName("admin/result");
		}
		return mav;
	}
	
	//집들이 게시판 카테고리 삭제
	@RequestMapping("/homeBoardThemeDel")
	public ModelAndView homeBoardThemeDel(@RequestParam("no") int no) {
		System.out.println("a;sldkjf;alkdsjf;alskj");
		HomeBoardThemeDaoImp dao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		int result = dao.HomeBoardThemeDel(no);
		System.out.println(("================")+no);
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:adminBoardCategory");
		}else {
			mav.addObject("msg", "카테고리 삭제에 실패했습니다.");
			mav.setViewName("admin/result");
		}
		return mav;
	}
}
