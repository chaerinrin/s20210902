<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<%
   String context = request.getContextPath();
%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>PIB 상품 상세</title>
<script type="text/javascript" src="js/jquery1.js"></script>
<script src="js/wishListAjax.js"></script>


<script type="text/javascript">
   var contextPath='${pageContext.request.contextPath}';
   var src='${pageContext.request.contextPath}/images/';
   var contextPath='${pageContext.request.contextPath}';

   
   function getProCheck(vProd_code, vMem_id){
		   $.ajax({
		         url:"<%=context%>/getProCheck",  
		         data:{p_code : vProd_code, mem_id : vMem_id}, 
		         dataType:'json',
		         beforeSend : function(httpRequest){
						httpRequest.setRequestHeader("AJAX", "true");
				 },
		         success:function(data){
		            if(data == 0) {
		                 alert("상품을 구매 하지 않았어요~");
		            }else {
		                 $(data).each(function() {
		                    location.href="bhReviewForm?p_code="+this.p_code+"&p_size="+this.p_size;
		                 });
		            }
		         },
		         error : function onError (error){
						if(error.status == 400){
							alert("로그인 후 이용 가능합니다.");
							location.href="cm/loginForm";
						}else{
							alert("리뷰를 작성할 수 없습니다.\n관리자에게 문의하세요.");
						}
				}
		  });
	   
    }
 </script>
</head>
<body>
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-7"></div>
					<div class="col-lg-6 col-md-5">
						<div class="header__top__right">
							<div class="header__top__links">
								<c:choose>
									<c:when test="${mem_id == null }">
										<a href="cm/register">회원가입</a>
										<a href="cm/loginForm">로그인</a>
									</c:when>
									<c:when test="${mem_id != null && mem_admin == 0}">
										<span style="color: white; padding-right: 20px;">${mem_id }님</span>
										<a href="cm/logout">로그아웃</a>
										<a href="myPageForm">마이페이지</a>
									</c:when>
									<c:when test="${mem_admin == 1 }">
										<span style="color: white; padding-right: 20px;">${mem_id }님</span>
										<a href="cm/logout">로그아웃</a>
										<a href="adminPageForm">관리자페이지</a>
									</c:when>
								</c:choose>
								<a href="faqListAll">고객센터</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="header__logo">
						<a href="home"><img src="img/PIB_logo.png" alt="" width="120px" height="50px"></a>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<nav class="header__menu mobile-menu">
						<ul>
							<li><a href="bhPro">All</a></li>
							<li><a href="bhProT">Tops</a></li>
							<li><a href="bhProB">Trousers</a></li>
							<li><a href="bhProA">Accessories</a></li>
							<li><a href="bhProS">Shoes</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="header__nav__option">
						<!-- 수정 (메인 화면 검색) 21.12.13. -->
                        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                        <!-- 수정 끝 -->
                        <a href="wishList"><img src="img/icon/heart.png" alt=""></a>
                        <a href="cartList"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                        <!-- 추가 (최근 본 상품 검색) 21.12.13. -->
                        <a href="latestProductList"><img src="img/icon/time.png" width="19px" height="19px" alt="최근 본 상품"></a>
                        <!-- <div>아이콘 제작자 <a href="" title="SumberRejeki">SumberRejeki</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></div> -->
						<!-- 추가 끝 -->
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header><p>

	<section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>상품 상세페이지</h4>
                        <div class="breadcrumb__links">
                            <a href="bhPro">Shop</a>
                            <span>Product Detail</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<form action="cartInsert" method="post">
		<input type="hidden" name="p_code" value="${product.p_code }">
		<div class="product__details__content">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<input type="image" src="${product.p_img }" style="width: 600px; height: 600px;">
					<div class="col-lg-8">
						<div class="product__details__text">
							<h3>${product.p_name }</h3>
							<h4>${product.p_price }원</h4>
							<p>This product is designed, made and sold only by PIB.</p>
							<div class="product__details__cart__option">
								<div class="product__details__option__size">
									<label for="1">S<input type="radio" id="1" name="p_size" value="110" required="required"></label> 
									<label for="2">M<input type="radio" id="2" name="p_size" value="120" required="required"></label> 
									<label for="3">L<input type="radio" id="3" name="p_size" value="130" required="required"></label>
								</div>
								<div class="quantity">
									<div class="c_qty">
										<input type='number' min="0" name="c_qty" required="required"/>
									</div>
								</div>&emsp;
								<input type="button" onclick="javascript:wishInsert(${product.p_code});" class="w3-button w3-round w3-black" value="add to wishlist" >
								<input type="submit" class="w3-button w3-round w3-black" value="add to cart">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	
	<form action="bhReviewForm">
		<div class="product__details__content">
			<div class="container">
			
				<div class="row d-flex justify-content-center">
					<input type="hidden" value="${product.p_code }" name="p_code">	
					<input type="button" class="w3-button w3-round w3-black" onclick="getProCheck(${product.p_code },'${mem_id }')" value="리뷰 작성하기">
					
					<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
					<br>
					<br>
					<table class="w3-table-all">
						<tr>
							<th>아이디</th>
							<th>사진</th>
							<th>리뷰내용</th>
							<th>평점</th>
							<th class="w3-right-align"></th>
						</tr>
						<c:if test="${total == 0 }">
							<tr>
								<td colspan="5">상품에 대한 리뷰가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${total > 0 }">
							<c:forEach var="review" items="${listRev}">
								<tr>
									<c:if test="${review.mem_admin == 1 }">
										<td>관리자</td>
									</c:if>
									<c:if test="${review.mem_admin == 0 }">
										<td>${review.mem_id}</td>
									</c:if>
									<td>
										<input type="hidden" value="${review.r_img }" name="r_img">	
										<c:if test="${review.r_img != null}">
											<input type="image" src="${review.r_img }" style="width: 100px; height: 100px;">
										</c:if>
									</td>
									<td>${review.r_content}</td>
									<td>${review.r_score}</td>
									<td colspan="2" class="w3-right-align"><c:choose>
											<c:when
												test="${review.mem_id.equals(mem_id) && mem_admin == 0}">
												<input type="button" class="w3-button w3-round" value="수정" onclick="location.href='bhUpdateForm?p_code=${review.p_code}&p_size=${review.p_size}'">
												<input type="button" class="w3-button w3-round" value="삭제" onclick="location.href='bhRevD?p_code=${review.p_code}&p_size=${review.p_size}&r_img=${review.r_img }'">
											</c:when>
											<c:when test="${mem_admin == 1}">
												<c:if test="${review.mem_admin == 0}">
													<input type="button" class="w3-button w3-round" value="관리자댓글" onclick="location.href='dhReviewForm?p_code=${review.p_code}&p_size=${review.p_size}&r_num=${review.r_num }'">
												</c:if>
												<input type="button" class="w3-button w3-round" value="삭제" onclick="location.href='dhReviewDelete?p_code=${review.p_code}&p_size=${review.p_size}&r_num=${review.r_num }'">
											</c:when>
										</c:choose>
									</td>
								</tr>
								<c:set var="num" value="${num - 1 }"></c:set>
							</c:forEach>
						</c:if>
					</table>
					<div class="row">
						<div class="col-lg-12">
							<div class="product__pagination">
								<c:if test="${pg.startPage > pg.pageBlock }">
									<a href="bhDetail?p_code=${product.p_code }&currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
								</c:if>
								<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
									<a href="bhDetail?p_code=${product.p_code }&currentPage=${i}" class="<c:if test="${pg.currentPage == i }">active</c:if>">${i}</a>
								</c:forEach>
								<c:if test="${pg.endPage < pg.totalPage }">
									<a href="bhDetail?p_code=${product.p_code }&currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form><p>


	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="home"><img src="img/PIB_logo_white1.png" alt=""></a>
						</div>
						<p>Providing Incomparable Beauty</p>
						<img src="img/payment.png" alt="">
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
					<div class="footer__widget">
						<h6>Shopping</h6>
						<ul>
							<li><a href="bhPro">All</a></li>
							<li><a href="bhProT">Top</a></li>
							<li><a href="bhProB">Trousers</a></li>
							<li><a href="bhProA">Accessories</a></li>
							<li><a href="bhProS">Shoes</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="footer__widget">
						<h6>Service Center</h6>
						<ul>
							<li><a href="faqListAll">FAQ</a></li>
							<li><a href="noticeList">NOTICE</a></li>

						</ul>
					</div>
				</div>
				<div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
					<div class="footer__widget">
						<h6>PIB - People In Black</h6>
						<div class="footer__newslatter">
							<p>Motivated and inspired by the Hollywood blockbuster movie
								Men In Black, the goal of our company is to provide simplicity
								and equality to each and every one of our customers. Our website
								was made by Group2 who were first assembled in "Choongang
								Institute".</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="footer__copyright__text">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<p>
							Copyright ©
							<script>
                            document.write(new Date().getFullYear());
                        </script>
							2020 All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
						</p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

<!-- 수정 (메인 화면 검색)  21.12.13. -->
<!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form action="proSearch" class="search-model-form">
                <input type="search" name="keyword" id="search-input" placeholder="Search here....." required="required">
            </form>
        </div>
    </div>
<!-- Search End -->
<!-- 수정 끝 -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>