package com.allhomes.myapp.admin;

import java.util.List;

public interface AdminRegisterDaoImp {
	
	//관리자 회원가입
	public int adminInsert(AdminRegisterVO vo);	
	//관리자 로그인
	public AdminRegisterVO adminLogin(AdminRegisterVO vo);
	//아이디 중복체크
	public int idCheck(String userid);
	//모든 관리자 정보
	public List<AdminRegisterVO> adminAll();
}
