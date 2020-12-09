package com.allhomes.myapp.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.store.StoreVO;

@Controller
public class AdminSalesController {
	SqlSession sqlSession;
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//sale 메인 페이지로 이동-sales
	@RequestMapping("/adminSalesMain")
	public String adminSalesMain() {
		return "admin/adminSales/adminSalesMain";
	}
	
	//store Sales 이동
	@RequestMapping("/adminSalesStore")
	public ModelAndView adminStore(AdminPagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {

		AdminStoreDaoImp dao = sqlSession.getMapper(AdminStoreDaoImp.class);
		
		//paging//
		int total = dao.storeCount(); //총 스토어 수
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
		mav.addObject("viewAll", dao.storeAll(vo));
		mav.setViewName("admin/adminSales/adminSalesStore");

		return mav;
	}
	
	//스토어별 매출 상세 페이지로 이동
	@RequestMapping("/adminSalesStoreDetail")
	public ModelAndView adminSalesStoreDetail(@RequestParam("s_no") int s_no) {
		
		AdminSalesDaoImp dao = sqlSession.getMapper(AdminSalesDaoImp.class);
		AdminStoreDaoImp sDao = sqlSession.getMapper(AdminStoreDaoImp.class);
		AdminBoardDaoImp bDao = sqlSession.getMapper(AdminBoardDaoImp.class);
		ProductDaoImp pDao = sqlSession.getMapper(ProductDaoImp.class);
		
		StoreVO storeVO = sDao.storeSelect(s_no); //스토어 정보
		AdminSalesStoreVO todayVO = dao.storeSalesToday(s_no); //오늘 매출,확정 건수
		AdminSalesStoreVO monthVO = dao.storeSalesMonth(s_no); //한달 매출,확정 건수
		AdminSalesStoreVO threeVO = dao.storeSalesThree(s_no); //세달 매출,확정 건수
		AdminSalesStoreVO totalVO = dao.storeSalesTotal(s_no); //총 매출, 확정 건수
		
		
		
		ModelAndView mav = new ModelAndView();
		AdminSalesStoreVO vo = dao.countStoreOrderToday(s_no);
		mav.addObject("cntToday", vo.getConfirmCnt()); //오늘 주문건수
		
		vo = dao.countStoreOrderMonth(s_no);
		mav.addObject("cntMonth", vo.getConfirmCnt()); //한달 주문건수 
		
		vo = dao.countStoreOrderThree(s_no);
		mav.addObject("cntThree", vo.getConfirmCnt()); //세달 주문건수
		
		mav.addObject("storeVO", storeVO);
		mav.addObject("todayVO", todayVO);
		mav.addObject("monthVO", monthVO);
		mav.addObject("threeVO", threeVO);
		mav.addObject("totalVO", totalVO);
		
		//store 별점 정보
		mav.addObject("one", Math.round((float)bDao.selectReviewOne() / bDao.storeReviewCount(s_no)*100));
		mav.addObject("two", Math.round((float)bDao.selectReviewTwo() / bDao.storeReviewCount(s_no)*100));
		mav.addObject("three", Math.round((float)bDao.selectReviewThree() / bDao.storeReviewCount(s_no)*100));
		mav.addObject("four", Math.round((float)bDao.selectReviewFour() / bDao.storeReviewCount(s_no)*100));
		mav.addObject("five", Math.round((float)bDao.selectReviewFive() / bDao.storeReviewCount(s_no)*100));
		mav.addObject("avgRating", (float)dao.sumStoreReviewRating(s_no)/bDao.storeReviewCount(s_no)); //리뷰 평균 평점
		mav.addObject("countReview", bDao.storeReviewCount(s_no)); //리뷰 총 개수
		//store 제품 개수
		mav.addObject("cntPd", pDao.countProduct(s_no));
		
		/*
		 * System.out.println("제품 개수="+bDao.storeReviewCount(s_no));
		 * System.out.println("총 별점 평균="+dao.sumStoreReviewRating(s_no)/bDao.
		 * storeReviewCount(s_no));
		 */
		mav.setViewName("admin/adminSales/adminSalesStoreDetail");
		return mav;
	}
		
		
		
}
