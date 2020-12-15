package com.allhomes.myapp.mypage;

import java.util.List;

import com.allhomes.myapp.order.AddressVO;

public interface AddressDaoImp {
	//회원 id로 m_no 가져오기
	public int selectm_no(String userid);
	//주소지 목록 가져오기
	public List<AddressVO> selectAddress(int m_no);
	//주소지 수정
	public int addressUpdate(AddressVO vo);
	//주소지 삭제
	public int addressDel(int a_code);
	//주소지 추가
	public int addressInsert(AddressVO vo);
	
}
