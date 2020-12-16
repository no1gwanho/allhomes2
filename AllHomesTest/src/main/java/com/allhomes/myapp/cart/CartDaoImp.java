package com.allhomes.myapp.cart;

import java.util.List;

public interface CartDaoImp {
	
	public List<CartVO> allCartList();
	
	public int addCartList(CartVO vo);
	
	public List<CartJoinVO> joinCart(String userid);
	
	//장바구니 수정
	public int cartUpdate(CartVO vo);
	
	//장바구니 삭제
	public int cartDel(int c_no);
	
	//장바구니 선택
	public CartVO selectCart(int c_no);
}