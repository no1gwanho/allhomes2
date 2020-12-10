package com.allhomes.myapp.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.qna.QnaDaoImp;
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
		int total = dao.countQnaAll();//총 qna 개수 
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		System.out.println("cntperpage"+cntPerPage);
		System.out.println("nowpage"+nowPage);
		
		vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//paging//
				
		ModelAndView mav = new ModelAndView();
		
		//paging
		mav.addObject("paging", vo);
		mav.addObject("viewAll", dao.qnaAllList(vo));
		
		mav.setViewName("admin/adminBoard/adminQnaBoard");
		return mav;
	}
	
	//qna 글 보기
	@RequestMapping("/adminQnaView")
	public ModelAndView qnaView(int q_no, HttpSession ses) {
		
		
		QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);
		String loginId = (String)ses.getAttribute("userid");
		String writer = dao.getQnaWriter(q_no);

		ModelAndView mav = new ModelAndView();

		
		
		QnaVO vo = dao.qnaSelect(q_no);
		
		mav.addObject("vo", vo);
		mav.addObject("loginId", loginId);
		
		mav.setViewName("admin/adminBoard/adminQnaBoardView");
		
		return mav;
	}
}
