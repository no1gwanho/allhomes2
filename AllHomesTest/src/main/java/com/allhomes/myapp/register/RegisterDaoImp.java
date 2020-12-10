package com.allhomes.myapp.register;


public interface RegisterDaoImp {
	
	//로그인
	public RegisterVO login(RegisterVO vo);
	public int customerInsert(RegisterVO vo);
	//회원가입
	public int registerMember(RegisterVO vo);
	//회원가입 아이디 중복검사
	public String dupFilter(String userid);
	//회원가입 이메일 중복검사
	public String mailFilter(RegisterVO vo);
	//회원가입 메일인증
	public int regFinal(RegisterVO vo);

}
