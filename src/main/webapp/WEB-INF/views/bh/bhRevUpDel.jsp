<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<%
	String context = request.getContextPath();
%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
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
<title>PIB 리뷰 수정</title>
<script type="text/javascript"></script>
</head>
<body>
<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                		
                    </div>
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
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header><p>

<section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>리뷰 수정페이지</h4>
                        <div class="breadcrumb__links">
                            <a href="bhDetail">Product Detail</a>
                            <span>Review Update</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section><p>
<form action="bhRevU" method="post" enctype="multipart/form-data">
<div class="row d-flex justify-content-center">
	평점 : &nbsp;
	<input type="radio" name="r_score" value="1" required="required" <c:if test="${review.r_score == 1}"> checked</c:if>> &nbsp;
	<input type="radio" name="r_score" value="2" required="required" <c:if test="${review.r_score == 2}"> checked</c:if>> &nbsp;
	<input type="radio" name="r_score" value="3" required="required" <c:if test="${review.r_score == 3}"> checked</c:if>> &nbsp;
	<input type="radio" name="r_score" value="4" required="required" <c:if test="${review.r_score == 4}"> checked</c:if>> &nbsp;
	<input type="radio" name="r_score" value="5" required="required" <c:if test="${review.r_score == 5}"> checked</c:if>>
</div><p>
	<div class="row d-flex justify-content-center">
		<div class="contact__form">
			
				<input type="hidden" value="${review.p_code}" name="p_code">
				<input type="hidden" value="${review.p_size}" name="p_size">
				<div class="row">
					<div class="col-lg-12">
						<textarea placeholder="수정할 내용 작성..." rows="5" name="r_content" required="required" onclick="getProCheck(${product.p_code },'${mem_id }')">${review.r_content }</textarea>
						<p><p>
							<input type="hidden" name="r_img" value="${review.r_img}">
							<input type="file" name="file1">
							<c:if test="${review.r_img != null}">
								<img alt="${review.r_img }" src="${review.r_img }" width="100px" height="100px">
							</c:if>
						<p>
							<input type="submit" class="w3-button w3-round w3-black" value="수정 완료">
					</div>
				</div>
			
			<input type="button" value="수정  취소" class="w3-button w3-round w3-black" onclick="history.go(-1);">
		</div>
	</div><p>
	</form>

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
                        <p>Motivated and inspired by the Hollywood blockbuster movie Men In Black, 
							the goal of our company is to provide simplicity and equality to each and every one of our customers.
							Our website was made by Group2 who were first assembled in "Choongang Institute".</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="footer__copyright__text">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <p>Copyright ©
                        <script>
                            document.write(new Date().getFullYear());
                        </script>2020
                        All rights reserved | This template is made with <i class="fa fa-heart-o"
                        aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
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