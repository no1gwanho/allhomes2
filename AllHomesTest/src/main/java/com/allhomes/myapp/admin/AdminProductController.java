package com.allhomes.myapp.admin;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.product.OptionDaoImp;
import com.allhomes.myapp.product.OptionVO;
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
			@RequestParam(value = "img") List<MultipartFile> imgmf, HttpSession ses) {

		vo.setS_no(s_no);

		// 메인이미지 path
		String mainPath = ses.getServletContext().getRealPath("upload/productMainImg/" + vo.getS_no() + "/");
		// 이미지 파일 path
		String imgPath = ses.getServletContext().getRealPath("upload/productImg/" + vo.getS_no() + "/");

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
				voImgName += imgFileName + ",";
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		vo.setPd_img(voImgName); // vo에 이미지명 세팅

		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		int result = dao.insertProduct(vo); //제품 추가 처리
		
		//옵션 처리 메소드 호출
		optionAdd(o_value);

		ModelAndView mav = new ModelAndView();

		if (result > 0) {
			mav.setViewName("redirect:adminStoreDetail?s_no=" + vo.getS_no());
		} else {
			mav.addObject("msg", "상품 추가에 실패했습니다.");
			mav.setViewName("admin/result");
		}
		return mav;
	}
	
	//옵션추가
	public void optionAdd(String o_value) {
		
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		OptionDaoImp oDao = sqlSession.getMapper(OptionDaoImp.class);
		OptionVO opVo = new OptionVO(); //옵션 VO
	
		ProductVO optionPd_no = dao.selectOptionProductNo();
		int pd_no = optionPd_no.getPd_no(); //가장 최근 insert된 제품의 제품번호값 가져옴
		
		opVo.setPd_no(pd_no);
		
		//옵션 처리(,으로 잘라서 배열 => 옵션 있는만큼 insert실행)
		String[] oList = o_value.split(",");
		for(int i=0; i<oList.length; i++) {
			opVo.setO_value(oList[i]);
			oDao.optionInsert(opVo);
		}
		
		//옵션 시퀀스 초기화
//		oDao.dropOptionSq();
//		oDao.createOptionSq();
		
		
	}
	
	//제품 수정 페이지로 이동
	@RequestMapping("/productEdit")
	public ModelAndView productEdit(@RequestParam("pd_no") int pd_no) {
		ProductDaoImp dao = sqlSession.getMapper(ProductDaoImp.class);
		ProductVO vo = dao.selectProduct(pd_no); //제품 정보 가져오기
		
		AdminStoreDaoImp cdao = sqlSession.getMapper(AdminStoreDaoImp.class);
		List<AdminStoreSubCategoryVO> subList = cdao.storeSubCategoryAll(); // 서브카테고리명 가져오기 
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("subList", subList);// 서브카테고리명 세팅		
		mav.addObject("vo", vo); //제품 정보 세팅
		mav.setViewName("admin/adminStore/adminStoreProductEdit");
		
		return mav;
	}
	
	//제품 수정
	@RequestMapping("/productEditOk")
	public ModelAndView productEditOk(ProductVO vo) {
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
