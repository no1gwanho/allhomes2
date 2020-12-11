package com.allhomes.myapp.scrap;

import java.util.List;

import com.allhomes.myapp.mypage.MypageWishlistVO;

public interface ScrapDaoImp {

	public List<ScrapVO> selectScrap(String userid);
}
