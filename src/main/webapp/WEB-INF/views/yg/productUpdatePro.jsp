<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${a > 0 }">
	<script type="text/javascript">
		alert("상품이 수정 되었습니다.");
		location.href="productContent?p_code=${p_code}&p_size=${p_size}";
	</script>
	</c:if >
	<c:if test="${a == 0}">
		<script type="text/javascript">
			alert("상품 수정에 실패하였습니다.");
			location.href="productContent?p_code=${p_code}&p_size=${p_size}";
			</script>
		</c:if>
</body>
</html>