package com.allhomes.myapp.cart;

import java.util.List;

public interface CartDaoImp {

	public List<CartVO> allCartList();
	
	public CartVO selectCartList();
	
	public int addCartList(int pd_no);
	
	public int editCartList(CartVO vo);
	
	public int delCartList(int pd_no, int m_no);

	public List<CartJoinVO> joinCart(int pd_no);
}
