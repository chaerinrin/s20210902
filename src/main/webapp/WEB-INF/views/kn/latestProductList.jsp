<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
	System.out.println("context->"+context);
%>
<html lang="zxx">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<head>

	<script type="text/javascript" src="js/jquery1.js"></script>   <!-- ajax 사용하려면 필수  -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	function button1_click(p_code) {
		location.href="deleteLatestProduct?p_code="+p_code;
	}
	
	function bhDetailGo(p_code) {
		location.href="bhDetail?p_code="+p_code;
	}
	</script>

    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PIB 최근 본 상품</title>

    <!-- Google Font -->
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
 
    <style type="text/css">
    	.customer_service {
    		margin-top: 30px;
    	}
    
    	.customer_service ul {
    		list-style: none;
    		display: block;
    	}
    	.customer_service ul li {
    		position: relative;
		    float: left;
		    width: 340px;
		    height: 200px;
		    text-align: center;
		    border: 0;
    	}
    	.customer_service ul li a {
    		display: block;
		    height: 80px;
		    padding: 0;
		    line-height: 50px;
		    background: #f6f6f6;
		    font-size: 18px;
		    color: #666;
		    font-weight: 500;
		    border-left: 1px solid #e6e6e6;
    	}
    	.customer_service ul li.on a {
    		background: #555 !important;
		    color: #fff;
		    border: 0;
    	}
    	
    	.customer_service_category {
    		margin-top: 30px;
    		text-align: center;
    		margin-bottom: 30px;
    	}
    
    	.customer_service_category ul {
    		list-style: none;
    		display: block;
    		
    	}
    	.customer_service_category ul li {
    		position: relative;
		    float: left;
		    padding-right:20px;
		    text-align: center;
		    border: 0;
    	}
    	 .customer_service_category ul li a {

		    font-size: 17px;
		    color: #999;
		  
    	}
    	.customer_service_category ul li.on a {
    		background: #555 !important;
		    color: #fff;
		    border: 0;
    	} 
    </style>
</head>

<body>




    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>


    <!-- Header Section Begin -->
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
    <!-- Header Section End -->
    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>최근 본 상품</h4>
                        <div class="breadcrumb__links">
                            <a href="home">Home</a>
                            <span>LatestProduct</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Shop Section Begin -->
	<div class="container">
	<br>
		<c:set var="num" value="${lp.total-lp.start+1}"></c:set>
    <div class="row product__filter">
		
	   	<c:if test="${total == 0}">
			<div style="font-weight: bold; font-size: 18px;"><br><br><br>최근 본 상품이 없습니다.<br><br><br><br><br><br></div>
		</c:if>
		<c:if test="${total > 0 }">	
		
             <c:forEach var="product" items="${listLatestProduct}">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6">
                    <div class="product__item">
                    	<div class="product__item__pic set-bg" data-setbg="${product.p_img }" onclick="bhDetailGo(${product.p_code})"></div>
                        <div class="product__item__text">
                        	<span onclick="button1_click(${product.p_code})"><img src="img/icon/delete.png" width="18px" height="18px" align="right"></span>
                            <h5>${product.p_name }</h5>
                            <h7>${product.p_price }원</h7>
                        </div>
                    </div>
                </div> 
                <c:set var="num" value="${num - 1 }"></c:set>
           	</c:forEach>
        </c:if>
    </div>
    <div class="row">
    	<div class="col-lg-12">
    		<div class="product__pagination">       	
				<c:if test="${lp.startPage > lp.pageBlock }">
					<a href="latestProductList?currentPage=${lp.startPage-lp.pageBlock}&sort=${sort}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${lp.startPage}" end="${lp.endPage}">
					<a href="latestProductList?currentPage=${i}&sort=${sort}" class="<c:if test="${lp.currentPage == i }">active</c:if>">${i}</a>
				</c:forEach>
				<c:if test="${lp.endPage < lp.totalPage }">
					<a href="latestProductList?currentPage=${lp.startPage+lp.pageBlock}&sort=${sort}">[다음]</a>
				</c:if>
			</div>
		</div>
	</div>			
</div><p>
    <!-- Shop Section End -->

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
                            <li><a href="#">NOTICE</a></li>

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
                            <!-- <form action="#">
                                <input type="text" placeholder="Your email">
                                <button type="submit"><span class="icon_mail_alt"></span></button>
                            </form> -->
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