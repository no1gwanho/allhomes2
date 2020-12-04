package com.allhomes.myapp.register;

import java.util.HashMap;

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
	public ModelAndView registerOkPage(RegisterVO vo,HttpSession ses,String[] profileSet) {
		
	
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
		
		
		
		mav.setViewName("register/registerResult");
		ses.setAttribute("resultVO",resultVO);
		
		return mav;
	}
	
	
	
		
	//프로필 사진 저장
	@RequestMapping(value="/photoBtn",method=RequestMethod.POST)
	@ResponseBody
	public String[] photoBtn(RegisterVO vo,HttpServletRequest req,String m_pic,HttpSession ses,@RequestParam(value="photoBtn") MultipartFile mf) {
		
		String path = ses.getServletContext().getRealPath("/resources/img/register");
		String originFileName = mf.getOriginalFilename();
		
		String profileSet[] = {};
			profileSet[0]=path;
			profileSet[1]=originFileName;
				
		String alert = "";
		//이미 vo에 이름이 있다면 똑같을 걸 눌렀을때도 중복으로 이름이 들어가지 않도록 세팅해줘야함 굳이 알려줄 필요가 있는가?
		if(vo.getM_pic()!=null || (vo.getM_pic()).equals(originFileName)!=true){	//기존 파일명이 있거나 기존에 있는거랑 이름을 비교했을때 다를때
			vo.setM_pic(null);										//저장소 한번 털어주고
			vo.setM_pic(originFileName);							//새로운 파일이름으로 세팅
			
		}else {
			vo.setM_pic(originFileName);//vo에 이미지 세팅
			
		}
		
		return profileSet;
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

