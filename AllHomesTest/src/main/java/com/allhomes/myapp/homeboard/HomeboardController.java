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
	public String homeboardHome() {
		return "/homeboard/homeboardHome";
	}
	
	@RequestMapping("/homeboardTop")
	public String homeboardTop() {
		return "/homeboard/homeboardTop";
	}
	
	@RequestMapping("/homeboardTheme")
	public String homeboardTheme() {
		return "/homeboard/homeboardTheme";
	}
	
	
	@RequestMapping("/homeboardWrite")
	public ModelAndView homeboardWrite() {
		HomeBoardThemeDaoImp themeDao = sqlSession.getMapper(HomeBoardThemeDaoImp.class);
		List<HomeBoardThemeVO> themeList = themeDao.HomeBoardThemeAll(); //�뀒留� 由ъ뒪�듃 遺덈윭�삤湲� 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("themeList", themeList);
		mav.setViewName("/homeboard/homeboardWrite");
		
		return mav;
	}

	@RequestMapping(value="/homeboardWriteOk", method = RequestMethod.POST)
	public ModelAndView homeboardWriteOk(HomeboardVO vo, HttpServletRequest r, HttpSession s) {
		vo.setIp(r.getRemoteAddr());
		vo.setUserid("hong1234"); //�엫�떆 �븘�씠�뵒
		vo.setNickname("湲몃룞�씠"); //�엫�떆 �땳�꽕�엫
		vo.setThumbnail("ThumnailTest"); //�엫�떆�뜽�꽕�씪
		vo.setTheme("모던");
		
		int b_no = 0;
		
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		int result = dao.homeboardInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		
		
		if(result>0) {
			b_no = dao.getHomeboardNumber(); //System.out.println(b_no); --> �쁽�옱 ���옣�맂 湲�踰덊샇媛� 紐뉗씤吏� �솗�씤 
			vo.setB_no(b_no);
			
			mav.addObject("b_no", b_no);
			mav.setViewName("redirect:/homeboardView");
			
		}else {
			mav.setViewName("/homeboard/result");
		}
		return mav;
	}

	
	@RequestMapping("/homeboardView")
	public ModelAndView homeboardView(int b_no) {
		
		HomeboardDaoImp dao = sqlSession.getMapper(HomeboardDaoImp.class);
		HomeboardVO vo = dao.homeboardSelect(b_no);
		
		//�빐�떆�깭洹� �쟾泥� 媛��졇���꽌 �옄瑜닿린
		ModelAndView mav = new ModelAndView();
		
		String hashtag = vo.getHashtag(); //System.out.println(hashtag);
		if(hashtag!=null) {
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
