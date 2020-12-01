package com.allhomes.myapp.register;

import java.util.List;

public interface RegisterDaoImp {
	
	//로그인
	public RegisterVO login(RegisterVO vo);
	public int customerInsert(RegisterVO vo);
	
	//전체 회원 조회
	public List<RegisterVO> memberAllSelect();
	//전체 회원 정렬
	public List<RegisterVO> memberAllSelectOrder(String val);
	//회원번호로 회원 조회
	public RegisterVO memberSelect(int m_no);
	//오늘 가입한 회원 수
	public int countRegister();
	
	
	
	
	

}
