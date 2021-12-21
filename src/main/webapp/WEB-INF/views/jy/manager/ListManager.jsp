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


function fn_memRestore(mem_no){
	if(!confirm("복구하시겠습니까?")){
		return;
	}
	
	$.ajax({
		url:'${contextPath}/mng/restore',
        type:'post', //POST 방식으로 전달
        data:{"mem_no" : mem_no},
		dataType: "json",
        success:function(result){
        	console.log(result);
            if(result.code == "0"){
            	alert("복구되었습니다");
            	fn_redrawMemberList(result.memberList);
            	// 여기도 이해
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
            	fn_redrawMemberList(result.memberList);
            	// 여기도 이해
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


function fn_redrawMemberList(list){
	var table = $("#newTable");
	// 이건 #newTable에서 실행한다는 뜻?
	
	table.empty();
	table.append("<tr>");
	table.append("    <th>번호</th>");
	table.append("    <th>아이디</th>");
	table.append("    <th>이름</th>");
	table.append("    <th>전화번호</th>");
	table.append("    <th>이메일</th>");
	table.append("    <th>상태</th>");
	table.append("    <th>탈퇴</th>");
	table.append("    <th>복구</th>");
	table.append("</tr>");
	
	for(var i = 0; i < list.length; ++i){
		//<tr id="tr01">
		table.append("<tr id='tr"+list[i].mem_no+"'>");
		
		//	<td>01</td>
		var td = $("#tr" + list[i].mem_no);
		td.append("    <td>"+ list[i].mem_no +"</td>");
		td.append("    <td>"+ list[i].mem_id +"</td>");
		td.append('    <td><a href="${contextPath}/mng/detail?mem_no=' + list[i].mem_no + '">' + list[i].mem_name +"</a></td>");
		td.append("    <td>"+ list[i].mem_tel +"</td>");
		td.append("    <td>"+ list[i].mem_email +"</td>");
		td.append("    <td>"+ list[i].mem_delete +"</td>");
		td.append('    <td><button class="jybutton" onclick="javascript:fn_memDelete('+ list[i].mem_no +'); return false;">탈퇴</button></td>');
		td.append('    <td><button class="jybutton" onclick="javascript:fn_memRestore('+ list[i].mem_no +'); return false;">복구</button></td>');

		//<tr id="tr01">
		table.append("</tr>");
		
		
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
                        <h4>회원관리</h4>
                        <div class="breadcrumb__links">
                            <a href="${contextPath}/adminPageForm">AdminPage</a>
                            <span>회원관리</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
<%@ include file="/WEB-INF/views/jy/cm/managerSubMenu.jsp" %>
    
    
    
    <div class="container">
		<table class="orderTable" id="newTable">
			<thead class="orderThead">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>상태</th>
						<th>탈퇴</th>
						<th>복구</th>
					</tr>
				</thead>
				<c:forEach var="member" items="${memberList }">
					<tbody class="orderTbody">
						<tr>
							<td>${member.mem_no }</td>
							<td>${member.mem_id }</td>
							<td style="width:8%"><a href="${contextPath}/mng/detail?mem_no=${member.mem_no }"> ${member.mem_name }</a></td>
							<td>${member.mem_tel }</td>
							<td>${member.mem_email }</td>
							<td>${member.mem_delete }</td>
							<td><button class="jybutton" id="mem_delete" onclick="javascript:fn_memDelete(${member.mem_no }); return false;">삭제</button></td>
							<td><button class="jybutton" id="mem_restore" onclick="javascript:fn_memRestore(${member.mem_no }); return false;">복구</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
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