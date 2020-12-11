package com.allhomes.myapp.qna;

import java.util.List;

public interface QnaCommentDaoImp {
	
	//질문게시판 댓글 전체 선택 
	public List<QnaCommentVO> commentAllSelect(int q_no);
	
	//질문게시판 댓글 입력
	public int commentInsert(QnaCommentVO vo);
	
	//질문게시판 댓글 수정
	public int commentEdit(QnaCommentVO vo);
	
	//질문게시판 댓글 삭제
	public int commentDelete(int q_c_no);
	
	//질문게시판 댓글의 원글 번호 찾기 
	public int originalNum(int q_c_no);
}
