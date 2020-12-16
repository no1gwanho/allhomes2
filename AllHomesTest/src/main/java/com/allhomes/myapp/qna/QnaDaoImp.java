package com.allhomes.myapp.qna;

import java.util.List;

public interface QnaDaoImp {
	
		//질문게시판 레코드 전체(리스트)
		public List<QnaVO> qnaAllList(QnaPagingVO vo);
		
		//질문게시판 전체 개수 
		public int countQnaTotal();
		
		//질문게시판 한 게시판의 답변 개수 구하기 
		public int getAnswerNum(int q_no);
		
		//질문게시판 추가 
		public int qnaInsert(QnaVO vo);
		
		//질문게시판 글번호꺼내기 (글쓰기 후 해당 페이지로 이동)
		public int getQnaNumber();
		
		//질문게시판 작성자 구하기 
		public String getQnaWriter(int q_no);
		
		//질문게시판 글보기 
		public QnaVO qnaSelect(int q_no);
		
		//질문게시판 조회수 증가 
		public void qnaHit(int q_no);
		
		//질문게시판 질문수정 내용보기 
		public QnaVO qnaEditSelect(int q_no);
		
		//질문게시판 질문 수정 완료 
		public int qnaEdit(QnaVO vo);
		
		//질문게시판 글 삭제하기 
		public int qnaDelete(int q_no);
		
		//질문게시판 댓글 추가
		public void addAnswer(int q_no);
		
		//질문게시판 댓글 삭제 
		public void minusAnswer(int q_no); 
		
		//내가쓴 질문게시판 글
		public List<QnaVO> myQnaList(String userid);
		
}
