package com.allhomes.myapp.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.store.StoreDaoImp;
import com.allhomes.myapp.store.StoreVO;

@Controller
public class AdminStoreController {
	
	SqlSession sqlSession;
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	//스토어 추가
	@RequestMapping(value="/storeAdd",method=RequestMethod.POST)
	public ModelAndView storeAdd(StoreVO vo
			,HttpServletRequest req
			,@RequestParam(value="file") MultipartFile mf
			,HttpSession ses) {
		
		//file upload
		String path = ses.getServletContext().getRealPath("upload/storeImg");//파일 저장할 위치
		String originFileName = mf.getOriginalFilename(); //파일 이름
		
		vo.setS_pic(path+"/"+originFileName); //경로+이름 => img컬럼에 세팅
		
		//파일 업로드
		try {
			mf.transferTo(new File(path, originFileName));
		}catch(IOException ie) {
			ie.getStackTrace();
		}
		
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		int result = dao.storeAdd(vo);
		ModelAndView mav = new ModelAndView();
		
		if(result>0) { //insert 성공
			mav.setViewName("redirect:adminStore");
		}else{//실패
			mav.addObject("msg", "스토어 추가에 실패했습니다.");
			mav.setViewName("admin/result");
		}
		return mav;
	}
}
