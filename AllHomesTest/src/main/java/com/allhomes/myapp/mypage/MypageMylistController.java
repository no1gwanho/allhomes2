package com.allhomes.myapp.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.homeboard.HomeboardDaoImp;
import com.allhomes.myapp.homeboard.HomeboardVO;
import com.allhomes.myapp.qna.QnaDaoImp;
import com.allhomes.myapp.qna.QnaVO;

@Controller
public class MypageMylistController {
	
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/mypageMylist")
	public ModelAndView mypageMyList(@RequestParam("order") String order, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession ses = request.getSession();
		String userid = (String)ses.getAttribute("userid");
		System.out.println("내가쓴글 유저아이디: "+userid);
		
		if(order.equals("homeboard")) {
			HomeboardDaoImp hbDao = sqlSession.getMapper(HomeboardDaoImp.class);
			List<HomeboardVO> hbList = hbDao.myHomeboardList(userid);
			mav.addObject("hbList", hbList);
			
		}else if(order.equals("qnaboard"))	{
			QnaDaoImp qnaDao = sqlSession.getMapper(QnaDaoImp.class);
			List<QnaVO> qnaList = qnaDao.myQnaList(userid);
			mav.addObject("qnaList", qnaList);
			
		}
		
		mav.addObject("order", order);
		
		mav.setViewName("/mypage/mypageMylist");
		
		
		
		
		
		return mav;
	}
	

}
