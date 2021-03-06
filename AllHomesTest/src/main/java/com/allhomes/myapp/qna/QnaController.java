package com.allhomes.myapp.qna;

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

@Controller
public class QnaController {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/qnaMain")
	public ModelAndView qnaMain(QnaPagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);
		
		//Paging//
		int total = dao.countQnaTotal(); //총 질문게시판 게시글 수 
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if (cntPerPage == null) {
			cntPerPage = "6";
		}
		
		vo = new QnaPagingVO (total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//paging//

		ModelAndView mav = new ModelAndView();
		
		List<QnaVO> list = dao.qnaAllList(vo);
		
		
		mav.addObject("list", list);
		mav.addObject("paging", vo);
		mav.setViewName("/qna/qnaMain");
		
		
		return mav;
	}
	
	@RequestMapping("/qnaWrite")
	public ModelAndView qnaWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/qna/qnaWrite");
		return mav;
	}
	
	@RequestMapping(value="/qnaWriteOk", method=RequestMethod.POST)
	public ModelAndView qnaWriteOk(QnaVO vo, HttpServletRequest req, HttpSession ses) {
		vo.setUserid((String)ses.getAttribute("userid"));
		
		// 썸네일찾기 ====================
		String hbContent = vo.getContent();

		int idx = hbContent.indexOf("/qnaboardImg/");
		int jpg1 = hbContent.indexOf("JPG");
		int jpg2 = hbContent.indexOf("jpg");
		int gif = hbContent.indexOf("gif");
		int png = hbContent.indexOf("png");

			try {
				if (jpg1 > -1) {
					String thumbnailUrl = hbContent.substring(idx+13, jpg1 + 3);
					vo.setThumbnail(thumbnailUrl); //썸네일
				}else if (jpg2 > -1) {
					String thumbnailUrl = hbContent.substring(idx+13, jpg2 + 3);
					vo.setThumbnail(thumbnailUrl); //썸네일
				}else if (gif > -1) {
					String thumbnailUrl = hbContent.substring(idx+13, gif+3);
					vo.setThumbnail(thumbnailUrl); //썸네일
				}else if (png > -1) {
					String thumbnailUrl = hbContent.substring(idx+13, png+3);
					vo.setThumbnail(thumbnailUrl); // 썸네일
				}else { //사진없는 글일때 준비된 파일 넣어주기
					vo.setThumbnail("");
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
				
			//글 입력 성공하면 바로 해당 글View로 이동 
			int q_no = 0;
				
			QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);
			int result = dao.qnaInsert(vo);
				
			ModelAndView mav = new ModelAndView();
			mav.addObject("vo", vo);
				
			if(result>0) {
				q_no = dao.getQnaNumber();
				vo.setQ_no(q_no);
					
				mav.addObject("q_no", q_no);
				mav.setViewName("redirect:/qnaView");
			}else {
				mav.setViewName("qna/result");
			}
				return mav;
	}
	
	
	@RequestMapping("/qnaView")
	public ModelAndView qnaView(int q_no, HttpSession ses) {
		
		System.out.println("질문 글 보기로 이동하는지 확인");
		QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);
		String loginId = (String)ses.getAttribute("userid");
		String writer = dao.getQnaWriter(q_no);
		int answerNum = dao.getAnswerNum(q_no);

		ModelAndView mav = new ModelAndView();

		//글쓴 본인이 아니거나 로그인하지 않았으면 조회수 증가
		if(loginId == null || !loginId.equals(writer)) {
			dao.qnaHit(q_no);
		}
		
		QnaVO vo = dao.qnaSelect(q_no);
		
		mav.addObject("vo", vo);
		mav.addObject("loginId", loginId);
		mav.addObject("writer", writer);
		mav.addObject("answerNum", answerNum);
		mav.setViewName("/qna/qnaView");
		
		return mav;
	}
	
	@RequestMapping("/qnaEdit")
	public ModelAndView qnaEdit(@RequestParam("q_no") int q_no) {
		QnaDaoImp qnaDao = sqlSession.getMapper(QnaDaoImp.class);
		QnaVO qnaVo = qnaDao.qnaSelect(q_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaVo", qnaVo);
		mav.setViewName("qna/qnaEdit");
		
		return mav;
	}
	
	@RequestMapping(value="/qnaEditOk", method=RequestMethod.POST)
	public ModelAndView qnaEditOk(QnaVO vo, HttpSession ses) {
		
		QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);
		
		int result = dao.qnaEdit(vo);
		int q_no = vo.getQ_no();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("q_no", q_no);
		
		if(result>0) {
			mav.setViewName("redirect:/qnaView");
		}else {
			mav.setViewName("/qna/result");
		}
		return mav;
	}
	
	@RequestMapping("/qnaDelete")
	public ModelAndView qnaDelete(@RequestParam("q_no") int q_no) {
		QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);
		
		int result = dao.qnaDelete(q_no);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:/qnaMain");
		}else {
			mav.setViewName("/qna/result");
		}
		return mav;
	}
	
	@RequestMapping("/qnaReplyLogin")
	public String replyLoginPage(@RequestParam("q_no") int q_no) {
		
		return "redirect:qnaView?q_no="+q_no;
	}

}
