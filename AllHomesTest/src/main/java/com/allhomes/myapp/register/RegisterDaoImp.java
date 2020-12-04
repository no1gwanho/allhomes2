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
	public int countRegisterToday();
	//이번달에 가입한 회원 수
	public int countRegisterMonth();
	//총 회원 수
	public int countRegisterTotal();
	
	//회원 검색
	//id로 검색
	public List<RegisterVO> searchMemberUserid(String userid);
	//이름으로 검색
	public List<RegisterVO> searchMemberUsername(String username);
	//이메일로 검색
	public List<RegisterVO> searchMemberEmail(String email);
	//연락처로 검색
	public List<RegisterVO> searchMemberTel(String tel);
	
	//회원가입
	public int registerMember(RegisterVO vo);
	
	//아이디 중복검사
	public String dupFilter(String userid);

	//프로필 이미지 업로드
	public int photoBtn(String m_pic);
	
	
}
