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

<body>
    <%@ include file="/WEB-INF/views/jy/cm/managerHeader.jsp" %>


    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>회원페이지</h4>
                        <div class="breadcrumb__links">
                            <a href="${contextPath}/home">Home</a>
                            <span>userPage > </span>
                            <span> 회원 정보 수정</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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

	function validationCheck(){
		var pw = $('#pw').val();
		var pw2 = $('#pw2').val();
		
		var checkNum = pw.search(/[0-9]/g); // 숫자사용
		var checkEng = pw.search(/[a-z]/ig); // 영문사용
		
		// 비밀번호 입력
		if (pw == '') {
			alert("비밀번호를 입력해주세요.");
			$('#pw').focus();
			return false;
		}

		//중복확인
		if (pw != pw2) {
			alert("비밀번호가 일치하지 않습니다");
			$('#pw2').val('');
			$('#pw2').focus();
			return false;
		}


		 if(pw.length <= 7 || pw.length >= 15){
			alert('8~16자리를 사용해야 합니다.');
			$('#pw').focus();
			return false;

			}

//		if (!/^[a-zA-Z0-9]{8,16}$/.test(pw)) {
	//		alert('숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.');
		//	$('#pw').focus();
	//		return false;
	//	}



		// 숫자 영문 조합
		if (checkNum < 0 || checkEng < 0) {
			alert("숫자와 영문자를 조합하여야 합니다.");
			$('#pw').focus();
			return false;
		}
		
		
		//전화 번호 체크
		if($('#mem_tel').val() == ''){
			alert("전화번호는 필수값입니다.\n숫자만 입력해주세요.");
			$('#mem_tel').val('');
			$('#mem_tel').focus();
			return false;
		}
		
		
		$("#formUpdate").submit();
	}

	
</script>

<body>
	<h2 style="width: 50%;	position: relative;	left: 25%; border-bottom:2px solid black; padding:8px 0;">회원 정보 수정</h2>
	<form id="formUpdate" action="${contextPath}/user/update" method="post">
		<input type="hidden" name="mem_no" value="${member.mem_no }">

		<table class="updateTable">
			<tr>
				<th>이름</th>
				<td>${member.mem_name }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${member.mem_id }</td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pw" name="mem_passwd" required="required" value="${member.mem_passwd }"></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="password" id="pw2" required="required"></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><input type="text" name="mem_email" id="mem_email" required="required" value="${member.mem_email }"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="number" name="mem_tel" id="mem_tel" required="required" value="${member.mem_tel }"></td>
			</tr>

			<tr>
				<th>주소</th>
				<td>
				<input type="hidden" name="mem_address1" id="mem_address1" value="${member.mem_address1}"> 
				<pp id="divAddress1">${member.mem_address1}</pp>
				<button class="jybutton" onclick="sample6_execDaumPostcode()">우편번호 찾기</button><br> 
				<input type="hidden" name="mem_address2" id="mem_address2" value="${member.mem_address2}">
				<div id="divAddress2">${member.mem_address2}</div> 
				<input type="text" id="mem_address3" name="mem_address3" placeholder="상세주소" value="${member.mem_address3}">
				</td>
			</tr>
			<tr>
				<td colspan="2"><button class="jybutton" onclick="javascript:validationCheck(); return false;">확인</button></td>
			</tr>
		</table>
	</form>
	
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