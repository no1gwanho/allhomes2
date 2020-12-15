package com.allhomes.myapp.admin;


import java.text.DecimalFormat;

import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	SqlSession sqlSession;
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	
	
	
	//메인으로 이동
	@RequestMapping("/adminMain")
	public ModelAndView adminMain() {
		AdminHomeDaoImp dao = sqlSession.getMapper(AdminHomeDaoImp.class);
		int memberCnt = dao.countAllMember();
		int boardCnt = dao.countAllQna() + dao.countAllReview() + dao.countAllHomeboard();
		int storeCnt = dao.countAllStore();
		int saleSum = dao.sumAllSale();
		
		//별점 비율
		AdminBoardDaoImp bDao = sqlSession.getMapper(AdminBoardDaoImp.class);
		
		float ratingOne = Math.round((float)bDao.selectReviewOne() / dao.countAllReview()*100);
		float ratingTwo = Math.round((float)bDao.selectReviewTwo() / dao.countAllReview()*100);
		float ratingThree = Math.round((float)bDao.selectReviewThree() / dao.countAllReview()*100);
		float ratingFour = Math.round((float)bDao.selectReviewFour() / dao.countAllReview()*100);
		float ratingFive = Math.round((float)bDao.selectReviewFive() / dao.countAllReview()*100);
		
		System.out.println("a;sldf"+ratingThree);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminHome");
		
		mav.addObject("memberCnt",memberCnt); //총회원수
		mav.addObject("boardCnt",boardCnt); //총 게시판 수
		mav.addObject("storeCnt",storeCnt); //총 스토어 수
		mav.addObject("saleSum",saleSum); //총 매출 수
		mav.addObject("one", ratingOne);
		mav.addObject("two", ratingTwo);
		mav.addObject("three", ratingThree);
		mav.addObject("four", ratingFour);
		mav.addObject("five", ratingFive);
		
		//rating 별점 비율
		
		return mav;	
	}
	
	
	
	
	//======================register=====================================================
	
	
	
	
	//datepickerTest
	@RequestMapping("/date")
	public String datepicker() {
		return "admin/adminStore/datapickerTest";
	}
	
	
}
