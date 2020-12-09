package com.allhomes.myapp.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public ModelAndView qnaMain() {
		QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);
		List<QnaVO> list = dao.qnaAllList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
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
						vo.setThumbnail("/resources/img/allhomes3.png");
					}
				} catch (Exception e) {
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

		ModelAndView mav = new ModelAndView();

		//--> 조회수 증가 넣을 곳 
		
		if(loginId == null || !loginId.equals(writer)) {
			dao.qnaHit(q_no);
		}
		
		QnaVO vo = dao.qnaSelect(q_no);
		
		mav.addObject("vo", vo);
		mav.addObject("loginId", loginId);
		
		mav.setViewName("/qna/qnaView");
		
		return mav;
	}
}
