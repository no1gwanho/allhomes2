package com.allhomes.myapp.homeboard;

import java.util.List;

public interface HomeboardCommentDaoImp {
	
	//댓글 전체선택
	public List<HomeboardCommentVO> commentAllSelect(int b_no);
	
	//댓글 입력
	public int commentInsert(HomeboardCommentVO vo);
	
}
