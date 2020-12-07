package com.allhomes.myapp.register;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
		
	//이메일 인증
	@RequestMapping("/regConf")
	public ModelAndView regConf(RegisterVO vo) {
		
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
				
		int resultVO = dao.regFinal(vo);
		
		
		ModelAndView md = new ModelAndView();
	
		
		if(resultVO>0) {
			md.setViewName("landing/loginForm");
		}
				
		return md;
	}
	
	
	
	@RequestMapping("/login")	//로그인 이동
	public String login() {
		return "landing/loginForm";
	}
	
	
	//로그인 
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk(RegisterVO vo, HttpSession ses) {
		
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);		
		
		RegisterVO resultVO = dao.login(vo);
		ModelAndView mav = new ModelAndView();
		
		
		if(resultVO == null){
			
			ses.setAttribute("logStatus","N");
			mav.setViewName("landing/loginResult");
			
			
		}else {
			ses.setAttribute("userid", resultVO.getUserid());
			ses.setAttribute("username", resultVO.getUsername());
			System.out.println(resultVO.getUsername());
			ses.setAttribute("nickname", resultVO.getNickname());
			System.out.println(resultVO.getNickname());
			ses.setAttribute("logStatus", "Y");
			
			ses.setAttribute("regcode", resultVO.getRegcode());
			
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
	public ModelAndView registerOkPage(String userid,RegisterVO vo,HttpSession session,String[] profileSet,	@RequestParam("photoBtn") MultipartFile photoBtn,String m_pic,HttpServletRequest req) {
			
	
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
			
		ModelAndView mav = new ModelAndView();
					
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
						 + "		<a href=\"http://localhost:9090/myapp/regConf\"><u>회원가입 완료 링크</u></a><br/><br/>\r\n"
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
			
		
		
		///////////////////이미지 업로드 //////////////////////////// 방법2 => 이미지 파일만 올라가도록 만들기
		
		String path = session.getServletContext().getRealPath("/")+"resources\\upload\\register";
		
		String fileNames = "";
				
			String fName = photoBtn.getOriginalFilename();
			
			if(fName!=null && !fName.equals("")) {
				//앞쪽 이름구하기
				String originFileName = fName.substring(0,fName.lastIndexOf("."));
				//확장자구하기
				String originLast = fName.substring(fName.lastIndexOf(".")+1);
				
				//파일 이름바꾸기
				File f=new File(path,fName);
				if(f.exists()) {		//기존에 동일한게 올라가 있다면 실행시키는 영역
					for(int renameNum=1;;renameNum++) {
						String renameFile = originFileName+renameNum+"."+originLast;	//변경된파일명
						f = new File(path,renameFile);
						
						//파일이 위치에 있나없나 확인
						if(!f.exists()) {
							fName = renameFile;
							break;
							
						}
					}
				}
				
				fileNames = fName;
								
				try {
					if(originLast.equals("gif") || originLast.equals("jpeg") || originLast.equals("png") ||  originLast.equals("jfif")) {
						photoBtn.transferTo(f);	//확장자명이 맞을때만 업로드
					
					
						vo.setM_pic(fileNames);
					
						int resultVO = dao.registerMember(vo);
						
						if(resultVO<=0) {
							if(fileNames!=null) {
								File ff = new File(path,fileNames);
									ff.delete();
										
								}
							}
					
						mav.setViewName("landing/registerOkPage");
						session.setAttribute("resultVO",resultVO);	
					
					}else {
						//아닐때 경고문구 날려주기
						mav.setViewName("landing/registerUnSuitImg");				
					}
								
				}catch(Exception e) {e.printStackTrace();}
									 
				
			}
			
		/*
		////////////////////////////이미지 업로드////////////////////////	방법1
				
		String path = session.getServletContext().getRealPath("/")+"resources\\upload\\register";
		System.out.println("path="+path);
		
		
		String originFileName = photoBtn.getOriginalFilename();	//업로드 파일
		String basicFileName = "test.png";	//기본 이미지
		
		try {
			if(originFileName != null) {
				photoBtn.transferTo(new File(path,originFileName));	//업로드 파일
				vo.setM_pic(originFileName);
			}else{
				photoBtn.transferTo(new File(path,basicFileName));	//기본이미지 세팅중
				vo.setM_pic(basicFileName);
			}
			
		}catch(IOException e) {
			e.printStackTrace();
		}
			
		System.out.println("에러잡기1");	
		
		
		int resultVO = dao.registerMember(vo);	
		System.out.println("에러잡기2");
		
		if(resultVO<0){
			if(originFileName != null) {
				File f = new File(path, originFileName);
				f.delete();
			}
					
		}*/
		
		return mav;
	
	}		
	
	//아이디 중복검사(버튼을 클릭할때 검사)
	@RequestMapping(value="/dupFilter")	
	@ResponseBody	
	public String dupFilter(String userid) {	
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
			
		return  dao.dupFilter(userid);
	}
	
}

