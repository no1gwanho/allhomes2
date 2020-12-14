package com.allhomes.myapp.mypage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.purchase.PurchaseDaoImp;
import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.register.RegisterVO;
import com.allhomes.myapp.scrap.ScrapDaoImp;
import com.allhomes.myapp.scrap.ScrapVO;

@Controller
public class mypageController {
	@Autowired
	SqlSession sqlSession;

	@Autowired 
	DataSourceTransactionManager transactionManager;
	
	//mypage홈으로 이동
	@RequestMapping("/mypageHome")
	public ModelAndView mypageHome(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
				
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("userid");
		
		RegisterDaoImp reg = sqlSession.getMapper(RegisterDaoImp.class);		
		RegisterVO vo = reg.oneMeberSelect(userid);
		
		MypageWishlistDaoImp wish = sqlSession.getMapper(MypageWishlistDaoImp.class);
		List<MypageWishlistJoinVO> list = wish.selectWishlist(userid);
		
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
//						mav.addObject("receiver",resultVO.getReceiver());
//						mav.addObject("zipcode",resultVO.getZipcode());
//						mav.addObject("addr",resultVO.getAddr());
//						mav.addObject("addrdetail",resultVO.getAddrdetail());
//						mav.addObject("tel",resultVO.getTel());
						
						mav.setViewName("mypage/userEditForm");
				//	}
				}
				
		//	}
			mav.setViewName("mypage/userEditForm");
			
		}else {	//로그인 안하고 들어올때 돌려보내야함	
			
			}
			mav.setViewName("mypage/userEditForm");
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/addrEditForm")
	public ModelAndView addrEditForm(MypageUpdateVO vo,HttpSession session) {
				
		MypageUpdateDaoImp dao = sqlSession.getMapper(MypageUpdateDaoImp.class);
				
		ModelAndView mav = new ModelAndView();
		
		
		
		if(session.getAttribute("m_no")!=null) {
			vo.setM_no((Integer)session.getAttribute("m_no"));
			
			MypageUpdateVO resultVO = dao.addrSelect(vo);
	
			
			
			
		if(resultVO!=null){	//주소데이터가 있다면(회원번호를 기준으로) =>m_no 똑같은 것 갯수 기준으로 view 폼뿌려주기 
				
			mav.addObject("receiver",resultVO.getReceiver());
			mav.addObject("zipcode",resultVO.getZipcode());
			mav.addObject("addr",resultVO.getAddr());
			mav.addObject("addrdetail",resultVO.getAddrdetail());
			mav.addObject("tel",resultVO.getTel());
			
			mav.setViewName("mypage/addrEditForm");
			
			
			
		}else {

			mav.setViewName("mypage/addrEditForm");
			
			
		}
		
		}else {
			//로그인 안하고 들어왔다는거니깐 제한걸어줘야함
			mav.setViewName("mypage/addrEditForm");
		}
		
		return mav;

	}
	
	//주소지 수정 버튼 눌렀을때
	
	@RequestMapping(value="/addrUpdateOk",produces="application/text;charset=UTF-8")
	public ModelAndView addrUpdateOk(MypageUpdateVO vo,HttpServletResponse req,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		MypageUpdateDaoImp dao = sqlSession.getMapper(MypageUpdateDaoImp.class);
		
		vo.setM_no((Integer)session.getAttribute("m_no"));
		int resultVO = dao.addrUpdate(vo);
		
		if(resultVO>0) {//변한값이 있을때
			
			
			mav.setViewName("/home");
			req.setContentType("text/html;charset=UTF-8");
			PrintWriter out;
			try {
				out = req.getWriter();
				out.println("<script>alert('주소지정보가 수정되었습니다.');</script>");
				out.flush();
						
			} catch (IOException e) {
				
				e.printStackTrace();
			}
				
		}else {
			mav.setViewName("/home");
			req.setContentType("text/html;charset=UTF-8");
			PrintWriter out;
			try {
				out = req.getWriter();
				out.println("<script>alert('주소지정보가 수정안됐습니다.');</script>");
				out.flush();
						
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			
		}
		
		return mav;
	}
	
	
	
	
	
	
	
	//수정버튼 눌렀을때
	@RequestMapping(value="/updateOk",produces="application/text;charset=UTF-8")
	public ModelAndView updateOk(RegisterVO vo,RegisterVO vo1,HttpServletResponse req,HttpSession session,String email,String nickname,String tel,@RequestParam("picBox") MultipartFile picBox) {
		
					
		//기본정보 업데이트
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
						
		String originEmail = (String)session.getAttribute("email");
		String splEmail[] = originEmail.split("@");
		vo.setEmail1(splEmail[0]);
		vo.setEmail2(splEmail[1]);	//이메일 세팅
		vo.setNickname((String)session.getAttribute("nickname"));//로그인할때 session정보 가져옴
		vo.setM_pic((String)session.getAttribute("m_pic"));
		
		//이제 비교할 신규데이터 입력
		String updEmail = email;
		String splupdEmail [] = email.split("@");
		vo1.setEmail1(splupdEmail[0]);
		vo1.setEmail2(splupdEmail[1]);
		
		
		vo1.setNickname(nickname);
		vo1.setTel(tel);
				
		System.out.println(vo1.getEmail());
		System.out.println(vo1.getTel());
		System.out.println(vo1.getNickname());
		
		RegisterVO dupCheck = dao.dupCheck(vo1);
		ModelAndView mav = new ModelAndView();
				
		
		
		
		if(dupCheck==null){//이메일이랑 닉네임이랑 겹치는게 없다면
			
			
					
			///////////프로필 사진 업로드////////////
			String path = session.getServletContext().getRealPath("/")+"resources\\upload\\register";
			String fileNames = "";
			String fName = picBox.getOriginalFilename();
			
				if(fName!=null && !fName.equals("")) {	//이미지를 뭔가는 선택을했을때
					//앞쪽 이름구하기
					String originFileName = fName.substring(0,fName.lastIndexOf("."));
					//확장자구하기
					String originLast = fName.substring(fName.lastIndexOf(".")+1);
				
					//파일 이름바꾸기
					File f=new File(path,fName);
					if(f.exists()) {		//기존에 동일한게 올라가 있다면 실행시키는 영역
						for(int renameNum=1;;renameNum++) {
							String renameFile = originFileName+renameNum+"."+originLast;	//변경된파일명
						f = new File(path,renameFile);
							
						//파일이 위치에 있나없나 확인
						if(!f.exists()) {
								fName = renameFile;
								break;
							}
						}
					}
					fileNames = fName;
					try {
						if(originLast.equals("gif") || originLast.equals("jpeg") || originLast.equals("png") ||  originLast.equals("jfif")) {
							picBox.transferTo(f);	//확장자명이 맞을때만 업로드
							vo.setM_pic(fileNames);
							vo.setM_no((Integer)session.getAttribute("m_no"));
						
							int resultVO = dao.userMebUpdate(vo); //업데이트를 시켜줬는데 =>여기서 update 쿼리 다날려주면됨
							
							if(resultVO<=0) {	//업데이트가 안일어나면 
								if(fileNames!=null) {	//근데 파일이름은 그대로 남아있다면 
									File ff = new File(path,fileNames);	//지워라
										ff.delete();
								}
							}
							mav.setViewName("landing/registerOkPage");
							session.setAttribute("resultVO",resultVO);	
					
						}else{//이미지 파일이 아닐때 경고문구 날려주기
							mav.setViewName("landing/registerUnSuitImg");				
						}
					}catch(Exception e) {e.printStackTrace();}
					
					
					
					int resultVO = dao.userMebUpdate(vo1);
					mav.setViewName("/home");
					session.setAttribute("resultVO",resultVO);	
					
					
					
				}else {	
					System.out.println("test4");
					fileNames = "basicprofile.png";	
					vo.setM_pic(fileNames);

					int resultVO = dao.userMebUpdate(vo1);   
					System.out.println("test5");
					mav.setViewName("/home");
					session.setAttribute("resultVO",resultVO);			
							
				}
			/////////////////파일업로드 종료////////////
		
			session.setAttribute("nickname", vo1.getNickname());
			session.setAttribute("email", vo1.getEmail());
			session.setAttribute("tel", vo1.getTel());
			session.setAttribute("m_pic", vo1.getM_pic());
						
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
	
		
	
		}else {	//dupcheck이 0보다 클때
			if(originEmail == updEmail || vo.getNickname()==vo1.getNickname()) {
				String path = session.getServletContext().getRealPath("/")+"resources\\upload\\register";
				
				String fileNames = "";
				String fName = picBox.getOriginalFilename();
				
					if(fName!=null && !fName.equals("")) {	//이미지를 뭔가는 선택을했을때
						//앞쪽 이름구하기
						String originFileName = fName.substring(0,fName.lastIndexOf("."));
						//확장자구하기
						String originLast = fName.substring(fName.lastIndexOf(".")+1);
					
						//파일 이름바꾸기
						File f=new File(path,fName);
						if(f.exists()) {		//기존에 동일한게 올라가 있다면 실행시키는 영역
							for(int renameNum=1;;renameNum++) {
								String renameFile = originFileName+renameNum+"."+originLast;	//변경된파일명
							f = new File(path,renameFile);
								
							//파일이 위치에 있나없나 확인
							if(!f.exists()) {
									fName = renameFile;
									break;
								}
							}
						}
						fileNames = fName;
						try {
							if(originLast.equals("gif") || originLast.equals("jpeg") || originLast.equals("png") ||  originLast.equals("jfif")) {
								picBox.transferTo(f);	//확장자명이 맞을때만 업로드
							
							
								vo.setM_pic(fileNames);
								
								////////////////////////
								vo.setM_no((Integer)session.getAttribute("m_no"));
								int resultVO = dao.userMebUpdate(vo); //업데이트를 시켜줬는데 =>여기서 update 쿼리 다날려주면됨
								
								if(resultVO<=0) {	//업데이트가 안일어나면 
									if(fileNames!=null) {	//근데 파일이름은 그대로 남아있다면 
										File ff = new File(path,fileNames);	//지워라
											ff.delete();
												
										}
								}
							
								session.setAttribute("nickname", vo1.getNickname());
								session.setAttribute("email", vo1.getEmail());
								session.setAttribute("tel", vo1.getTel());
								session.setAttribute("m_pic", vo1.getM_pic());
										
								
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
						
					}else {
								//이미지 파일이 아닐때 경고문구 날려주기
								mav.setViewName("landing/registerUnSuitImg");				
							}
										
						}catch(Exception e) {e.printStackTrace();}
						
						int resultVO = dao.userMebUpdate(vo1);
						
						mav.setViewName("/home");
						session.setAttribute("resultVO",resultVO);	
						
						
						
					}else {	//이메일이랑 닉네임이 겹치지 않으면서 + 파일이름이 없거나(따로선택안했거나) 공백이면 기본 이미지가 이미 세팅돼있으니 아무것도 안하면됨
						System.out.println("test4");
						fileNames = "basicprofile.png";	//이게 초기값이 다른거였는데 바뀌는지 확인해야함
						vo.setM_pic(fileNames);

						int resultVO = dao.userMebUpdate(vo1);   
						System.out.println("test5");
						mav.setViewName("/home");
						session.setAttribute("resultVO",resultVO);			
								
					}
			
			}else {
					
			dao.userMebUpdate(vo1);
			//////여기서 제한 걸어줘야함
			mav.setViewName("/home");
			req.setContentType("text/html;charset=UTF-8");
			PrintWriter out;
			try {
				out = req.getWriter();
				out.println("<script>alert('회원정보가 수정되면 안됩니다..');</script>");
				out.flush();
				
				
			} catch (IOException e) {
				e.printStackTrace();
				
			}
			
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
		
		List<MypageWishlistJoinVO> list = dao.wishlistPage(userid);
		
		mv.addObject("list", list);
		mv.setViewName("mypage/mypageWishlist");
				
		return mv;
	}
	
	@RequestMapping("/wishAdd")
	public ModelAndView wishAdd(@RequestParam("pd_no") int pd_no, HttpServletRequest r) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession s = r.getSession();
		String userid = (String)s.getAttribute("userid");
		MypageWishlistJoinVO vo = new MypageWishlistJoinVO();
		vo.setUserid(userid);

		MypageWishlistDaoImp dao = sqlSession.getMapper(MypageWishlistDaoImp.class);
		int result = dao.addWishlist(vo);
		System.out.println(result);
		
		mv.addObject("r", result);
		mv.addObject("pd_no", pd_no);
		mv.setViewName("landing/wishConfirm");
		
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
