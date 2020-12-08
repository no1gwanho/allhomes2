package com.allhomes.myapp.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.homeboard.HomeBoardDetailSearchVO;
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

	// HomeBoard 페이지로 이동
	@RequestMapping("/adminHomeBoard")
	public ModelAndView adminHomeBoard() {

		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.selectAllHomeBoard(); // homeboard 모든 게시물 가져오기

		ModelAndView mav = new ModelAndView();

		mav.addObject("hList", hList);

		mav.setViewName("admin/adminBoard/adminHomeBoard");
		return mav;
	}
	
	//Homeboard 정렬
	@RequestMapping("/adminHomeBoardOrder")
	public ModelAndView adminHomeBoardOrder(@RequestParam("order") String order) {

		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.selectAllHomeBoardOrder(order); // homeboard 모든 게시물 가져오기

		ModelAndView mav = new ModelAndView();

		mav.addObject("hList", hList);

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
	public ModelAndView adminStoreSearch(@RequestParam("key") String key, @RequestParam("value") String value) {
		AdminBoardDaoImp dao = sqlSession.getMapper(AdminBoardDaoImp.class);
		List<HomeboardVO> hList = dao.adminHBSearch(key, value);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hList", hList);

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
	
}
