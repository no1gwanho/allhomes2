package com.allhomes.myapp.review;

import java.io.File;
import java.util.List;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Autowired 
	SqlSession sqlSession;
	
	@RequestMapping(value="/reviewWriteOk", method=RequestMethod.POST)
	public ModelAndView reviewWriteOk(ReviewVO vo, 
									@RequestParam("img") MultipartFile mf, 
									@RequestParam("pd_no") int pd_no,
									@RequestParam("s_no") int s_no,
									@RequestParam("content") String content,
									@RequestParam("rating") Double rating,
									@RequestParam("writedate") String writedate,
									HttpServletRequest r) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession ses = r.getSession();
		
		String userid = (String)ses.getAttribute("userid");
		String path = ses.getServletContext().getRealPath("/") + "resources\\upload\\reviewImg\\";	// 파일 저장 위치

		// 폼의 파일 첨부 객체 변수
		String imgParamName = mf.getName();
		// 원래 파일명 구하기
		String oriImgName = mf.getOriginalFilename();
		
		vo.setImg(oriImgName);
		vo.setUserid(userid);
		vo.setPd_no(pd_no);
		vo.setContent(content);
		vo.setRating(rating);
		vo.setWritedate(writedate);
		
		//=================================
		try {
			if(oriImgName!=null) {
				mf.transferTo(new File(path, oriImgName));  // 실제로 파일 업로드 되는 경우
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		ReviewDaoImp dao = sqlSession.getMapper(ReviewDaoImp.class);
		int result = dao.insertReview(vo);
		
		System.out.println("result값 얼마야????????????????? " + result);
		
		return mav;
	}
	
	@RequestMapping("/reviewHitAdd")
	public String reviewHitAdd(@RequestParam("r_no") int r_no, @RequestParam("pd_no") int pd_no) {

		ReviewDaoImp dao = sqlSession.getMapper(ReviewDaoImp.class);
		int result = dao.reviewHitAdd(r_no);
		
		System.out.println(result);
		return "redirect:storeDetail?pd_no="+pd_no;
	}
	
	@RequestMapping("/reviewBest")
	public ModelAndView reviewBest(@RequestParam("pd_no") int pd_no) {
		ModelAndView mv = new ModelAndView();
		ReviewDaoImp dao = sqlSession.getMapper(ReviewDaoImp.class);

		return mv;
	}
}
