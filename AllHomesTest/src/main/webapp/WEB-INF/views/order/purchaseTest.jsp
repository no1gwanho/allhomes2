<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<br/><br/>
${vo.c_no}<br/>
${vo.a_code}<br/>
${vo.m_no}<br/>
${vo.total_p}<br/>
${vo.memo}<br/>
${vo.payment}<br/>

<hr/>

${pVO.itemName}<br/>
${pVO.total_p}<br/>
${pVO.method}<br/>
<br/>
${pVO.pd_name}
${pVO.price}
${pVO.num}
<br/>
${pVO.username}<br/>
${pVO.addr}<br/>
${pVO.tel}<br/>
${pVO.userid}<br/>
<c:set var="num"/>
