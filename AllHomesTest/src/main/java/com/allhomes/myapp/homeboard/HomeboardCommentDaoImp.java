package com.allhomes.myapp.homeboard;

import java.util.List;

public interface HomeboardCommentDaoImp {
	
	//댓글 전체선택                                        원글번호
	public List<HomeboardCommentVO> commentAllSelect(int b_no);
	
	//댓글 입력
	public int commentInsert(HomeboardCommentVO vo);
	
	//댓글 수정
	public int commentEdit(HomeboardCommentVO vo);
	
	//댓글 삭제
	public int commentDelete(int hb_c_no);
	
	//댓글 개수 가져오기 
	public int getCommentCount(HomeboardCommentVO vo);
	
	
}
