package com.allhomes.myapp.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.qna.QnaVO;

@Controller
public class AdminQnaBoardController {
	SqlSession sqlSession;
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//qna 페이지로 이동
	@RequestMapping("/adminQnaBoard")
	public ModelAndView adminQnaBoard(AdminPagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		
		//paging//
		int total = dao.countHomeBoardTotal(); //총 집들이게시판 수
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "15";
		}
		vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//paging//
				
		ModelAndView mav = new ModelAndView();
		
		//paging
		mav.addObject("paging", vo);
		mav.addObject("viewAll", dao.qnaAllList(vo));
		
		mav.setViewName("admin/adminBoard/adminQnaBoard");
		return mav;
	}
}
