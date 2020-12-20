package com.allhomes.myapp.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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

import com.allhomes.myapp.product.ProductDaoImp;
import com.allhomes.myapp.product.ProductVO;
import com.allhomes.myapp.store.StoreDaoImp;
import com.allhomes.myapp.store.StoreDetailSearchVO;
import com.allhomes.myapp.store.StoreVO;
@Controller
public class AdminStoreController {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// ===========store category=======================

	// 스트어-메인카테고리 추가
	@RequestMapping(value = "/mainCategoryAdd", method = RequestMethod.POST)
	public ModelAndView StoreCategoryInsert(AdminStoreCategoryVO vo, HttpServletRequest req,
			@RequestParam(value = "file") MultipartFile mf, HttpSession ses) {

		// file upload
		String path = ses.getServletContext().getRealPath("/")+"resources\\upload\\storeMainCategoryImg\\";// 파일 저장할 위치
		String originFileName = mf.getOriginalFilename(); // 파일 이름

		vo.setImg(originFileName); // 경로+이름 => img컬럼에 세팅

		// 파일 업로드
		try {
			mf.transferTo(new File(path+"/"+originFileName));
		} catch (IOException ie) {
			ie.getStackTrace();
		}

		// insert 작업
		AdminStoreDaoImp dao = sqlSession.getMapper(AdminStoreDaoImp.class);
		int result = dao.storeCategoryInsert(vo); // insert
		ModelAndView mav = new ModelAndView();

		if (result > 0) { // insert 성공
			mav.setViewName("redirect:adminCategory");
		} else {// 실패
			mav.addObject("msg", "카테고리 추가에 실패했습니다.");
			mav.setViewName("admin/result");
		}
		return mav;
	}

	// 스토어-카테고리 전체 불러오기(메인, 서브)
	@RequestMapping("/adminCategory")
	public ModelAndView storeCategoryAll() {
		AdminStoreDaoImp dao = sqlSession.getMapper(AdminStoreDaoImp.class);
		List<AdminStoreCategoryVO> list = dao.storeCategoryAll(); // 메인카테고리
		List<AdminStoreSubCategoryVO> subList = dao.storeSubCategoryAll(); // 서브카테고리
		List<String> mainList = dao.storeMainCategoryName(); // 메인카테고리 이름

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("subList", subList);
		mav.addObject("mainList", mainList);

		mav.setViewName("admin/adminStore/adminStoreCategory");
		return mav;
	}

	// 스토어-서브카테고리 추가
	@RequestMapping("/adminSubCategoryAdd")
	public ModelAndView subCategoryAdd(String main_c, String sub_c) {

		AdminStoreSubCategoryVO vo = new AdminStoreSubCategoryVO();
		vo.setMain_c(main_c);
		vo.setSub_c(sub_c);

		AdminStoreDaoImp dao = sqlSession.getMapper(AdminStoreDaoImp.class);

		dao.storeSubCategoryInsert(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:adminCategory");
		return mav;
	}

	// 스토어-서브카테고리 삭제
	@RequestMapping("/adminSubCategoryDel")
	public String subCategoryDel(String sub_c) {
		AdminStoreDaoImp dao = sqlSession.getMapper(AdminStoreDaoImp.class);

		 dao.storeSubCategoryDel(sub_c);
		return "redirect:adminCategory";
	}

	// 스토어-메인카테고리 삭제
	@RequestMapping("/adminMainCategoryDel")
	public ModelAndView mainCategoryDel(@RequestParam("no") int no) {
		AdminStoreDaoImp dao = sqlSession.getMapper(AdminStoreDaoImp.class);

		ModelAndView mav = new ModelAndView();
		int result = dao.storeMainCategoryDel(no);
		
		mav.setViewName("redirect:adminCategory");
		return mav;
	}

	// 스트어-메인카테고리 추가
		@RequestMapping(value = "/mainCategoryUpdate", method = RequestMethod.POST)
		public ModelAndView StoreCategoryUpdate(AdminStoreCategoryVO vo
				) {

			
			AdminStoreDaoImp dao = sqlSession.getMapper(AdminStoreDaoImp.class);
			int result = dao.storeCategoryUpdate(vo); // insert
			ModelAndView mav = new ModelAndView();

			if (result > 0) { // insert 성공
				mav.setViewName("redirect:adminCategory");
			} else {// 실패
				mav.addObject("msg", "카테고리 수정에 실패했습니다.");
				mav.setViewName("admin/result");
			}
			return mav;
		}
	
	// 스토어관리-스토어 페이지로 이동
	@RequestMapping("/adminStore")
	public ModelAndView adminStore(AdminPagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {

		AdminStoreDaoImp dao = sqlSession.getMapper(AdminStoreDaoImp.class);
		
		//paging//
		int total = dao.storeCount(); //총 스토어 수
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "15";
		}
		vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//paging//
		
		
		ModelAndView mav = new ModelAndView();
		
		//paging
		mav.addObject("paging", vo);
		mav.addObject("viewAll", dao.storeAll(vo));
		mav.setViewName("admin/adminStore/adminStoreStore");
		mav.addObject("value", "");
		mav.addObject("key", "");
		return mav;
	}

	// 스토어관리-스토어 상세 보기로 이동
	@RequestMapping("/adminStoreDetail")
	public ModelAndView storeDetail(@RequestParam("s_no") int s_no) {

		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		ProductDaoImp pDao = sqlSession.getMapper(ProductDaoImp.class);
		StoreVO vo = dao.storeSelect(s_no);

		// 스토어의 제품 가지고 오기
		List<ProductVO> pVo = pDao.selectStoreProduct(s_no);

		// 스토어의 총 제품수 가지고 오기
		int cntPd = pDao.countProduct(s_no);
		
		//스토어의 누적 판매 가지고 오기
		int purPd = dao.countPurchase(s_no);

		ModelAndView mav = new ModelAndView();

		mav.addObject("vo", vo); // 스토어 정보
		mav.addObject("pVo", pVo); // 제품 정보
		mav.addObject("cntPd", cntPd); // 제품 개수
		mav.addObject("cntPur", purPd); //누적판매량
		mav.addObject("order", "");
		mav.setViewName("admin/adminStore/adminStoreStoreDetail");
		return mav;
	}
	@RequestMapping("/adminPdOrder")
	public ModelAndView storePdOrder(@RequestParam("order") String order, @RequestParam("s_no") int s_no) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		ProductDaoImp pDao = sqlSession.getMapper(ProductDaoImp.class);
		StoreVO vo = dao.storeSelect(s_no);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("s_no", s_no);
		map.put("order", order);
		
		// 스토어의 제품 가지고 오기
		List<ProductVO> pVo = pDao.selectStoreProductOrder(map);

		// 스토어의 총 제품수 가지고 오기
		int cntPd = pDao.countProduct(s_no);
		
		//스토어의 누적 판매 가지고 오기
		int purPd = dao.countPurchase(s_no);

		ModelAndView mav = new ModelAndView();

		mav.addObject("vo", vo); // 스토어 정보
		mav.addObject("pVo", pVo); // 제품 정보
		mav.addObject("cntPd", cntPd); // 제품 개수
		mav.addObject("cntPur", purPd); //누적판매량
		mav.addObject("order", order);
		mav.setViewName("admin/adminStore/adminStoreStoreDetail");
		return mav;
	}

	// 스토어-스토어 추가 페이지로 이동
	@RequestMapping("/storeAdd")
	public String StoreAdd() {
		return "admin/adminStore/adminStoreStoreAdd";
	}

	// 스토어 추가
	@RequestMapping(value = "/storeAddOk", method = RequestMethod.POST)
	public ModelAndView storeAdd(StoreVO vo, HttpServletRequest req, @RequestParam(value = "file") MultipartFile mf,
			HttpSession ses) {

		// file upload
		String path = ses.getServletContext().getRealPath("/")+"resources\\upload\\storeImg\\";// 파일 저장할 위치
		String originFileName = mf.getOriginalFilename(); // 파일 이름
		
		UUID uuid = UUID.randomUUID(); //중복 방지 위해 UUID 더하기 
		String filename = uuid + "_" + originFileName;
		
		if(mf.isEmpty()) { //파일 추가 안했을 때는 기본 파일로
			System.out.println("파일 없음~~~");
			//기본 이미지 나오게하기
			vo.setS_pic("store_basic.png");
		}else {
			vo.setS_pic(filename); // 이름 => img컬럼에 세팅			
		}
		

		// 파일 업로드
		try {
			
			mf.transferTo(new File(path+"/"+filename));
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		int result = dao.storeAdd(vo);
		ModelAndView mav = new ModelAndView();

		if (result > 0) { // insert 성공
			mav.setViewName("redirect:adminStore");
		} else {// 실패
			mav.addObject("msg", "스토어 추가에 실패했습니다.");
			mav.setViewName("admin/result");
		}
		return mav;
	}

	// 스토어삭제
	@RequestMapping("/storeDel")
	public ModelAndView storeDel(@RequestParam("s_no") int s_no) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		int result = dao.storeDel(s_no);

		ModelAndView mav = new ModelAndView();

		if (result > 0) { // 삭제 성공
			mav.setViewName("redirect:adminStore"); // 스토어 메인페이지로
		} else {
			mav.addObject("msg", "스토어 삭제에 실패했습니다.");
			mav.setViewName("admin/result");
		}

		return mav;
	}

	// 스토어 수정 페이지로 이동
	@RequestMapping("/storeEdit")
	public ModelAndView storeEdit(@RequestParam("s_no") int s_no) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		StoreVO vo = dao.storeSelect(s_no);

		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("admin/adminStore/adminStoreStoreEdit");

		return mav;
	}

	// 스토어 수정
	@RequestMapping(value = "/storeEditOk", method = RequestMethod.POST)
	public ModelAndView storeEditOk(StoreVO vo) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		int result = dao.storeEdit(vo);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:adminStoreDetail?s_no="+vo.getS_no());
		return mav;

	}
	
	//=======================스토어 검색===================================
	//선택검색
	@RequestMapping("/adminStoreSearch")
	public ModelAndView adminStoreSearch(@RequestParam("key") String key, @RequestParam("value") String value
			,AdminPagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		
		AdminStoreDaoImp dao = sqlSession.getMapper(AdminStoreDaoImp.class);
		
		HashMap<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("value", value);
		countMap.put("key", key);
		
		
		//paging//
		int total = dao.adminStoreSearchCount(countMap); //검색한 거의 총 개수
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "15";
		}
				
				
		vo = new AdminPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//paging
				
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("paging", vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("value", value);
		map.put("key", key);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		mav.addObject("viewAll", dao.adminStoreSearch(map));
		
		mav.setViewName("admin/adminStore/adminStoreStore");
		mav.addObject("value", value);
		mav.addObject("key", key);
		return mav;
	}
	
	//상세검색
	@RequestMapping(value="/adminStoreDetailSearch", method = RequestMethod.POST)
	public ModelAndView adminStoreDetailSearch(StoreDetailSearchVO vo) {
		ModelAndView mav = new ModelAndView();
		
		AdminStoreDaoImp dao = sqlSession.getMapper(AdminStoreDaoImp.class);
		List<StoreVO> list = dao.adminStoreDetailSearch(vo);
		
		System.out.println("아이디="+vo.getS_id()+"s_name="+vo.getS_name()+"staff_e="+vo.getStaff_e()+"staff_n"+vo.getStaff_n()+"staff_t"+vo.getStaff_t());
		
		
		mav.addObject("viewAll", list);
		mav.setViewName("admin/adminStore/adminStoreStore");
		
		return mav;
		
	}
	 
}
