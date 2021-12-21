<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>
    
    <section>
    <div class="container">
    <div class="row">
    	<div class="col-lg-12 col-md-5">
	    	<div class="customer_service">
	    	<ul>
	    		<li><a href="${contextPath}/mng/list">회원정보 관리</a></li>
	    		<li><a href="${contextPath}/productTable">상품 관리</a></li>
	    		<li><a href="${contextPath}/order1ListManager">주문내역 관리</a></li>
	    		<li><a href="${contextPath}/adminFaqListAll">FAQ</a></li>
	    		<li><a href="${contextPath}/qnaAdminList">1:1문의</a></li>
	    		<li><a href="${contextPath}/noticeList">공지사항</a></li>
	    	</ul>
	    	</div>
    	</div>
    	
    	</div>
    	</div>
    </section>