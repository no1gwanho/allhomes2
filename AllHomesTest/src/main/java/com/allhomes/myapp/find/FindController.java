package com.allhomes.myapp.find;

import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FindController {

	@Inject
	JavaMailSenderImpl mailSender;
	
	SqlSession sqlSession;
		
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}

	
	
	//아이디 찾기
	@RequestMapping(value="/btnfindid",method=RequestMethod.GET,produces="application/text;charset=UTF-8")
	@ResponseBody
	public String ajaxFindId(FindVO vo){
				
		FindDaoImp dao = sqlSession.getMapper(FindDaoImp.class);
				
		FindVO resultVO = dao.findIdPwd(vo);
					
		String userid = "";	//아이디 찾기 기능에서 찾은 아이디를 찍어주기 위한 변수	
		if(resultVO==null) {
			userid="회원정보가 일치하지 않습니다.";
		
		}else{
			userid="등록하신 아이디는 "+(String)resultVO.getUserid()+"입니다.";
		}
			
		return userid;
	}
	
	
	
	
	//비밀번호 재설정
	@RequestMapping(value="/changebutton",method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String ajaxChangepwd(String userpwd,String userpwdChk, FindVO vo,HttpSession session){
				
		
		vo.setUsername((String)session.getAttribute("usernameCon"));
		vo.setUserid((String)session.getAttribute("useridCon"));
				
		FindDaoImp dao = sqlSession.getMapper(FindDaoImp.class);
				
		String notePwd = "";
						
			if(userpwd.equals(userpwdChk)){
				int resultVO = dao.changeInstert(vo);		
				
				if(resultVO != 0) {
					notePwd="새로운 비밀번호로 변경되었습니다.";
					
				}else{
					notePwd="비밀번호 변경 중 에러가 발생했습니다.";
				}
						
			}else{
				notePwd = "입력하신 비밀번호가 일치하지 않습니다.";
				
			}
		
		return notePwd;
		
		}
	
	

	
	
	//비밀번호 찾기
	@RequestMapping(value="/btnrepwd",method=RequestMethod.GET,produces="application/text;charset=UTF-8")
	@ResponseBody
	public String ajaxFindpwd(String username, String userid, String email,FindVO vo,HttpSession session){
								
		
		FindDaoImp dao = sqlSession.getMapper(FindDaoImp.class);
		
		FindVO resultVO = dao.findPwd(vo);
		
		String mailAddr = "";
		
		if(resultVO==null){
			mailAddr="회원 정보가 일치하지 않습니다.";
			
		}else {
			
			session.setAttribute("usernameCon", username);
			session.setAttribute("useridCon", userid);
			session.setAttribute("emailCon",email);
					
			
			UUID random = UUID.randomUUID();
			String uuid = random.toString();
			String subject = "[Allhomes]비밀번호 재설정 링크입니다.";
			String content = "<div style='background:lightgray;border:1px solid gray;"
							 + "border-radius:5px 5px 5px 5px;margin:30px;padding:30px;width:80%'>"
							 
							 + "<p>\r\n"
							 + "  		안녕하세요?<br/><br/>\r\n"
							 + "  		"+userid+"님, 안녕하세요.<br/>\r\n"
							 + "  		아래 링크를 누르시면 새로운 비밀번호로 변경이 가능합니다.<br/>\r\n"
							 + "  		<a href=\"http://localhost:9090/myapp/findConf\"><u>Go to the link</u></a><br/><br/>\r\n"
							 + "  		혹시 비밀번호 변경 신청을 하지 않으셨다면<br/>\r\n"
							 + "  		info@allhomes.co.kr로 메일 부탁드립니다!\r\n\n<br/>"
							 + "		상기 링크는 수신 시점으로부터 30분간 유효하오니 링크 접속이 불가하실땐 홈페이지로 재접속 후 링크를 다시 받으시기 바랍니다."		
							 + "  		</p>"
							 + "</div>";
			
			try {
				MimeMessage message= mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom("parkghgame@naver.com");
				messageHelper.setTo(resultVO.getEmail());  
				messageHelper.setSubject(subject);	
				messageHelper.setText("text/html;charset=UTF-8",content);
				mailSender.send(message);
				session.setAttribute("emailUUID",uuid);
				
				
			}catch(Exception e) {
				
				System.out.println(e.getMessage());
			}
											
			mailAddr="회원님의 "+(String)resultVO.getEmail()+"로 비밀번호 재설정 링크를 전송했습니다.";
			
			
		}
		return mailAddr;
	}
	
	
	
	@RequestMapping("/find")
	public String find(){
		return "/find/find";
	}
	
	@RequestMapping("/findConf")
	public String findConf(){
		return "/find/findConf";
	}
}
