package com.allhomes.myapp.admin;

public interface AdminRegisterDaoImp {
	
	//관리자 회원가입
	public int adminInsert(AdminRegisterVO vo);
	
	//관리자 로그인
	public AdminRegisterVO adminLogin(AdminRegisterVO vo);
	
	//아이디 중복체크
	public int idCheck(String userid);
}
