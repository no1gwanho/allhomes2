package com.allhomes.myapp.homeboard;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.admin.HomeBoardThemeDaoImp;
import com.allhomes.myapp.admin.HomeBoardThemeVO;

@Controller
public class HomeboardController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping("/homeboardHome")
	public ModelAndView homeboardHome() {
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		List<HomeboardVO> list = dao.homeboardAllList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/homeboard/homeboardHome");

		return mav;
	}

	@RequestMapping("/homeboardTop")
	public String homeboardTop() {
		return "/homeboard/homeboardTop";
	}

	
	@RequestMapping("/homeboardTheme?hb_them_no")
	public ModelAndView homeboardTheme(int hb_theme_no) {
		HomeBoardThemeDaoImp themeDao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		List<HomeBoardThemeVO> themeList = themeDao.HomeBoardThemeAll();
		
		ModelAndView mav = new ModelAndView();
		//mav.addObject("themeList", themeList);
		//mav.setViewName("/homeboard/homeboardTheme");
		return mav;

	}
	
	@RequestMapping("/homeboardTheme")
	public ModelAndView homeboardTheme() {
		HomeBoardThemeDaoImp themeDao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		List<HomeBoardThemeVO> themeList = themeDao.HomeBoardThemeAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("themeList", themeList);
		mav.setViewName("/homeboard/homeboardTheme");
		return mav;

	}
	
	
	

	@RequestMapping("/homeboardWrite")
	public ModelAndView homeboardWrite() {
		HomeBoardThemeDaoImp themeDao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		List<HomeBoardThemeVO> themeList = themeDao.HomeBoardThemeAll(); // 테마 리스트 불러오기

		ModelAndView mav = new ModelAndView();
		mav.addObject("themeList", themeList);
		mav.setViewName("/homeboard/homeboardWrite");
	

		return mav;
	}

	@RequestMapping(value = "/homeboardWriteOk", method = RequestMethod.POST)
	public ModelAndView homeboardWriteOk(HomeboardVO vo, HttpServletRequest r, HttpSession s) {
		vo.setIp(r.getRemoteAddr());
		vo.setUserid("hong1234"); // 임시 아이디
		vo.setNickname("길동이"); // 임시 닉네임

		// 썸네일찾기 ====================
		String hbContent = vo.getContent();

		int idx = hbContent.indexOf("/resources/");
		int jpg1 = hbContent.indexOf("JPG");
		int jpg2 = hbContent.indexOf("jpg");
		int gif = hbContent.indexOf("gif");
		int png = hbContent.indexOf("png");
		System.out.println(jpg1 + ", " + jpg2 + ", " + gif + ", " + png);
		

		try {

			if (jpg1 > -1) {
				String thumbnailUrl = hbContent.substring(idx, jpg1 + 3);
				System.out.println(thumbnailUrl);
				vo.setThumbnail(thumbnailUrl); //썸네일
			}else if (jpg2 > -1) {
				String thumbnailUrl = hbContent.substring(idx, jpg2 + 3);
				System.out.println(thumbnailUrl);
				vo.setThumbnail(thumbnailUrl); //썸네일
			}else if (gif > -1) {
				String thumbnailUrl = hbContent.substring(idx, gif+3);
				System.out.println(thumbnailUrl);
				vo.setThumbnail(thumbnailUrl); //썸네일
			}else if (png > -1) {
				String thumbnailUrl = hbContent.substring(idx, png+3);
				System.out.println(thumbnailUrl);
				vo.setThumbnail(thumbnailUrl); // 썸네일
			}else { //사진없는 글일때 준비된 파일 넣어주기
				vo.setThumbnail("/resources/img/allhomes3.png");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		//글 입력 성공하면 바로 해당 글View로 이동 
		int b_no = 0;

		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		int result = dao.homeboardInsert(vo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);

		if (result > 0) {
			b_no = dao.getHomeboardNumber(); // System.out.println(b_no); --> 현재 저장된 글번호가 몇인지 확인
			vo.setB_no(b_no);

			mav.addObject("b_no", b_no);
			mav.setViewName("redirect:/homeboardView");

		} else {
			mav.setViewName("/homeboard/result");
		}
		return mav;
	}

	@RequestMapping("/homeboardView")
	public ModelAndView homeboardView(int b_no) {

		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		HomeboardVO vo = dao.homeboardSelect(b_no);

		// 해시태그 가져오기 
		ModelAndView mav = new ModelAndView();

		String hashtag = vo.getHashtag(); // System.out.println(hashtag);
		if (hashtag != null) {
			String hashtagStr[] = hashtag.split(",");
			List<String> hashtagList = new ArrayList<String>();
			hashtagList = Arrays.asList(hashtagStr);
			mav.addObject("hashtagList", hashtagList);

		}

		mav.addObject("vo", vo);
		mav.setViewName("homeboard/homeboardView");

		return mav;
	}

	@RequestMapping("/homeboardSearch")
	public String homeboardSearchPage() {
		return "/homeboard/homeboardSearch";

	}

}
