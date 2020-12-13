package com.allhomes.myapp.cart;

import java.util.List;

public interface CartDaoImp {

	public List<CartVO> allCartList();
	
	public int addCartList(CartVO vo);
	
	public int editCartList(CartVO vo);
	
	public int delCartList(int pd_no);
	
	public List<CartJoinVO> joinCart(String userid);
}