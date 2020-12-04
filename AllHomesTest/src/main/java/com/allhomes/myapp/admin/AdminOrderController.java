package com.allhomes.myapp.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allhomes.myapp.purchase.PurchaseVO;

@Controller
public class AdminOrderController {
	
	SqlSession sqlSession;
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	// 스토어-주문내역 페이지로 이동
	@RequestMapping("/adminStoreOrder")
	public ModelAndView StoreOrder() {
		
		AdminOrderDaoImp dao = sqlSession.getMapper(AdminOrderDaoImp.class);
		List<AdminOrderVO> list = dao.allPurchase();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("admin/adminStore/adminStoreOrder");
		return mav;
	}

	
}
