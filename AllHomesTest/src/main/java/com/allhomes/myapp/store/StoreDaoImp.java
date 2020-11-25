package com.allhomes.myapp.store;

import java.util.List;

public interface StoreDaoImp {
	//스토어 추가
	public int storeAdd(StoreVO vo);
	//전체 스토어 목록 불러오기
	public List<StoreVO> storeAll();
	//스토어 선택
	public StoreVO storeSelect(int s_no);
	//스토어 삭제
	public int storeDel(int s_no);
	//스토어 수정
	public int storeEdit(StoreVO vo);
}
