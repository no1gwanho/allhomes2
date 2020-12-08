package com.allhomes.myapp.register;

import java.util.HashMap;
import java.util.List;

import com.allhomes.myapp.admin.AdminPagingVO;

public interface RegisterDaoImp {
	
	//로그인
	public RegisterVO login(RegisterVO vo);
	public int customerInsert(RegisterVO vo);
	
	//전체 회원 조회(페이징)
	public List<RegisterVO> memberAllSelect(AdminPagingVO vo);
	//전체 회원 정렬
	public List<RegisterVO> memberAllSelectOrder(HashMap<String, Object> map);
	//회원 선택 검색
	public List<RegisterVO> memberSearch(HashMap<String, Object> map);
	//회원 상세 검색
	public List<RegisterVO> memberSearchDetail(HashMap<String, Object> map);
	//관리자 회원 상위 10개
	public List<RegisterVO> memberSelectMain();
	//회원번호로 회원 조회
	public RegisterVO memberSelect(int m_no);
	//오늘 가입한 회원 수
	public int countRegisterToday();
	//이번달에 가입한 회원 수
	public int countRegisterMonth();
	//총 회원 수
	public int countRegisterTotal();
	
	
	
	//회원가입
	public int registerMember(RegisterVO vo);
	//아이디 중복검사
	public String dupFilter(String userid);
	//이메일 중복검사
	public int mailFilter(RegisterVO vo);
	//회원가입 메일인증
	public int regFinal(RegisterVO vo);
	

}
