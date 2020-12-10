package com.allhomes.myapp.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.homeboard.HomeBoardDetailSearchVO;
import com.allhomes.myapp.homeboard.HomeboardDaoImp;
import com.allhomes.myapp.homeboard.HomeboardVO;
import com.allhomes.myapp.store.StoreVO;

@Controller
public class AdminHomeBoardController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// HomeBoard 페이지로 이동(페이징 적용)
	@RequestMapping("/adminHomeBoard")
	public ModelAndView adminHomeBoard(AdminPagingVO vo
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
		mav.addObject("paging", vo);
		//paging
		
		
		mav.addObject("viewAll", dao.selectAllHomeBoard(vo));

		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}
	
	//Homeboard 정렬
	@RequestMapping("/adminHomeBoardOrder")
	public ModelAndView adminHomeBoardOrder(@RequestParam("order") String order
			,AdminPagingVO vo
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
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("order", order);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		mav.addObject("viewAll", dao.selectAllHomeBoardOrder(map));
		
		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}


	//Homeboard 보기
	@RequestMapping("/adminHomeBoardView")
	public ModelAndView homeboardView(@RequestParam("b_no") int b_no) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		HomeboardVO vo = dao.adminHomeboardSelect(b_no);

		ModelAndView mav = new ModelAndView();

		mav.addObject("vo", vo);

		mav.setViewName("admin/adminBoard/adminHomeBoardView");
		return mav;
	}
	
	
	//선택검색
	@RequestMapping("/adminHBSearch")
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
		int total = dao.adminHBSearchCount(countMap); //검색한 거의 총 개수
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
		mav.addObject("viewAll", dao.adminHBSearch(map));
		
		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}
		
		
	//상세검색
	@RequestMapping(value="/adminHBSearchDetail", method = RequestMethod.POST)
	public ModelAndView adminHBSearchDetail(HomeBoardDetailSearchVO vo) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.adminHBSearchDetail(vo);
		
		System.out.println(vo.getContent()+vo.getDate()+vo.getDate2()+vo.getHashtag()+vo.getNickname()+vo.getTitle()+vo.getUserid());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hList", hList);
		
		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	 }
	
	//삭제
	@RequestMapping("/adminHomeboardDelete")
	public ModelAndView homeboardDelete(@RequestParam("b_no") int b_no) {
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		
		int result = dao.homeboardDelete(b_no);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:adminHomeBoard");
		}else {
			mav.setViewName("/homeboard/result");
			
		}
		return mav;
	}
	
}
