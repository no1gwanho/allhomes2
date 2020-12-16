package com.allhomes.myapp.order;


import java.util.List;

import com.allhomes.myapp.cart.CartVO;
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
	
	//cart 선택
	public CartOrderVO selectCart(int c_no);
	
	//주소지 번호로 선택
	public AddressVO selectA_code(int a_code);
	
	//결제 후 구매 테이블에 추가 (시퀀스 +1)
	public int insertPurchase(PurchaseVO pVO);
	
	//결제 후 구매 테이블에 추가 (시퀀스 +0)
	public int insertPurchaseCurrval(PurchaseVO pVO);
	
	//결제번호 현재 시퀀스 가져오기
	public int getLastSQ();
}
