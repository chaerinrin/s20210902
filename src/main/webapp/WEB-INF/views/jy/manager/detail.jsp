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

function fn_memDelete(mem_no){
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
	
	$.ajax({
		url:'${contextPath}/mng/delete',
        type:'post', //POST 방식으로 전달
        data:{"mem_no" : mem_no},	// 이 형식이 json 타입이니까 아랫줄의 dataType:"json"을 입력
		dataType: "json",
        success:function(result){
        	console.log(result);
            if(result.code == "0"){
            	alert("탈퇴되었습니다");
                window.location = "${contextPath}/mng/list";

            	return;
            }else if (result.code == "-1"){
	            alert("에러가 발생하였습니다. 관리자에게 문의하세요.1");
            	return;
            }
        },
        error:function(){
            alert("에러가 발생하였습니다. 관리자에게 문의하세요.2");
        }
    });
}

</script>

<body>
<%@ include file="/WEB-INF/views/jy/cm/managerHeader.jsp" %>

    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>관리자페이지</h4>
                        <div class="breadcrumb__links">
                            <a href="${contextPath}/home">Home</a>
                            <span>adminPage > </span>
                            <span> 회원목록 > 회원상세</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
<%@ include file="/WEB-INF/views/jy/cm/managerSubMenu.jsp" %>
    

<div>
	<h2 style="width: 50%;	position: relative;	left: 25%; border-bottom:2px solid black; padding:8px 0;">
	회원 상세 정보</h2>
	<table id="userdetail" class="detailTable" >
		<tr>
			<th>번호</th>
			<td>${member.mem_no }</td>
		</tr>
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
			<th>탈퇴</th>
			<td><pp>${member.mem_delete }</pp>
		</tr>
		<tr>
			<td colspan="2">
			<button class="jybutton" onclick="location.href='${contextPath}/mng/list'" style="margin-left: 38.5%;">목록</button> 
			<button class="jybutton" onclick="location.href='${contextPath}/mng/updateForm?mem_no=${member.mem_no}'">수정</button>
			<button class="jybutton" onclick="javascript:fn_memDelete(${member.mem_no }); return false;" >탈퇴</button>
			</td>
		</tr>
	</table>
</div>
	
	
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