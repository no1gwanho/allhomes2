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
	//회원가입 아이디 중복검사
	public String dupFilter(String userid);
	//회원가입 이메일 중복검사
	public String mailFilter(RegisterVO vo);
	//회원가입 메일인증
	public int regFinal(RegisterVO vo);
	//회원가입 닉네임 중복검사
	public String nicknameCheck(String nickname);
	//회원정보 수정 중복검사
	public RegisterVO dupCheck(RegisterVO vo);
	//회원 기본정보 업데이트
	public int userMebUpdate(RegisterVO vo);

	//회원탈퇴 정보수집 
	public int memOutData(RegisterVO vo);
	//회원탈퇴자 로그인 block
	public int memLogBlock(int m_no);

	
	
	//-------------------마이페이지 관련----------------------//
	//회원 한명의 정보 가지고 오기
	public RegisterVO oneMeberSelect(String userid);
	
	

	
	

}
