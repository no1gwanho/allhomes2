package com.allhomes.myapp.mypage;

import com.allhomes.myapp.register.RegisterVO;

public interface MypageUpdateDaoImp {
	
	//회원정보수정(기본정보)
		public String userEdit(RegisterVO vo);
		
	//회원정보수정(배송지정보)
		public String addrEdit(RegisterVO vo);
}
