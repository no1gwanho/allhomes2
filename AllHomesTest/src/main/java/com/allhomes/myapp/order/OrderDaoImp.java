package com.allhomes.myapp.order;


import java.util.List;

import com.allhomes.myapp.register.RegisterVO;

public interface OrderDaoImp {
	//장바구니 정보 얻어오기
	public OrderVO selectOrderCart(int c_no);
	
	//회원 아이디 => 회원번호 가져오기
	public int selectM_no(String userid);
	
	//회원정보 얻어오기
	public RegisterVO selectRegis(int m_no);
	
	//주소지 얻어오기
	public List<AddressVO> selectAddr(int m_no);
}
