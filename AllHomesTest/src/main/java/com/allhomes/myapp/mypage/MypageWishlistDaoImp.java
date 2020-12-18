package com.allhomes.myapp.mypage;

import java.util.List;

import com.allhomes.myapp.product.PagingVO;

public interface MypageWishlistDaoImp {

   public List<MypageWishlistJoinVO> selectWishlist(String userid);
   
   public List<MypageWishlistJoinVO> wishlistPage(String userid);
   
   public int addWishlist(MypageWishlistJoinVO vo);
   
   public int getAllListCount(PagingVO vo);
   
   public int wishDel(int pd_no);
}