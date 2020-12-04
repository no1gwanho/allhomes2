package com.allhomes.myapp.register;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterController {
	
	SqlSession sqlSession;

	@Inject
	JavaMailSenderImpl mailSender;
	
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/login")
	public String login() {
		return "landing/loginForm";
	}
	
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk(RegisterVO vo, HttpSession ses) {
		
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		
		
		RegisterVO resultVO = dao.login(vo);
		ModelAndView mav = new ModelAndView();
		//濡쒓렇�씤�뿬遺� : resultVO媛� null�씠硫� �떎�뙣
		
		if(resultVO == null){
			mav.setViewName("redirect:login");
		}else {
			ses.setAttribute("userid", resultVO.getUserid());
			ses.setAttribute("username", resultVO.getUsername());
			ses.setAttribute("logStatus", "Y");
			mav.setViewName("landing/loginResult");
		}
		return mav;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession ses) {
		ses.invalidate();
		return "home";
		
	}
	
	
	
	
	
	//회원가입페이지 이동 매핑
	@RequestMapping(value="/register")
	public String register() {
		return "landing/registerForm";
	}
	
	
		
	//회원가입
	@RequestMapping(value="/registerOk")
	public ModelAndView registerOkPage(String userid,RegisterVO vo,HttpSession session,String[] profileSet) {
		
	
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		
		int resultVO = dao.registerMember(vo);	//프로필이미지 DB작업 한번에 처리해주자
		
		ModelAndView mav = new ModelAndView();
			
		
		
		/*
		String path = profileSet[0];
		String originFileName = profileSet[1];
		
		//파일 업로드
		try {
			mf.transferTo(new File(path, originFileName));
		
		} catch(IOException ie) {
			ie.getStackTrace();
		}
				
		//db 변동사항없으면 파일 지우기
		if(resultVO<=0) {
			File proImg = new File(path, originFileName);
			proImg.delete();
		}
		*/			
			
		UUID random = UUID.randomUUID();
		String uuid = random.toString();
		String subject = "[Allhomes]회원가입을 환영합니다!!";
		String content = "<div style='background:lightgray;border:1px solid gray;"
						 + "border-radius:5px 5px 5px 5px;margin:30px;padding:30px;width:80%'>"
						 
						 + "<p>\r\n"
						 + "  		안녕하세요?<br/><br/>\r\n"
						 + "  		"+userid+"님, 안녕하세요.<br/>\r\n"
						 + "  		Allhomes가입을 진심으로 환영합니다!!<br/>\r\n"
						 + "		아래 링크를 누르시면 회원가입이 완료되며 로그인 페이지로 이동합니다.<br/>\r\n"
						 + "		<a href=\"http://localhost:9090/myapp/login\"><u>회원가입 완료 링크</u></a><br/><br/>\r\n"
						 + "  		회원가입 중 불편하셨던 점은 info@allhomes.co.kr로 메일 부탁드립니다!\r\n\n<br/>"
						 + "		감사합니다."		
						 + "  		</p>"
						 + "</div>";
		
		try {
			MimeMessage message= mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("parkghgame@naver.com");
			messageHelper.setTo(vo.getEmail());  
			messageHelper.setSubject(subject);	
			messageHelper.setText("text/html;charset=UTF-8",content);
			mailSender.send(message);
			session.setAttribute("emailUUID",uuid);
				
		}catch(Exception e) {
			
			System.out.println(e.getMessage());
		}
			
		mav.setViewName("landing/registerOkPage");
		session.setAttribute("resultVO",resultVO);
		
		return mav;
	}
	
	
	
		
	//프로필 사진 저장
	@RequestMapping(value="/photoBtn",method=RequestMethod.POST)
	@ResponseBody
	public String photoBtn(@RequestParam("photoBtn") MultipartFile photoBtn ,HttpServletRequest req,String m_pic,HttpSession ses,@RequestParam(value="photoBtn") MultipartFile mf) {
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		
		RegisterVO vo = new RegisterVO();
				
		String path = ses.getServletContext().getRealPath("/resources/img/register");
		String fileName = photoBtn.getName();
		String oriFileName = photoBtn.getOriginalFilename();
		
		try {
			if(oriFileName != null) {
				photoBtn.transferTo(new File(path,oriFileName));
			}
			
		}catch(IOException ie) {
			ie.printStackTrace();
		}
		
		vo.setM_pic(oriFileName);
			
		
		//db 작업 실행
		int result = dao.photoBtn(oriFileName);
		
		if(result>0) {//db에 넣기 성공했을때
			
		}else{//db넣기 실패했을때 파일 삭제
			if(oriFileName != null) {
				File f = new File(path,oriFileName);
				f.delete();
			}
		}
			
		
		return "";
	}		
	
		
	
	//아이디 중복검사(버튼을 클릭할대 검사)
	@RequestMapping(value="/dupFilter")	
	@ResponseBody	
	public String dupFilter(String userid) {	
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
			
		return  dao.dupFilter(userid);
	}
	
	
	
	//아이디 중복검사 의무화(커서 박스밖으로 나갈때 검사)
	@RequestMapping(value="/mustCheck")
	@ResponseBody
	public Boolean mustCheck(String userid,RegisterVO vo) {
		//RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		
		boolean checker = false;
		if(userid==vo.getUserid()){
			checker = true;
		}else {
			checker = false;
		}
		return checker;	
		
	}
	
	
	
	
	
}

