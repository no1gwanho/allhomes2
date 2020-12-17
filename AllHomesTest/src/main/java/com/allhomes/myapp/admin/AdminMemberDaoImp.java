package com.allhomes.myapp.admin;

import java.util.HashMap;
import java.util.List;

import com.allhomes.myapp.homeboard.HomeboardVO;
import com.allhomes.myapp.qna.QnaVO;
import com.allhomes.myapp.register.RegisterVO;

public interface AdminMemberDaoImp {

	//전체 회원 조회(페이징)
	public List<RegisterVO> memberAllSelect(AdminPagingVO vo);
	//전체 회원 정렬
	public List<RegisterVO> memberAllSelectOrder(HashMap<String, Object> map);
	//회원 선택 검색
	public List<RegisterVO> memberSearch(HashMap<String, Object> map);
	public int memberSearchCnt(HashMap<String, Object> map);
	
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
	
	//메인화면-최근 일주일 사이 가입한 회원 수
	public int countRegisMain(int date);
	//탈퇴 회원 수
	public int countRegisOut();
	
	//==========infoCnt===================
	//회원-게시글 수(집들이)
	public int memberHBCnt(String userid);
	//회원-게시글 수
	public int memberQnaCnt(String userid);
	//회원-게시글 수
	public int memberReviewCnt(int m_no);	
	//회원-위시리스트 수
	public int memberWishCnt(String userid);
	//회원-스크랩 수
	public int memberScrapCnt(int m_no);
	//회원-주문 수
	public int memberOrderCnt(String userid);
	
	//회원 주문 가져오기
	public List<AdminOrderVO> memberPurchase(String userid);
	public int orderCnt(String userid);
	
	//회원 집들이 글 가져오기
	public List<HomeboardVO> memberHomeboard(AdminPagingVO vo);
	public int homeboardCnt(String userid);
	
	//질문과답변
	public int qaCnt(String userid);
	public List<QnaVO> memberQnA(AdminPagingVO vo);
	
	
}
