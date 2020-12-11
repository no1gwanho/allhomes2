package com.allhomes.myapp.mypage;

import com.allhomes.myapp.register.RegisterVO;

public interface MypageUpdateDaoImp {
	
	//배송지 정보 있는지 없는지 확인
	public MypageUpdateVO addrSelect(MypageUpdateVO vo);
	
	
	//배송지 업데이트
	public MypageUpdateVO addrUpdate(MypageUpdateVO vo);
	
	
	
	//회원정보수정(기본정보)
		public String userEdit(RegisterVO vo);
		
	//회원정보수정(배송지정보)
		public String addrEdit(RegisterVO vo);
}
