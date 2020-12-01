package com.allhomes.myapp.product;

public interface OptionDaoImp {
	//옵션 넣기
	public int optionInsert(OptionVO vo);
	
	//옵션 시퀀스 초기화1
	public void dropOptionSq();
	//옵션 시퀀스 초기화1
	public void createOptionSq();
	
	
}
