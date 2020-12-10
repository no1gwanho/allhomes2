package com.allhomes.myapp.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminReviewController {
	SqlSession sqlSession;
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//review 페이지로 이동
	@RequestMapping("/adminReview")
	public ModelAndView adminReview(AdminPagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		
		//paging//
		int total = dao.countAllReview();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}
		System.out.println("cntperpage"+cntPerPage);
		System.out.println("nowpage"+nowPage);
		
		vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//paging//
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("paging", vo);
		mav.addObject("viewAll", dao.selectAllReview(vo));
		mav.setViewName("admin/adminBoard/adminReview");
		
		return mav;
		
		
	}
}
