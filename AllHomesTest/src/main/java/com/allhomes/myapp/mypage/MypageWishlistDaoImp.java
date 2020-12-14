package com.allhomes.myapp.mypage;

import java.util.List;

public interface MypageWishlistDaoImp {

	public List<MypageWishlistJoinVO> selectWishlist(String userid);
	
	public List<MypageWishlistJoinVO> wishlistPage(String userid);
	
	public int addWishlist(MypageWishlistJoinVO vo);
}
