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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	window.onload = function() {
		$('#mem_passwd2').blur(function() {
			if ($('#mem_passwd').val() != $('#mem_passwd2').val()) {
				if ($('#mem_passwd2').val() != '') {
					alert("비밀번호가 일치하지 않습니다");
					$('#mem_passwd2').val('');
					$('#mem_passwd2').focus();
				}
			}
		})
	};

	function fn_btnInsertClick() {
		$.ajax({
			//url:'register1', //Controller에서 인식할 주소
			url : '${contextPath}/cm/checkId',
			type : 'post', //POST 방식으로 전달
			data : {
				"mem_id" : $('#mem_id').val()
			},
			success : function(result) {
				if (result == "0") {
					//response.sendRedirect("memberList");
					if (confirm("사용가능한 아이디 입니다.\n사용하시겠습니까?")) {
						$('#mem_id').attr("idCheck", "1");
						$('#mem_id').attr("readonly", true);
					}
					;
				} else if (result == "-1") {
					alert("중복 된 id 입니다.\n다시 입력해주세요.");
					$("#mem_id").focus();
					return;
				}
			},
			error : function() {
				alert("회원가입 중 에러가 발생하였습니다. 관리자에게 문의하세요.");
				//여긴 ajax자체 통신문제.
			}
		});
	}

	function fn_btnRegisterClick() {
		if ($('#mem_id').attr("idCheck") != "1") {
			alert("중복체크를 해주세요");
			return false;
		}

		var formData = $('#registerForm').serialize();
		//console.log(formData);
		$.ajax({
			url : '${contextPath}/cm/register1', //Controller에서 인식할 주소
			type : 'post', //POST 방식으로 전달
			data : formData,
			success : function(result) {
				if (result == "0") {
					alert("회원가입이 완료되었습니다.");
					$("#goList").submit();
				} else if (result == "-1") {
					alert("회원가입 중 에러가 발생하였습니다. 관리자에게 문의하세요.");
					return;
				}
			},
			error : function() {
				alert("회원가입 중 에러가 발생하였습니다. 관리자에게 문의하세요.");
				return;
				//여긴 ajax자체 통신문제.
			}
		});

	}

	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					// document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					// document.getElementById("sample6_extraAddress").value = '';
					extraAddr = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("#mem_address1").val(data.zonecode);
				$("#mem_address2").val(addr + extraAddr);

				$("#divAddress1").text(data.zonecode);
				$("#divAddress2").text(addr + extraAddr);
				$("#mem_address3").focus();

			}
		}).open();
	}
</script>
<body style="font-family: Arial, Helvetica, sans-serif; background-color: #eaeaea;">
	<%@ include file="/WEB-INF/views/jy/cm/managerHeader.jsp"%>

	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>공통페이지</h4>
						<div class="breadcrumb__links">
							<a href="${contextPath}/home">Home</a> <span>commonPage >
							</span> <span> 회원가입</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br><br>
	<div class="container">
	<form id="registerForm">
		<div class="register" style="padding: 16px; background-color: white;  width: 60%; margin: -10px auto; ">
		    	<h3 style="width: 100%;	position: relative; border-bottom:2px solid black; padding:8px 0;">회원가입</h3>
		
			<hr>

			<label for="id"><b>아이디</b></label>
			<button class="jybutton" onclick="javascript:fn_btnInsertClick(); return false;">중복확인</button>
			<input type="text" name="mem_id" id="mem_id" required="required" placeholder="Enter ID" /> 
			<label for="pw"><b>비밀번호</b></label> 
			<input type="password" name="mem_passwd" id="mem_passwd" required="required" placeholder="Enter Password" />
			<label for="pw2"><b>비밀번호 확인</b></label> 
			<input type="password" name="mem_passwd2" id="mem_passwd2" required="required" placeholder="Confirm Password" />
			<label for="name"><b>이름</b></label> 
			<input type="text" name="mem_name" id="mem_name" required="required" placeholder="Enter Name" />
			<label for="email"><b>이메일</b></label> 
			<input type="text" name="mem_email" id="mem_email" required="required" placeholder="Enter Email" />
			<label for="addr"><b>주소</b></label> 
			<button class="jybutton" onclick="sample6_execDaumPostcode()">우편번호 찾기</button><br>
			<input type="hidden" name="mem_address1" id="mem_address1" value="${member.mem_address1}">
			<pp id="divAddress1">${member.mem_address1}</pp>
			<input type="hidden" name="mem_address2" id="mem_address2" value="${member.mem_address2}">
			<div id="divAddress2">${member.mem_address2}</div>
			<input type="text" id="mem_address3" name="mem_address3" placeholder="상세주소" value="${member.mem_address3}"> 
			<label for="phone"><b>전화번호</b></label> 
			<input type="text" name="mem_tel" id="mem_tel" required="required" placeholder="전화번호" />

			<hr>
			<p>
				By creating an account you agree to our <a href="#">Terms &
					Privacy</a>.
			</p>

			<button class="jybutton_login_sub" onclick="javascript:fn_btnRegisterClick(); return false;">회원가입</button>
		</div>


	</form>
	<form id="goList" action="${contextPath}/home" method="post"></form>
	</div>
	<Br><br>
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
