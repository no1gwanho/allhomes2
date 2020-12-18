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
	
	//주문 상태-입금대기 개수
	public int statusDepositWaiting();
	//주문 상태-결제완료 개수
	public int statusPayment();
	//주문 상태-배송준비 개수
	public int statusDeliveryPre();
	//주문 상태-배송중 개수
	public int statusDelivery();
	//주문 상태-구매확정 개수
	public int statusConfirm();
	
	//주문 상태 수정
	public int orderStatusEdit(OrderEditVO vo);
	
}
