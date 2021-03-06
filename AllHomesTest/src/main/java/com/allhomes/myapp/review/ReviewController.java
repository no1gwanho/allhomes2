package com.allhomes.myapp.review;

import java.io.File;
import java.util.ArrayList;
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

import com.allhomes.myapp.order.OrderDaoImp;
import com.allhomes.myapp.purchase.PurchaseDaoImp;
import com.allhomes.myapp.purchase.PurchaseJoinVO;
import com.allhomes.myapp.purchase.PurchaseVO;
import com.allhomes.myapp.register.RegisterVO;

@Controller
public class ReviewController {
	@Autowired 
	SqlSession sqlSession;
	
	@RequestMapping(value="/reviewWrite", method=RequestMethod.POST)
	public ModelAndView reviewWriteForm(HttpServletRequest req, @RequestParam("pc_no") int pc_no) {
		ModelAndView mv = new ModelAndView();
		HttpSession ses = req.getSession();		
		ReviewDaoImp dao = sqlSession.getMapper(ReviewDaoImp.class);
		
		String userid = (String)ses.getAttribute("userid");
		
		PurchaseJoinVO pvo = new PurchaseJoinVO();
		pvo.setUserid(userid);
		pvo.setPc_no(pc_no);
	
		ReviewJoinVO rvo = dao.productInfo(pvo);
		
		
		mv.addObject("rvo", rvo);
		mv.setViewName("review/reviewForm");
		
		return mv;
	}
	
	@RequestMapping(value="/reviewWriteOk", method=RequestMethod.POST)
	public ModelAndView reviewWriteOk(@RequestParam("img") MultipartFile mf, @RequestParam("pd_no") int pd_no,	@RequestParam("s_no") int s_no,
									@RequestParam("content") String content, @RequestParam("rating") int rating, @RequestParam("pc_no") int pc_no,
									HttpServletRequest r) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession ses = r.getSession();
		
		String userid = (String)ses.getAttribute("userid");
		String path = ses.getServletContext().getRealPath("/") + "resources\\upload\\reviewImg\\";	// 파일 저장 위치
		
		// 폼의 파일 첨부 객체 변수
		String imgParamName = mf.getName();
		// 원래 파일명 구하기
		String oriImgName = mf.getOriginalFilename();
		
		ReviewVO vo = new ReviewVO();
		
		vo.setImg(oriImgName);
		vo.setUserid(userid);
		vo.setPd_no(pd_no);
		vo.setS_no(s_no);
		vo.setContent(content);
		vo.setRating(rating);
		
		//=================================
		try {
			if(oriImgName!=null) {
				mf.transferTo(new File(path, oriImgName));  // 실제로 파일 업로드 되는 경우
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		ReviewDaoImp dao = sqlSession.getMapper(ReviewDaoImp.class);
		PurchaseDaoImp pDao = sqlSession.getMapper(PurchaseDaoImp.class);
		
		PurchaseJoinVO pvo = new PurchaseJoinVO();
		pvo.setUserid(userid);
		pvo.setPc_no(pc_no);
		
		int result = dao.insertReview(vo);
		int pResult = pDao.reviewStatusUpdate(pvo);
		
		System.out.println("result값 얼마야????????????????? " + result);
		
		
		mav.addObject("reviewWrite", result);
		mav.setViewName("landing/resultCheck");
		
		return mav;
	}
	
	@RequestMapping(value="/reviewEdit", method=RequestMethod.POST)
	public ModelAndView reviewEdit(HttpServletRequest req, @RequestParam("pd_no") int pd_no, @RequestParam("r_no") int r_no, 
								@RequestParam("content") String content, @RequestParam("pd_name") String pd_name) {
		
		ModelAndView mv = new ModelAndView();
		HttpSession ses = req.getSession();		
		ReviewDaoImp dao = sqlSession.getMapper(ReviewDaoImp.class);
		
		String userid = (String)ses.getAttribute("userid");
		
		ReviewVO rvo = new ReviewVO();
		rvo.setUserid(userid);
		rvo.setPd_no(pd_no);
		rvo.setR_no(r_no);
		rvo.setContent(content);
				
		ReviewVO vo = dao.reviewInfo(rvo);
				
		mv.addObject("vo", vo);
		mv.addObject("pd_name", pd_name);
		mv.setViewName("review/reviewEditForm");
		
		return mv;
	}
	
	@RequestMapping(value="/reviewEditOk", method=RequestMethod.POST)
	public ModelAndView reviewEditOk(HttpServletRequest r, @RequestParam("pd_no") int pd_no, 
									@RequestParam("r_no") int r_no, @RequestParam("content") String content,
									@RequestParam("rating") int rating, @RequestParam("img") MultipartFile mf) {
		
		ModelAndView mv = new ModelAndView();
		
		HttpSession ses = r.getSession();
		String userid = (String)ses.getAttribute("userid");
		String path = ses.getServletContext().getRealPath("/") + "resources\\upload\\reviewImg\\";	// 파일 저장 위치
		
		String imgParamName = mf.getName();							// 폼의 파일 첨부 객체 변수

		String oriImgName = mf.getOriginalFilename();			// 원래 파일명 구하기
		
		ReviewVO vo = new ReviewVO();
		
		vo.setUserid(userid);
		vo.setPd_no(pd_no);
		vo.setImg(oriImgName);
		vo.setContent(content);
		vo.setRating(rating);				
		vo.setR_no(r_no);
		
		//=================================
		try {
			if(oriImgName!=null) {
				mf.transferTo(new File(path, oriImgName));  // 실제로 파일 업로드 되는 경우
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		ReviewDaoImp dao = sqlSession.getMapper(ReviewDaoImp.class);
		int result = dao.editReview(vo);
		
		mv.addObject("pd_no", pd_no);
		mv.addObject("reviewEdit", result);
		mv.setViewName("landing/resultCheck");
		
		System.out.println("result 값은 얼마야????????" + result);
		
		return mv;
	}
	
	@RequestMapping("/reviewDel")
	public ModelAndView reviewDel(@RequestParam("r_no") int r_no, @RequestParam("pd_no") int pd_no, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("userid");
		
		ReviewVO vo = new ReviewVO();
		vo.setUserid(userid);
		vo.setR_no(r_no);
		vo.setPd_no(pd_no);
		
		ReviewDaoImp dao = sqlSession.getMapper(ReviewDaoImp.class);
		int result = dao.delReview(vo);
		
		mv.addObject("reviewDel", result);
		mv.addObject("pd_no", pd_no);
		mv.setViewName("landing/resultCheck");
		
		return mv;
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
