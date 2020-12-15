package com.allhomes.myapp.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.admin.AdminMemberDaoImp;
import com.allhomes.myapp.order.AddressVO;
import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.register.RegisterVO;

@Controller
public class AddressController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//마이페이지 배송지 설정 페이지로 이동
	@RequestMapping("/mypageAddress")
	public ModelAndView mypageAddress(HttpSession s) {
		AddressDaoImp dao = sqlSession.getMapper(AddressDaoImp.class);
		AdminMemberDaoImp mDao = sqlSession.getMapper(AdminMemberDaoImp.class);
		RegisterVO rVO = mDao.memberSelect(dao.selectm_no((String)s.getAttribute("userid"))); //회원정보 가져오기
		
	
		//주소지 정보 가져오기
		List<AddressVO> aList = dao.selectAddress(dao.selectm_no((String)s.getAttribute("userid")));
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("아이디"+rVO.getUserid()+rVO.getM_pic());
		
		mav.addObject("aList", aList);
		mav.addObject("rVO", rVO); //회원정보
		mav.setViewName("mypage/addressSetting");
		mav.addObject("m_no", dao.selectm_no((String)s.getAttribute("userid")));//회원 번호
		return mav;
	}
	
	//배송지 수정
	@RequestMapping(value="/addressEdit",method=RequestMethod.POST)
	public ModelAndView addressEdit(@RequestParam("a_code") int a_code, AddressVO vo, HttpSession s) {
		AddressDaoImp dao = sqlSession.getMapper(AddressDaoImp.class);
		
		int result = dao.addressUpdate(vo);
		if(result>=1) { //수정 성공
			
		}else { //수정 실패
			
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:mypageAddress");
		return mav;
	}
	
	//배송지 삭제
	@RequestMapping("/addressDel")
	public ModelAndView addressDel(@RequestParam("a_code") int a_code, HttpSession s) {
		AddressDaoImp dao = sqlSession.getMapper(AddressDaoImp.class);
		
		int result = dao.addressDel(a_code);
		
		if(result>=1) { //삭제 성공
			
		}else { //삭제 실패
			
		}
		
		//주소지 정보 가져오기
		List<AddressVO> aList = dao.selectAddress(dao.selectm_no((String)s.getAttribute("userid")));
				
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:mypageAddress");
		return mav;
	}
	
	//배송지 추가
	@RequestMapping(value="/addressInsert", method=RequestMethod.POST)
	public ModelAndView addressInsert(AddressVO vo, HttpSession s) {
		AddressDaoImp dao = sqlSession.getMapper(AddressDaoImp.class);
		
		dao.addressInsert(vo);
		
	
		//주소지 정보 가져오기
		List<AddressVO> aList = dao.selectAddress(dao.selectm_no((String)s.getAttribute("userid")));
						
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:mypageAddress");		
		return mav;
	}
}
