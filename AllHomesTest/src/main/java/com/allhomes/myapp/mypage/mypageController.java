package com.allhomes.myapp.mypage;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.purchase.PurchaseDaoImp;
import com.allhomes.myapp.purchase.PurchaseJoinVO;
import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.register.RegisterVO;
import com.allhomes.myapp.scrap.ScrapDaoImp;
import com.allhomes.myapp.scrap.ScrapVO;

@Controller
public class mypageController {
	@Autowired
	SqlSession sqlSession;

	//mypage홈으로 이동
	@RequestMapping("/mypageHome")
	public ModelAndView mypageHome(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
				
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("userid");
		
		RegisterDaoImp reg = sqlSession.getMapper(RegisterDaoImp.class);		
		RegisterVO vo = reg.oneMeberSelect(userid);
		
		MypageWishlistDaoImp wish = sqlSession.getMapper(MypageWishlistDaoImp.class);
		List<MypageWishlistVO> list = wish.selectWishlist(userid);
		
		ScrapDaoImp scrap = sqlSession.getMapper(ScrapDaoImp.class);
		List<ScrapVO> sList = scrap.selectScrap(userid);
		
		mv.addObject("list", list);		
		mv.addObject("sList", sList);
		mv.addObject("vo", vo);
		
		mv.setViewName("mypage/mypageHome");
		
		return mv;
	}
	
	
	
	
	
	
	
	//mypage 회원정보수정으로이동
	@RequestMapping(value="/userEdit",produces="application/text;charset=UTF-8")
	public ModelAndView userEdit(HttpSession session,MypageUpdateVO vo,RegisterVO vo1) {
		
		MypageUpdateDaoImp dao = sqlSession.getMapper(MypageUpdateDaoImp.class);
		ModelAndView mav = new ModelAndView();	
				
		if(session.getAttribute("m_no")!=null) {	//로그인 성공하고 들어올때 명령 1.주소데이터가 있을대와 2.주소데이터가 없을때
					
			int m_no = (Integer)session.getAttribute("m_no");
			vo.setM_no(m_no);
						
			MypageUpdateVO resultVO = dao.addrSelect(vo);
				
			if(resultVO==null) {	//주소지 데이터가 없을때
									
			}else {//주소지 데이터가 있을때
						
//					//만약에 이 사람이 배송을 안시켜서 주소 데이터가 없다면 공란으로 남겨두기
//					if(resultVO.getReceiver()==null || resultVO.getZipcode()==0 || resultVO.getAddr()==null || resultVO.getAddrdetail()==null ||resultVO.getTel()==null) {
//						mav.addObject("receiver","");
//						mav.addObject("zipcode",0);
//						mav.addObject("addr","");
//						mav.addObject("addrdetail","");
//						mav.addObject("tel","");
//										
//						mav.setViewName("mypage/userEditForm");	//어차피 전부 not null값들이라 하나 비었으면 다비었을것 그냥 view로 보냄
//					
					//}else {
						mav.addObject("receiver",resultVO.getReceiver());
						mav.addObject("zipcode",resultVO.getZipcode());
						mav.addObject("addr",resultVO.getAddr());
						mav.addObject("addrdetail",resultVO.getAddrdetail());
						mav.addObject("tel",resultVO.getTel());
						
						mav.setViewName("mypage/userEditForm");
				//	}
				}
			
		}else {	//로그인 안하고 들어올때 돌려보내야함	
			
			}
			mav.setViewName("mypage/userEditForm");
		
		return mav;
	}
	
	@RequestMapping(value="/addrEditForm")
	public String addrEditForm() {
		
		return "mypage/addrEditForm";
		
	}
	
	
	
	
	
	//수정버튼 눌렀을때
	@RequestMapping(value="/updateOk",produces="application/text;charset=UTF-8")
	public ModelAndView updateOk(RegisterVO vo,HttpServletResponse req,HttpSession session) {
		
	//	@RequestParam("m_pic") MultipartFile m_pic
		 
		System.out.println("test1");
		
		//기본정보 업데이트
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
						
		String originEmail = (String)session.getAttribute("email");
		String splEmail[] = originEmail.split("@");
		vo.setEmail1(splEmail[0]);
		vo.setEmail2(splEmail[1]);	//이메일 세팅
		vo.setNickname((String)session.getAttribute("nickname"));//닉네임 세팅
				
		System.out.println("test2");		
		RegisterVO dupCheck = dao.dupCheck(vo);
		ModelAndView mav = new ModelAndView();
				
		if(dupCheck==null){
//			
//			//db에 중복되는 값이 없다면 값이 달라졌다는 뜻이니깐 db update! ㅅㅂ 사진은 중복되든 말든 체크할 필요없음 그냥 아무것도  이전거랑 똑같은 걸 올렸다면? 
//				
//			
//			System.out.println("test3");
//			///////////프로필 사진 업로드////////////
//			String path = session.getServletContext().getRealPath("/")+"resources\\upload\\register";
//			
//			String fileNames = "";
//					
//				String fName = m_pic.getOriginalFilename();
//				
//				if(fName!=null && !fName.equals("")) {
//					//앞쪽 이름구하기
//					String originFileName = fName.substring(0,fName.lastIndexOf("."));
//					//확장자구하기
//					String originLast = fName.substring(fName.lastIndexOf(".")+1);
//					
//					//파일 이름바꾸기
//					File f=new File(path,fName);
//					if(f.exists()) {		//기존에 동일한게 올라가 있다면 실행시키는 영역
//						for(int renameNum=1;;renameNum++) {
//							String renameFile = originFileName+renameNum+"."+originLast;	//변경된파일명
//							f = new File(path,renameFile);
//							
//							//파일이 위치에 있나없나 확인
//							if(!f.exists()) {
//								fName = renameFile;
//								break;
//							}
//						}
//					}
//					fileNames = fName;
//					try {
//						if(originLast.equals("gif") || originLast.equals("jpeg") || originLast.equals("png") ||  originLast.equals("jfif")) {
//							m_pic.transferTo(f);	//확장자명이 맞을때만 업로드
//						
//						
//							vo.setM_pic(fileNames);
//							
//							////////////////////////
//							
//							int resultVO = dao.userMebUpdate(vo); //업데이트를 시켜줬는데 =>여기서 update 쿼리 다날려주면됨
//							
//							if(resultVO<=0) {	//업데이트가 안일어나면 
//								if(fileNames!=null) {	//근데 파일이름은 그대로 남아있다면 
//									File ff = new File(path,fileNames);	//지워라
//										ff.delete();
//											
//									}
//								}
//						
//							
//							//session.setAttribute("resultVO",resultVO);	
//						
//						}else {
//							//이미지 파일이 아닐때 경고문구 날려주기
//							mav.setViewName("landing/registerUnSuitImg");				
//						}
//									
//					}catch(Exception e) {e.printStackTrace();}
//										 
//					
//				}else {	//파일이름이 없거나 공백이면 기본 이미지가 이미 세팅돼있으니 아무것도 안하면됨
//					System.out.println("test4");
//					fileNames = "basicprofile.png";
//					vo.setM_pic(fileNames);
//
//					int resultVO = dao.registerMember(vo);   //여기서 update
//					
//					mav.setViewName("landing/registerOkPage");
//					session.setAttribute("resultVO",resultVO);		
//							
			
			
			System.out.println("test5");
			mav.setViewName("/home");
			req.setContentType("text/html;charset=UTF-8");
			PrintWriter out;
			try {
				out = req.getWriter();
				out.println("<script>alert('회원정보가 수정되었습니다.');</script>");
				out.flush();
			
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		
		
		
		
		
		
		}else {	//db에 중복되는 값이 있다면 그대로 냅둔것임 근데! 이건 다른사람 닉네임이랑 겹치거나 이메일(이메일도 중복검사가 필요함)이 중복됐다는 뜻
			
			
			//////여기서 제한 걸어줘야함
			
			
			mav.setViewName("/home");
			req.setContentType("text/html;charset=UTF-8");
			PrintWriter out;
			try {
				out = req.getWriter();
				out.println("<script>alert('회원정보가 수정되면 안됩니다..');</script>");
				out.flush();
				System.out.println("test3");
				
			} catch (IOException e) {
				e.printStackTrace();
				
			}
			
		}
				
		return mav;
	}
	
	
	
	
	
	
	//mypage 나의 쇼핑으로 이동
	@RequestMapping("/mypageShopping")
	public ModelAndView purchaseList(HttpSession ses) {
		PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class);

		String userid = (String)ses.getAttribute("userid");
		ModelAndView mav = new ModelAndView();
				
		mav.addObject("pList", dao.allPurchaseList());

		mav.setViewName("mypage/mypageShopping");
		
		return mav;
	}
	
	// 나의 쇼핑 페이지에서 구매확정 버튼 눌렀을 때 
	@RequestMapping(value="/setInPurchase", method=RequestMethod.POST)
	public ModelAndView purchaseUpdate(@RequestParam("pc_no") int pc_no, HttpSession ses) {
		PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class);
		int result = dao.editConfirmCheck(pc_no);
		
		ModelAndView mav = new ModelAndView();
				
		if(result > 0) {			
			ses.setAttribute("confirm", "Y");
			mav.setViewName("mypage/mypageShopping");
		}else {
			mav.addObject("msg", "구매확정에 실패했습니다");
			mav.setViewName("landing/resultPage");
		}		
		
		return mav;
	}

	@RequestMapping("/mypageWishlist")
	public ModelAndView wishListAdd(MypageWishlistVO vo, HttpServletRequest r) {
		ModelAndView mv = new ModelAndView();
		MypageWishlistDaoImp dao = sqlSession.getMapper(MypageWishlistDaoImp.class);
		
		System.out.println(r.getParameter("m_no"));
		
		HttpSession ses = r.getSession();
		String userid = (String)ses.getAttribute("userid");
		
		List<MypageWishlistVO> list = dao.wishlistPage(userid);
		
		mv.addObject("list", list);
		mv.setViewName("mypage/mypageWishlist");
				
		return mv;
	}
	
	//mypage 스크랩으로 이동
	@RequestMapping("/mypageScrap")
	public String mypageScrap() {
		return "mypage/mypageScrap";
	}
	
	//mypage 나의 작성글로 이동
	@RequestMapping("/mypageMyboard")
	public String mypageMyboard() {
		return "mypage/mypageMyboard";
	}
	
	//mypage 회원 정보 수정으로 이동
	@RequestMapping("/mypageEdit")
	public String mypageSetting() {
		return "mypage/userEditForm";
	}
	
}
