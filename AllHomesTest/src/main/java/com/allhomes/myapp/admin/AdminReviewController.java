package com.allhomes.myapp.admin;

import java.util.HashMap;
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

	// review 페이지로 이동
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
		
		
		vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//paging//
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("paging", vo);
		mav.addObject("viewAll", dao.selectAllReview(vo));
		mav.setViewName("admin/adminBoard/adminReview");
		
		return mav;
	}
	
	@RequestMapping("/adminReviewOrder")
	public ModelAndView adminReviewOrder(AdminPagingVO vo,@RequestParam("order") String order,
			 @RequestParam(value="nowPage", required=false)String nowPage
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
		
		
		vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//paging//
		
		
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("order", order);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		
		mav.addObject("viewAll", dao.selectAllHomeBoardOrder(map));
		mav.addObject("order", order);
		
		mav.addObject("paging", vo);
		mav.addObject("viewAll", dao.selectReviewOrder(map));
		mav.setViewName("admin/adminBoard/adminReviewOrder");
		
		return mav;
	}
	
	//선택검색
		@RequestMapping("/adminReviewSearch")
		public ModelAndView adminStoreSearch(@RequestParam("value") String value
				,@RequestParam("key") String key
				,AdminPagingVO vo
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			
			AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
			
			HashMap<String, Object> countMap = new HashMap<String, Object>();
			countMap.put("value", value);
			countMap.put("key", key);
			
			//paging//
			int total = dao.adminReviewSearchCount(countMap); //검색한 거의 총 개수
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "15";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "15";
			}
			
			
			vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			//paging
					

			ModelAndView mav = new ModelAndView();
					
			mav.addObject("paging", vo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("value", value);
			map.put("key", key);
			map.put("start", vo.getStart());
			map.put("end", vo.getEnd());
			mav.addObject("viewAll", dao.searchReview(map));
			
			mav.setViewName("admin/adminBoard/adminReviewSearch");
			return mav;
		}
		
		
	@RequestMapping("/adminReviewDel")
	public ModelAndView reviewDel(@RequestParam("r_no") int r_no) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		int result = dao.reviewDel(r_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.addObject("location", "redirect:adminReview");
		mav.setViewName("admin/delResult");
		
		return mav;
	}

	

	
}


