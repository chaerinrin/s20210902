<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PIB MyPage</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/style.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/style_jy.css" type="text/css">
 
</head>

<script type="text/javascript">
function fn_delete(memNo){
	if(confirm("탈퇴하시겠습니까?\n탈퇴 후에는 복구가 불가합니다.")) {
		alert("탈퇴 후 메인페이지로 이동됩니다.");
		location.href="${contextPath}/user/delete?mem_no="+memNo;
	}
}


</script>

<body>
<%@ include file="/WEB-INF/views/jy/cm/managerHeader.jsp" %>

    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>나의 정보 수정</h4>
                        <div class="breadcrumb__links">
                            <a href="${contextPath}/myPageForm">MyPage</a>
                            <span>나의 정보 수정</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <br>
    <Br>

<div>
	<h3 style="width: 50%;	position: relative;	left: 25%; border-bottom:2px solid black; padding:8px 0;">
	회원 상세 정보</h3>
	<table id="userdetail" class="detailTable" >
		<tr>
			<th>아이디</th>
			<td>${member.mem_id }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
				<td>${member.mem_passwd }</td>
		</tr>
		<tr>
			<th>이름</th>
				<td>${member.mem_name }</td>
		</tr>
		<tr>
			<th>전화번호</th>
				<td>${member.mem_tel }</td>
		</tr>
		<tr>
			<th>이메일</th>
				<td>${member.mem_email }</td>
		</tr>
		<tr>
			<th>주소</th>
				<td>${member.mem_address1 }<br>
					${member.mem_address2 }<br>
					${member.mem_address3 }</td>
		</tr>
		<tr>
			<td colspan="2">
			<button class="jybutton" onclick="location.href='${contextPath}/home'" style="margin-left: 38%;">메인</button>
			<button class="jybutton" onclick="location.href='${contextPath}/user/updateForm?mem_no=${member.mem_no}'">수정</button>
			<button class="jybutton" onclick="javascript:fn_delete(${member.mem_no}); return false;" >탈퇴</button>
			</td>
		</tr>
	</table>
</div>
	<Br>
	<br>
	
<%@ include file="/WEB-INF/views/jy/cm/managerFooter.jsp" %>


    <!-- Js Plugins -->
    <script src="${contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${contextPath}/js/bootstrap.min.js"></script>
    <script src="${contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${contextPath}/js/jquery.nicescroll.min.js"></script>
    <script src="${contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${contextPath}/js/jquery.countdown.min.js"></script>
    <script src="${contextPath}/js/jquery.slicknav.js"></script>
    <script src="${contextPath}/js/mixitup.min.js"></script>
    <script src="${contextPath}/js/owl.carousel.min.js"></script>
    <script src="${contextPath}/js/main.js"></script>

</body>

</html> 