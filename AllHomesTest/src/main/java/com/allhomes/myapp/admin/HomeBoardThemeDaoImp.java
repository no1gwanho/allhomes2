package com.allhomes.myapp.admin;

import java.util.List;

public interface HomeBoardThemeDaoImp {
	//집들이 게시판 카테고리(테마)
	
	//테마 전체
	public List<HomeBoardThemeVO> HomeBoardThemeAll();
	//테마 추가
	public int HomeBoardThemeAdd(String theme);
	//테마 수정
	public int HomeBoardThemeEdit(HomeBoardThemeVO vo);
	//테마 삭제
	public int HomeBoardThemeDel(int hb_theme_no);
}
