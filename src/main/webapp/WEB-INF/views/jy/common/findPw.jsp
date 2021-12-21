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

	function fn_btnFindPwClick() {
		var formData = $('#findPw').serialize();

		$.ajax({
			url : '${contextPath}/cm/checkEmail',
			type : 'post', //POST 방식으로 전달
			data : formData,
			success : function(result) {
				if (result.code == "0") {
					var formData = $('#findPw').serialize();
					$.ajax({
						type : "POST",
						url : '${contextPath}/mail/Transport',
						data : formData,
						success : null,
						async : false

					})
					alert("임시비밀번호가 메일로 전송됐습니다. \n로그인페이지로 이동합니다.");
					window.location = "${contextPath}/cm/loginForm";

				} else if (result.code == "-1") {
					alert("잘못된 정보입니다 \n확인 후 다시 입력해주세요.");
					return;
				}
			},
			error : function() {
				alert("에러가 발생하였습니다. 관리자에게 문의하세요.");
			}
		});
	}
</script>

<body  style="background-color: #eaeaea;">
	<%@ include file="/WEB-INF/views/jy/cm/managerHeader.jsp"%>

	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>공통페이지</h4>
						<div class="breadcrumb__links">
							<a href="${contextPath}/home">Home</a> <span>commonPage >
							</span> <span> 비밀번호 찾기</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">

	<form id="findPw" style="margin: 5%">
			<div class="register" style="padding: 16px; background-color: white; width: 60%; margin: -10px auto; ">
	
	    	<h3 style="width: 100%;	position: relative; border-bottom:2px solid black; padding:8px 0;">비밀번호 찾기</h3>
			<hr>

			<label for="id"><b>아이디</b></label>
			<input class="input_find" type="text" name="mem_id" id="mem_id" required="required" placeholder="Enter ID" /> 
			<label for="name"><b>이름</b></label> 
			<input class="input_find" type="text" name="mem_name" id="mem_name" required="required" placeholder="Enter Name" />
			<label for="email"><b>이메일</b></label> 
			<input class="input_find" type="text" name="mem_email" id="mem_email" required="required" placeholder="Enter Email" />

			<hr>
			<p>
				you agree to our <a href="#">Terms & Privacy</a>.
			</p>
			
			<button class="jybutton" onclick="javascript:fn_btnFindPwClick(); return false;" style="margin-left: 40%">확인</button>
			<button onclick="location.href='${contextPath}/home'" class="jybutton">메인</button>
								

		</div>
	</form>	
	</div>
	<form id="goHome" action="${contextPath}/home" method="post"></form>



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
