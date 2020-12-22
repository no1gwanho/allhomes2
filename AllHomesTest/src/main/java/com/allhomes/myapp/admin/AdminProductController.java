package com.allhomes.myapp.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.product.ProductVO;

@Controller
public class AdminProductController {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	
	//제품 추가 페이지로 이동
	@RequestMapping("/productAdd")
	public ModelAndView productAdd(@RequestParam("s_no") int s_no) { // 스토어번호 가져오기

		// 서브카테고리 값 가져와서 세팅
		AdminStoreDaoImp dao = sqlSession.getMapper(AdminStoreDaoImp.class);
		List<AdminStoreSubCategoryVO> subList = dao.storeSubCategoryAll(); // 서브카테고리명
		ModelAndView mav = new ModelAndView();
		mav.addObject("subList", subList);// 서브카테고리명 세팅
		mav.addObject("s_no", s_no);// 스토어 번호 세팅
		mav.setViewName("admin/adminStore/adminStoreProductAdd");
		return mav;

	}
	
	

	//제품 추가
	@RequestMapping(value = "/productAddOk", method = RequestMethod.POST)
	public ModelAndView productAdd(ProductVO vo, @RequestParam("s_no") int s_no, @RequestParam("o_value") String o_value,  HttpServletRequest req,
			@RequestParam(value = "mainImg") MultipartFile mainMf,
			@RequestParam(value = "img") List<MultipartFile> imgmf, HttpSession ses, @RequestParam("sub_c") String sub_c) {

		vo.setS_no(s_no); //스토어번호 저장 

		// 메인이미지 path
		String mainPath = ses.getServletContext().getRealPath("/")+"resources\\upload\\productMainImg\\"+vo.getS_no()+"\\";
		// 이미지 파일 path
		String imgPath = ses.getServletContext().getRealPath("/")+"resources\\upload\\productImg\\"+vo.getS_no()+"\\";

		// 메인이미지 업로드
		String mainFileName = mainMf.getOriginalFilename();

		vo.setMain_img(mainFileName); // vo에 이미지명 세팅

		try {
			mainMf.transferTo(new File(mainPath, mainFileName));
		} catch (IOException ie) {
			ie.getStackTrace();
		}

		// 이미지 업로드(다중)
		String imgFileName = "";
		String voImgName = "";

		for (MultipartFile mf : imgmf) {
			imgFileName = mf.getOriginalFilename();
			System.out.println("imgFileName : " + imgFileName);

			try {
				mf.transferTo(new File(imgPath, imgFileName));
				voImgName += imgFileName;
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		

		vo.setPd_img(voImgName); // vo에 이미지명 세팅
		
		if(sub_c.equals("소파/거실가구") || sub_c.equals("학생/서재가구") || sub_c.equals("침실가구") || sub_c.equals("주방가구") || sub_c.equals("테이블/의자/스툴")) {
			vo.setMain_c("가구");
		}else if(sub_c.equals("조명") || sub_c.equals("장식소품") || sub_c.equals("플라워/식물") || sub_c.equals("홈갤러리") || sub_c.equals("테월데코/장식")) {
			vo.setMain_c("홈데코");
		}else if(sub_c.equals("생활가전") || sub_c.equals("주방가전") || sub_c.equals("계절가전") || sub_c.equals("청소가전") || sub_c.equals("영상음향가전")) {
			vo.setMain_c("가전");
		}else if(sub_c.equals("수납장/서랍장") || sub_c.equals("리빙박스/수납함/바구니") || sub_c.equals("행거/옷걸이") || sub_c.equals("선반/거치대") || sub_c.equals("현관/신발정리")) {
			vo.setMain_c("수납");
		}else if(sub_c.equals("페인트/부자재") || sub_c.equals("벽지/시트지") || sub_c.equals("공구/접착제/보수용품") || sub_c.equals("손잡이/방문/유리") || sub_c.equals("타일/파벽돌")) {
			vo.setMain_c("DIY/공구");
		}else {
			vo.setMain_c("");
		}


		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		int result = dao.insertProduct(vo);
		

		ModelAndView mav = new ModelAndView();

		if (result > 0) {
			mav.setViewName("redirect:adminStoreDetail?s_no=" + vo.getS_no());
		} else {
			mav.addObject("msg", "상품 추가에 실패했습니다.");
			mav.setViewName("admin/result");
		}
		return mav;
	}

	
	//제품 수정 페이지로 이동
	@RequestMapping("/productEdit")
	public ModelAndView productEdit(@RequestParam("pd_no") int pd_no) {
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		ProductVO vo = dao.selectProduct(pd_no); //제품 정보 가져오기
		
		AdminStoreDaoImp cdao = sqlSession.getMapper(AdminStoreDaoImp.class);
		List<AdminStoreSubCategoryVO> subList = cdao.storeSubCategoryAll(); // 서브카테고리명 가져오기 
		
		/*String option = vo.getO_value();
		String opionlist[] = option.split(",");
		
		ArrayList<String> o_val = new ArrayList<String>();
		
		for(int i=0; i<optionlist.) {
			
		}*/
		ModelAndView mav = new ModelAndView();
		mav.addObject("subList", subList);// 서브카테고리명 세팅		
		mav.addObject("vo", vo); //제품 정보 세팅
		mav.addObject("optionOne", vo);//첫번째 옵션
		mav.setViewName("admin/adminStore/adminStoreProductEdit");
		
		return mav;
	}
	
	//제품 수정
	@RequestMapping("/productEditOk")
	public ModelAndView productEditOk(ProductVO vo, @RequestParam("sub_c") String sub_c ) {
		
		if(sub_c.equals("소파/거실가구") || sub_c.equals("학생/서재가구") || sub_c.equals("침실가구") || sub_c.equals("주방가구") || sub_c.equals("테이블/의자/스툴")) {
			vo.setMain_c("가구");
		}else if(sub_c.equals("조명") || sub_c.equals("장식소품") || sub_c.equals("플라워/식물") || sub_c.equals("홈갤러리") || sub_c.equals("테월데코/장식")) {
			vo.setMain_c("홈데코");
		}else if(sub_c.equals("생활가전") || sub_c.equals("주방가전") || sub_c.equals("계절가전") || sub_c.equals("청소가전") || sub_c.equals("영상음향가전")) {
			vo.setMain_c("가전");
		}else if(sub_c.equals("수납장/서랍장") || sub_c.equals("리빙박스/수납함/바구니") || sub_c.equals("행거/옷걸이") || sub_c.equals("선반/거치대") || sub_c.equals("현관/신발정리")) {
			vo.setMain_c("수납");
		}else if(sub_c.equals("페인트/부자재") || sub_c.equals("벽지/시트지") || sub_c.equals("공구/접착제/보수용품") || sub_c.equals("손잡이/방문/유리") || sub_c.equals("타일/파벽돌")) {
			vo.setMain_c("DIY/공구");
		}else {
			vo.setMain_c("");
		}

		
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		int result = dao.editProduct(vo);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:productEdit?pd_no="+vo.getPd_no()); //제품 정보 페이지로 이동
		}else {
			mav.setViewName("admin/result");
		}
		return mav;
	}
	
	
	//제품 삭제
	@RequestMapping("/productDel")
	public ModelAndView productDel(@RequestParam("pd_no") int pd_no,@RequestParam("s_no") int s_no) {
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		
		int result = dao.delProduct(pd_no);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:adminStoreDetail?s_no="+s_no); //제품 정보 페이지로 이동
		}else {
			mav.setViewName("admin/result");
		}
		return mav;
		
	}
}
