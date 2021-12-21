<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>PIB MyPage</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="${contextPath}/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="${contextPath}/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="${contextPath}/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="${contextPath}/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="${contextPath}/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="${contextPath}/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="${contextPath}/css/style.css"
	type="text/css">
<link rel="stylesheet" href="${contextPath}/css/style_jy.css"
	type="text/css">

</head>

<script type="text/javascript">

	function onBtnButtonClick(){
		if($('#mem_id').val() == ""){
			alert("아이디를 입력해주세요");
			return;
		}
		if($('#mem_passwd').val() == ""){
			alert("비밀번호를 입력해주세요");
			return;
		}
		
		var param = { "mem_id"		: $('#mem_id').val()
					, "mem_passwd"	: $('#mem_passwd').val() };
		
		$.ajax({
			url:"${contextPath}/cm/Login",
				type : "POST",
				data : param,
				dataType : "json",
				success : function(data) {
					if (data == "0") {
						alert("로그인에 성공하였습니다. 메인페이지로 이동합니다.");
						$("#loginForm").submit();
					} else {
						alert("로그인에 실패하였습니다.\n아이디와 비밀번호를 확인해주세요.");
					}
				},
				error : function onError(error) {
					alert("로그인에 실패하였습니다.\n관리자에게 문의하세요.");
				}
			});
	}

</script>

<body style="background-color: #eaeaea;">
	<%@ include file="/WEB-INF/views/jy/cm/managerHeader.jsp"%>
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>공통페이지</h4>
						<div class="breadcrumb__links">
							<a href="${contextPath}/home">Home</a> 
							<span>commonPage ></span> 
							<span> 로그인</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">

<form id="loginForm" action="${contextPath}/home" method="post" >
		<div class="register" style="padding: 16px; background-color: white; width: 60%; margin: 3% auto;">
		   	<h3 style="width: 100%;	position: relative; border-bottom:2px solid black; padding:8px 0;">로그인</h3>
			<hr>			
			<label for="id"><b>아이디</b></label>
			<input class="input_login" type="text" name="mem_id" id="mem_id" required="required" placeholder="Enter ID" /> 
			<label for="pw"><b>비밀번호</b></label> 
			<input class="input_login" type="password" name="mem_passwd" id="mem_passwd" required="required" placeholder="Enter Password" />
		<div>
			<button onclick="javascript:onBtnButtonClick(); return false;" class="jybutton_login" style="margin-left: 44%; margin-top: 3%; margin-bottom:3%; ">로그인</button><br>
		</div>
		
		<div>
<%-- 			<input type="button" value="회원가입" onclick="location.href='<%=context%>/cm/register'"><br> --%>
<%-- 			<input type="button" value="ID/PW찾기" onclick="location.href='<%=context%>/cm/find'"> --%>
			<button onclick="location.href='${contextPath}/cm/register'" class="jybutton" style=" margin-left: 32%; ">회원가입</button>
			<button onclick="location.href='${contextPath}/cm/findIdForm'" class="jybutton">ID찾기</button>
			<button onclick="location.href='${contextPath}/cm/findpwForm'" class="jybutton">PW찾기</button>
		</div>
		</div>
	</form>
		</div>


	<%@ include file="/WEB-INF/views/jy/cm/managerFooter.jsp"%>


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
