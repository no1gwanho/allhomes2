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
import com.allhomes.myapp.purchase.PurchaseJoinVO;
import com.allhomes.myapp.purchase.PurchaseVO;
import com.allhomes.myapp.register.RegisterDaoImp;
import com.allhomes.myapp.register.RegisterVO;
import com.allhomes.myapp.review.ReviewDaoImp;
import com.allhomes.myapp.review.ReviewVO;
import com.allhomes.myapp.scrap.ScrapDaoImp;
import com.allhomes.myapp.scrap.ScrapVO;

@Controller
public class mypageController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//mypage홈으로 이동
	@RequestMapping("/mypageHome") //Interceptor로 로그인되어있지 않으면 로그인 페이지로 이동 
	public ModelAndView mypageHome(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
				
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("userid");
		
		RegisterDaoImp reg = sqlSession.getMapper(RegisterDaoImp.class);		
		RegisterVO vo = reg.oneMeberSelect(userid);
		
		MypageWishlistDaoImp wish = sqlSession.getMapper(MypageWishlistDaoImp.class);
		List<MypageWishlistJoinVO> list = wish.selectWishlist(userid);
		
		int m_no = (Integer)ses.getAttribute("m_no");
		ScrapDaoImp scrap = sqlSession.getMapper(ScrapDaoImp.class);
		List<ScrapVO> sList = scrap.selectScrap(m_no);
		
		
		
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
	
	
	@RequestMapping(value="/outcheckpoint")
	public ModelAndView outcheckpoint(HttpServletRequest request,HttpSession session,RegisterVO vo,HttpServletResponse resp) {	//배열로 바꾸는걸 생각해보자
		
		ModelAndView mav = new ModelAndView();
		
		String finalCheck = request.getParameter("finalCheck");
		String useless = request.getParameter("useless");
		String rereg = request.getParameter("rereg");
		String conless = request.getParameter("conless");
		String indi = request.getParameter("indi");
		String etc = request.getParameter("etc");
		
		//종합변수(위에 변수들 다합친거) = split으로 null을 기배열 꺼집어내서 담아주고 substring으로 잘라서 null기준으로  합쳐준다.
		
		String totalVal = useless+"&"+rereg+"&"+conless+"&"+indi+"&"+etc;
		String [] resultVal =totalVal.split("&null"); 
		String finalResult="";
		
		
		for(int i=0;i<resultVal.length;i++) {
			finalResult += resultVal[i];
		}
		
		System.out.println(finalResult);
		
		//1.finalcheck를 클릭하면 regcode를 0으로 만들어서 로그인이 불가능하도록 만들어준다
		RegisterDaoImp dao = sqlSession.getMapper(RegisterDaoImp.class);
		
		System.out.println((Integer)session.getAttribute("m_no"));//번호나옴
		vo.setM_no((Integer)session.getAttribute("m_no"));
		
		
		int resultVO = dao.memLogBlock((Integer)session.getAttribute("m_no"));
		
		
		
		if(finalCheck != null && resultVO>0) {
			//로그인 블락에 성공하면 데이터수집
			
			vo.setUserid((String)session.getAttribute("userid"));
			vo.setNickname((String)session.getAttribute("nickname"));
			vo.setOutmemo(finalResult);
			
			
			int resultOutData = dao.memOutData(vo);
			
			if(resultOutData>0) {
				resp.setContentType("text/html;charset=UTF-8");
				PrintWriter out;
				try {
					out = resp.getWriter();
					out.println("<script>alert('회원탈퇴가 완료되었습니다.');</script>");
					out.flush();
				//	session.invalidate();
					session.removeAttribute("logStatus");
					mav.setViewName("/home");		
				} catch (IOException e) {
					
					e.printStackTrace();
				}
				
			}
			
			
			
		}else if(finalCheck ==null){
			
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out;
			
			try {
				out = resp.getWriter();
				out.println("<script>alert('회원탈퇴 동의란에 체크해주세요.');</script>");
				out.flush();
				mav.setViewName("/outcheckpoint");		
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
			
		
		
		mav.setViewName("/home");
		
		
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
		vo.setEmail2(splEmail[1]);	
		vo.setNickname((String)session.getAttribute("nickname"));
		vo.setM_pic((String)session.getAttribute("m_pic"));
		
		//비교할 신규데이터 입력
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
			
		if(dupCheck==null){
							
			///////////프로필 사진 업로드////////////
			String path = session.getServletContext().getRealPath("/")+"resources\\upload\\register";
			String fileNames = "";
			String fName = picBox.getOriginalFilename();
			
				if(fName!=null && !fName.equals("")) {	
					
					String originFileName = fName.substring(0,fName.lastIndexOf("."));
					
					String originLast = fName.substring(fName.lastIndexOf(".")+1);
				
					
					File f=new File(path,fName);
					if(f.exists()) {		
						for(int renameNum=1;;renameNum++) {
							String renameFile = originFileName+renameNum+"."+originLast;	
						f = new File(path,renameFile);
							
						
						if(!f.exists()) {
								fName = renameFile;
								break;
							}
						}
					}
					fileNames = fName;
					try {
						if(originLast.equals("gif") || originLast.equals("jpeg") || originLast.equals("png") ||  originLast.equals("jfif")) {
							picBox.transferTo(f);	
							vo.setM_pic(fileNames);
							vo.setM_no((Integer)session.getAttribute("m_no"));
						
							int resultVO = dao.userMebUpdate(vo); 
							
							if(resultVO<=0) {	
								if(fileNames!=null) {	
									File ff = new File(path,fileNames);	
										ff.delete();
								}
							}
							mav.setViewName("landing/registerOkPage");
							session.setAttribute("resultVO",resultVO);	
					
						}else{
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
				
					if(fName!=null && !fName.equals("")) {	
						
						String originFileName = fName.substring(0,fName.lastIndexOf("."));
						
						String originLast = fName.substring(fName.lastIndexOf(".")+1);
					
						
						File f=new File(path,fName);
						if(f.exists()) {		
							for(int renameNum=1;;renameNum++) {
								String renameFile = originFileName+renameNum+"."+originLast;	
							f = new File(path,renameFile);
								
						
							if(!f.exists()) {
									fName = renameFile;
									break;
								}
							}
						}
						fileNames = fName;
						try {
							if(originLast.equals("gif") || originLast.equals("jpeg") || originLast.equals("png") ||  originLast.equals("jfif")) {
								picBox.transferTo(f);	
							
							
								vo.setM_pic(fileNames);
								
								
								vo.setM_no((Integer)session.getAttribute("m_no"));
								int resultVO = dao.userMebUpdate(vo);
								
								if(resultVO<=0) {	
									if(fileNames!=null) {	
										File ff = new File(path,fileNames);	
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
	public ModelAndView purchaseList(HttpServletRequest r) {
		ModelAndView mav = new ModelAndView();
		
		PurchaseDaoImp dao = sqlSession.getMapper(PurchaseDaoImp.class);
		HttpSession ses = r.getSession();
		
		String userid = (String)ses.getAttribute("userid");
		PurchaseJoinVO vo = new PurchaseJoinVO();

		vo.setUserid(userid);
			
		List<PurchaseJoinVO> list = dao.joinPurchase(userid);
		for(int i=0; i<list.size(); i++) {
			vo = list.get(i);
			int pd_no = vo.getPd_no();
			
			System.out.println("제품번호는 얼마야??????????????????????"+pd_no);
			mav.addObject("pd_no", pd_no);
		}
		
		mav.addObject("list", list);
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
		MypageWishlistDaoImp dao = sqlSession.getMapper(MypageWishlistDaoImp.class);
		HttpSession s = r.getSession();
		
		String userid = (String)s.getAttribute("userid");
		MypageWishlistJoinVO vo = new MypageWishlistJoinVO();
		vo.setUserid(userid);
		vo.setPd_no(pd_no);
		
		int result = dao.addWishlist(vo);

		System.out.println(result);
		
		mv.addObject("r", result);
		mv.addObject("pd_no", pd_no);
		mv.setViewName("landing/wishConfirm");
		
		return mv;
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
