package com.allhomes.myapp.register;

import java.io.File;
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
	
	
	//이메일 인증
	@RequestMapping("/regConf")
	public ModelAndView regConf(RegisterVO vo,String userid,HttpServletRequest req) {//폼에서 보내준거나 마찬가지니깐 request로 불러보자 
		
		System.out.println(userid);
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		
		
		
		vo.setUserid(userid);//가입할때 아이디
		
		int resultVO = dao.regFinal(vo);
		System.out.println(userid);
		
		ModelAndView md = new ModelAndView();
	
		
		if(resultVO>0) {
			md.setViewName("landing/loginForm");
		}
		
		return md;
	}
	
	
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession ses) {
		
		ModelAndView mav = new ModelAndView();
		ses.invalidate();
		mav.setViewName("redirect:/");
		
		return mav;
		
	}
	
	@RequestMapping("/login")	//로그인 이동
	public String login() {
			
		return "landing/loginForm";
	}
	
	
	//로그인 
	@RequestMapping(value="/loginOk", method=RequestMethod.POST,produces="application/text;charset=UTF-8")
	public ModelAndView loginOk(RegisterVO vo, HttpSession ses) {
		
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);		
		
		RegisterVO resultVO = dao.login(vo);
		ModelAndView mav = new ModelAndView();
		
		if(resultVO == null){
			ses.setAttribute("logStatus","N");
			mav.setViewName("landing/loginResult");			
		
		}else {
			ses.setAttribute("logStatus", "Y");
			ses.setAttribute("userid", resultVO.getUserid());
			ses.setAttribute("username", resultVO.getUsername());
			ses.setAttribute("nickname", resultVO.getNickname());
			ses.setAttribute("email", resultVO.getEmail());
			ses.setAttribute("m_pic", resultVO.getM_pic());
			ses.setAttribute("m_no", resultVO.getM_no());
			ses.setAttribute("regcode", resultVO.getRegcode());
			ses.setAttribute("tel", resultVO.getTel());
			
     	System.out.println("프로필사진주소 =" +resultVO.getM_pic());
                       
			System.out.println(resultVO.getNickname());
			
			Object dest = ses.getAttribute("dest");
			if(dest==null) {
				mav.setViewName("redirect:/");
			}else {
				mav.setViewName("redirect:/"+dest.toString());
			}
			
		}
		System.out.println("로그인상태= "+ses.getAttribute("logStatus")); 
		
		return mav;
	}
	
	
	
	//회원가입페이지 이동 매핑
	@RequestMapping(value="/register")
	public String register(HttpSession session) {
		session.setAttribute("m_pic","basicprofile.png");
		return "landing/registerForm";
	}
	
	
		
	//회원가입
	@RequestMapping(value="/registerOk")
	public ModelAndView registerOkPage(String userid,RegisterVO vo,HttpSession session,String[] profileSet,	@RequestParam("photoBtn") MultipartFile photoBtn,String m_pic,HttpServletRequest req) {
			
	
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
			
		ModelAndView mav = new ModelAndView();
		vo.setUserid(userid);			
		UUID random = UUID.randomUUID();
		String uuid = random.toString();
		String subject = "[Allhomes]회원가입을 환영합니다!!";
		String content = "<!DOCTYPE html>\r\n" + 
				"<html>\r\n" + 
				"<head>"+
				"<style>"
				+ "@font-face{\r\n" + 
				"   font-family:\"SCDream3\";\r\n" + 
				"   src:url(\"/myapp/resources/css/font/SCDream3.otf\") format(\"truetype\");\r\n" + 
				"   font-style:normal;\r\n" + 
				"   font-weight:normal;\r\n" + 
				"}"
				+"#test{font-family:'SCDream3'}"
				+"</style>"
				+"</head>"
				+"<body>"
				+ "<div style='background:lightgray;border:1px solid;"
						 + "border-radius:5px 5px 5px 5px;margin:30px;padding:30px;width:80%'>"
						 + "<img src='\"<%=request.getContextPath()%>/resources/img/allhomes3.png'/>"
						 + "<p id='test'>\r\n"
						 + "  		안녕하세요?<br/><br/>\r\n"
						 + "  		"+userid+"님, 안녕하세요.<br/>\r\n"
						 + "  		Allhomes가입을 진심으로 환영합니다!!<br/>\r\n"
						 + "		아래 링크를 누르시면 회원가입이 완료되며 로그인 페이지로 이동합니다.<br/>\r\n"
						 + "		<a href=\"http://localhost:9090/myapp/regConf?userid="+userid+"\"><u>회원가입 완료 링크</u></a><br/><br/>\r\n"
						 + "  		회원가입 중 불편하셨던 점은 info@allhomes.co.kr로 메일 부탁드립니다!\r\n\n<br/>"
						 + "		감사합니다."		
						 + "  		</p>"
						 + "</div>"
						 +"</body>"
				+"</html>";
		
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
									 
				
			}else {	//파일이름이 없거나 공백이면
				fileNames = "basicprofile.png";
				vo.setM_pic(fileNames);

				int resultVO = dao.registerMember(vo);
				
				mav.setViewName("landing/registerOkPage");
				session.setAttribute("resultVO",resultVO);		
						
			}
		
		return mav;
	
	}		
	
	//아이디 중복검사(버튼을 클릭할때 검사)
	@RequestMapping(value="/dupFilter")	
	@ResponseBody	
	public String dupFilter(String userid) {	
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
			
		return  dao.dupFilter(userid);
	}
	
	
	
	//닉네임 중복검사
		@RequestMapping(value="/nicknameCheck",produces="application/text;charset=UTF-8")
		@ResponseBody
		public String nicknameCheck(String nickname,RegisterVO vo) {

			RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
			System.out.println("test0");
			String resultVO = dao.nicknameCheck(nickname);

			return resultVO;
		}
	
	
	//이메일 중복검사
	@RequestMapping(value="/mailFilter")
	@ResponseBody
	public String mailFilter(RegisterVO vo,String email1,String email2,String email,HttpSession session) {
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);

		
		String resultVO="";
		if(email==null) {//회원가입으로 들어올때
			vo.setEmail1(email1);
			vo.setEmail2(email2);
			resultVO = dao.mailFilter(vo);


		}else {			 //회원정보 수정으로 들어올때
			String emailset[]=email.split("@");
			vo.setEmail1(emailset[0]);
			vo.setEmail2(emailset[1]);	//vo에는 정보수정에서 넣은 주소가 담겨있음

			String exiMail = (String)session.getAttribute("email");	//기존에 DB 있는메일
			resultVO = dao.mailFilter(vo); //중복검사 뭐가됐든 겹치면
				if(resultVO!=null) {		
					if(vo.getEmail().equals(exiMail)){//기존 메일과 같은지 비교해주기
						//기존메일과 같다면 통과시켜주기
						resultVO="";
					}else {
						//기존메일과 다른거라면 false
					}
				}
			}
		
		
		
		return resultVO;
	}	
}

