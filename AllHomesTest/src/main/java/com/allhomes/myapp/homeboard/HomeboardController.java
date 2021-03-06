package com.allhomes.myapp.homeboard;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.admin.HomeBoardThemeDaoImp;
import com.allhomes.myapp.admin.HomeBoardThemeVO;
import com.allhomes.myapp.scrap.ScrapDaoImp;
import com.allhomes.myapp.scrap.ScrapVO;


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

	
	//집들이 메인
	@RequestMapping("/homeboardHome")
	public ModelAndView homeboardHome() {
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		List<HomeboardVO> list = dao.homeboardAllList(); //집들이 전체 리스트 
		
		String hashtagList = dao.hashtagList();
		System.out.println("해시태그리스트: "+hashtagList);
		
		
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("hashtagList", hashtagList);
		mav.setViewName("/homeboard/homeboardHome");

		return mav;
	}
	
	//집들이 - 베스트 
	@RequestMapping("/homeboardTop")
	public ModelAndView homeboardTop(@RequestParam("order") String order) {
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		List<HomeboardVO> bestList = dao.homeboardBestList(order);
		
		mav.addObject("bestList", bestList);
		mav.addObject("order", order);
		mav.setViewName("/homeboard/homeboardTop");
	
		return mav;
	}

	
	//집들이 테마
	@RequestMapping("/homeboardTheme")
	public ModelAndView homeboardTheme(@RequestParam("hb_theme_no") int hb_theme_no) {
		
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		List<HomeboardVO> themeList = dao.homeboardThemeList(hb_theme_no);
		
		mav.addObject("themeList", themeList);
		mav.addObject("hb_theme_no", hb_theme_no);
		mav.setViewName("/homeboard/homeboardTheme");
		
		return mav;
	}
	
	
	//집들이 글쓰기 페이지로 이동
		@RequestMapping("/homeboardWrite")
		public ModelAndView homeboardWrite() {
			HomeBoardThemeDaoImp themeDao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
			List<HomeBoardThemeVO> themeList = themeDao.HomeBoardThemeAll(); // 테마 리스트 불러오기

			ModelAndView mav = new ModelAndView();
			mav.addObject("themeList", themeList);
			mav.setViewName("/homeboard/homeboardWrite");
		

			return mav;
		}

		//집들이 글쓰기 완료	
		@RequestMapping(value = "/homeboardWriteOk", method = RequestMethod.POST)
		public ModelAndView homeboardWriteOk(HomeboardVO vo, HttpServletRequest r, HttpSession s) {
			vo.setIp(r.getRemoteAddr());
			vo.setUserid((String)s.getAttribute("userid"));
			vo.setNickname((String)s.getAttribute("nickname"));


			// 썸네일찾기 ====================
			String hbContent = vo.getContent();

			int idx = hbContent.indexOf("/homeboardImg/");
			int jpg1 = hbContent.indexOf("JPG");
			int jpg2 = hbContent.indexOf("jpg");
			int gif = hbContent.indexOf("gif");
			int png = hbContent.indexOf("png");
			System.out.println(jpg1 + ", " + jpg2 + ", " + gif + ", " + png);
			

			try {
				if (jpg1 > -1) {
					String thumbnailUrl = hbContent.substring(idx+14, jpg1 + 3);
					System.out.println("글수정할때 썸네일 jpg:"+ thumbnailUrl);
					vo.setThumbnail(thumbnailUrl); //썸네일
				}else if (jpg2 > -1) {
					String thumbnailUrl = hbContent.substring(idx+14, jpg2 + 3);
					System.out.println("글수정할때 썸네일 JPG:"+thumbnailUrl);
					vo.setThumbnail(thumbnailUrl); //썸네일
				}else if (gif > -1) {
					String thumbnailUrl = hbContent.substring(idx+14, gif+3);
					System.out.println("글수정할때 썸네일 gif:"+thumbnailUrl);
					vo.setThumbnail(thumbnailUrl); //썸네일
				}else if (png > -1) {
					String thumbnailUrl = hbContent.substring(idx+14, png+3);
					System.out.println("글수정할때 썸네일 png:"+thumbnailUrl);
					vo.setThumbnail(thumbnailUrl); // 썸네일
				}else { //사진없는 글일때 준비된 파일 넣어주기
					vo.setThumbnail("allhomes3.png");
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
		
	
	//글쓰기 수정페이지로 이동
	@RequestMapping("/homeboardEdit")
	public ModelAndView homeboardEdit(@RequestParam("b_no") int b_no) {
		HomeBoardThemeDaoImp themeDao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		List<HomeBoardThemeVO> themeList = themeDao.HomeBoardThemeAll(); //테마 리스트 불러오기 
		
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		HomeboardVO vo = dao.homeboardEditSelect(b_no);
		
		int selectedHbThemeNo = dao.getOriginalTheme(b_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("themeList", themeList);
		mav.addObject("oriThemeNo", selectedHbThemeNo);// 수정전에 입력했던 테마번호
		mav.addObject("vo", vo);
		mav.setViewName("homeboard/homeboardEdit");
		
		return mav;
	}
	
	
	//글쓰기 수정 완료 
	@RequestMapping(value="/homeboardEditOk", method=RequestMethod.POST)
	public ModelAndView homeboardEditOk(HomeboardVO vo, HttpSession s) {
		
		
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		// 썸네일찾기 ====================
		String hbContent = vo.getContent();

		int idx = hbContent.indexOf("/homeboardImg/");
		System.out.println("썸네일 구할때 인덱스번호=" +idx);
		int jpg1 = hbContent.indexOf("JPG");
		int jpg2 = hbContent.indexOf("jpg");
		int gif = hbContent.indexOf("gif");
		int png = hbContent.indexOf("png");
		System.out.println(jpg1 + ", " + jpg2 + ", " + gif + ", " + png);		

		try {
			if (jpg1 > -1) {
				String thumbnailUrl = hbContent.substring(idx +14 , jpg1 + 3);
				System.out.println("수정할때: jpg일때주소" + thumbnailUrl);
				vo.setThumbnail(thumbnailUrl); //썸네일
			}else if (jpg2 > -1) {
				String thumbnailUrl = hbContent.substring(idx+14 , jpg2 + 3);
				System.out.println("수정할때: JPG일때주소"+thumbnailUrl);
				vo.setThumbnail(thumbnailUrl); //썸네일
			}else if (gif > -1) {
				String thumbnailUrl = hbContent.substring(idx+14, gif+3);
				System.out.println(thumbnailUrl);
				vo.setThumbnail("수정할때: GIF일때주소+"+thumbnailUrl); //썸네일
			}else if (png > -1) {
				String thumbnailUrl = hbContent.substring(idx+14, png+3);
				System.out.println("수정할때 png일때주소"+thumbnailUrl);
				vo.setThumbnail(thumbnailUrl); // 썸네일
			}else { //사진없는 글일때 준비된 파일 넣어주기
				vo.setThumbnail("allhomes3.png");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

		int result = dao.homeboardEdit(vo);	
		int b_no = vo.getB_no();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("b_no", b_no);
		

		if (result > 0) {
			mav.setViewName("redirect:/homeboardView");

		} else {
			mav.setViewName("/homeboard/result");
		}
		return mav;		
	}
	
	
	//집들이 삭제하기
	@RequestMapping("/homeboardDelete")
	public ModelAndView homeboardDelete(@RequestParam("b_no") int b_no) {
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		
		int result = dao.homeboardDelete(b_no);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:homeboardHome");
		}else {
			mav.setViewName("/homeboard/result");
		}
		return mav;
	}
	
	//집들이 글 보기
	@RequestMapping("/homeboardView")
	public ModelAndView homeboardView(int b_no, HttpServletRequest req, ScrapVO scrapVO) {

		
		HttpSession ses = req.getSession();
		ModelAndView mav = new ModelAndView();
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		
		String logStatus = (String)ses.getAttribute("logStatus");
		String loginNickname = (String)ses.getAttribute("nickname");
		String loginId = (String)ses.getAttribute("userid");
		String writer = dao.getHomeboardWriter(b_no);
		
		//로그인아이디와 글쓴이가 같지 않으면 조회수 1증가 
		if(loginId==null || !loginId.equals(writer)) {
			dao.homeboardHit(b_no); 
		}
	
		//Homeboard 글 가지고 오기 
		HomeboardVO vo = dao.homeboardSelect(b_no);
		

		// 해시태그 가져오기 
	
		if(vo.getHashtag()!=null) {
		String hashtag = vo.getHashtag(); 
			String hashtagStr[] = hashtag.split(",");
			List<String> hashtagList = new ArrayList<String>();
			hashtagList = Arrays.asList(hashtagStr);
			mav.addObject("hashtagList", hashtagList); //해시태그는 잘라서 뷰 페이지에 넘기기
		}
		
		//해당글을 스크랩했는지 여부 확인
		
		if (ses.getAttribute("m_no")!= null) {
			ScrapDaoImp scrapDao = sqlSession.getMapper(ScrapDaoImp.class);
			int m_no = (Integer)ses.getAttribute("m_no");
			scrapVO.setM_no(m_no);
			scrapVO.setB_no(b_no);
			ScrapVO scrapResultVO = scrapDao.scrapCheck(scrapVO);
			System.out.println("스크랩여부:"+ scrapResultVO);
			
			if(scrapResultVO == null) {
				mav.addObject("scrapCheck", "N");
			}else {
				mav.addObject("scrapCheck", "Y");
			}
			
		}

	

		mav.addObject("vo", vo);
		mav.addObject("logStatus", logStatus);
		mav.addObject("loginId", loginId);
		mav.addObject("loginNickname", loginNickname);
		mav.addObject("writer", writer);
		
		mav.setViewName("homeboard/homeboardView");

		return mav;
	}

	
	//집들이 글보기에서 로그인페이지로 이동할때 
	@RequestMapping("/replyLogin")
	public String replyLoginPage(@RequestParam("b_no") int b_no) {
		
		return "redirect:homeboardView?b_no="+b_no;
	}
	
}
