package com.allhomes.myapp.mypage;

import java.util.List;

public interface MypageWishlistDaoImp {

	public List<MypageWishlistVO> selectWishlist(String userid);
	
	public int addWishlist();
}
