package com.allhomes.myapp.register;

import java.util.List;

public interface RegisterDaoImp {
	
	//로그인
	public RegisterVO login(RegisterVO vo);
	public int customerInsert(RegisterVO vo);
	
	//전체 회원 조회
	public List<RegisterVO> memberAllSelect();
	

}
