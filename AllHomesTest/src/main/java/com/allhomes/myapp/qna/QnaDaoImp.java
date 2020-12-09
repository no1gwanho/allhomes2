package com.allhomes.myapp.qna;

import java.util.List;

public interface QnaDaoImp {
	
		//질문게시판 레코드 전체 
		public List<QnaVO> qnaAllList();
		
		//질문게시판 추가 
		public int qnaInsert(QnaVO vo);
		
		//질문게시판 글번호꺼내기 (글쓰기 후 해당 페이지로 이동)
		public int getQnaNumber();
		
		//질문게시판 작성자 구하기 
		public String getQnaWriter(int q_no);
		
		//질문게시판 글보기 
		public QnaVO qnaSelect(int q_no);
		
		//질문게시판 답변 구하기 
		
		//질문게시판 조회수 증가 
		public void qnaHit(int q_no);
		
		//질문게시판 질문수정 내용보기 
		public QnaVO qnaEditSelect(int q_no);
		
		//질문게시판 질문 수정 완료 
		public int qnaEdit(QnaVO vo);
		
		//질문게시판 글 삭제하기 
		public int qnaDelete(int q_no);
		
		
		
	
	

}
