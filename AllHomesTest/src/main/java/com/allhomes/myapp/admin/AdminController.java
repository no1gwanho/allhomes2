package com.allhomes.myapp.admin;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.order.OrderDaoImp;

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
	
	
	@RequestMapping("/test3")
	public String ee() {
		return "admin/test";
	}
	
	
	
	
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
		
		AdminRegisterDaoImp rDao = sqlSession.getMapper(AdminRegisterDaoImp.class);
		mav.addObject("aList",rDao.adminAll()); //관리자 정보
		
		//주문 현황
		OrderDaoImp oDao = sqlSession.getMapper(OrderDaoImp.class);
		mav.addObject("confirm",oDao.statusConfirm()); //구매확정
		mav.addObject("delivery",oDao.statusDelivery()); //배송중
		mav.addObject("deliveryPre",oDao.statusDeliveryPre()); //배송준비
		mav.addObject("waiting",oDao.statusDepositWaiting()); //입금대기
		mav.addObject("payment",oDao.statusPayment()); //결제완료
		
		return mav;	
	}
	
	
	
	
	//======================register=====================================================
	
	
	
	
	//datepickerTest
	@RequestMapping("/date")
	public String datepicker() {
		return "admin/adminStore/datapickerTest";
	}
	
	
}
