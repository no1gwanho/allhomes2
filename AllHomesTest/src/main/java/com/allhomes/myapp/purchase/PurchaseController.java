package com.allhomes.myapp.purchase;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PurchaseController {
	@Autowired 
	SqlSession sqlSession;
	 

}
