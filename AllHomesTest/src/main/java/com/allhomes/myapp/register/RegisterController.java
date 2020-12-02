package com.allhomes.myapp.register;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
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
	public ModelAndView registerOkPage(RegisterVO vo,HttpSession ses) {
		
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
			
		String regAlert="회원가입에 실패했습니다.";
			
		int resultVO = dao.registerMember(vo);
		
		ModelAndView mav = new ModelAndView();
						
		mav.setViewName("register/registerResult");
		ses.setAttribute("resultVO",resultVO);
		
		return mav;
	}

	
	
	
	
	//아이디 중복검사
	@RequestMapping(value="/dupFilter")	
	@ResponseBody	
	public String dupFilter(RegisterVO vo,String userid) {
	
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		
				
		RegisterVO resultVO = dao.dupFilter(vo);
	
		
		String alert="";
		if(resultVO!=null){
			alert=userid+"는 사용할 수 없는 아이디 입니다.";
		}else {
			alert=userid+"는 사용가능한 아이디 입니다.";
		}
				
		return alert;
	}
		
		

	//프로필 사진 업로드
	@RequestMapping(value="/photoBtn",method=RequestMethod.POST)
	@ResponseBody
	public void photoBtn(RegisterVO vo,HttpServletRequest req,String m_pic,HttpSession ses,@RequestParam(value="photoBtn") MultipartFile mf) {
		
		String path = ses.getServletContext().getRealPath("/resources/img/register");
		String originFileName = mf.getOriginalFilename();
		
		
		//이미 vo에 이름이 있다면 똑같을 걸 눌렀을때도 중복으로 이름이 들어가지 않도록 세팅해줘야함
		if(vo.getM_pic()!=null) {
			//alert?으로 경고
		}else {
			vo.setM_pic(originFileName);//vo에 이미지 세팅
		}
	}		
	

}

