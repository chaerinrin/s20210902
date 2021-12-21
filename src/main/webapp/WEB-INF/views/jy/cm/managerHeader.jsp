<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>
    
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
                                <a href="${contextPath}/cm/register">회원가입</a>
                                <a href="${contextPath}/cm/loginForm">로그인</a>
                            </c:when>
                            <c:when test="${mem_id != null && mem_admin == 0}">
                                <span style="color: white; padding-right: 20px;">${mem_id }님</span>
                                <a href="${contextPath}/cm/logout">로그아웃</a>
                                <a href="${contextPath}/myPageForm">마이페이지</a>
                            </c:when>
                            <c:when test="${mem_admin == 1 }">
                            	<span style="color: white; padding-right: 20px;">${mem_id }님</span>
                                <a href="${contextPath}/cm/logout">로그아웃</a>
                                <a href="${contextPath}/adminPageForm">관리자페이지</a>
                            </c:when>
                            </c:choose>
                                <a href="${contextPath}/faqListAll">고객센터</a>
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
                        <a href="${contextPath}/home"><img src="${contextPath}/img/PIB_logo.png" alt="" width="120px" height="50px"></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="${contextPath}/bhPro">All</a></li>
                            <li><a href="${contextPath}/bhProT">Tops</a></li>
                            <li><a href="${contextPath}/bhProB">Trousers</a></li>
                            <li><a href="${contextPath}/bhProA">Accessories</a></li>
                            <li><a href="${contextPath}/bhProS">Shoes</a></li>
                            <!-- <ul class="dropdown">
                                    <li><a href="./about.html">About Us</a></li>
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shopping-cart.html">Shopping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li> 
                                </ul> -->
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                       <!-- 수정 (메인 화면 검색) 21.12.13. -->
                        <a href="#" class="search-switch"><img src="${contextPath}/img/icon/search.png" alt=""></a>
                        <!-- 수정 끝 -->
                        <a href="${contextPath}/wishList"><img src="${contextPath}/img/icon/heart.png" alt=""></a>
                        <a href="${contextPath}/cartList"><img src="${contextPath}/img/icon/cart.png" alt=""> <span>0</span></a>
                        <!-- 추가 (최근 본 상품 검색) 21.12.13. -->
                        <a href="${contextPath}/latestProductList"><img src="${contextPath}/img/icon/time.png" width="19px" height="19px" alt="최근 본 상품"></a>
                        <!-- <div>아이콘 제작자 <a href="" title="SumberRejeki">SumberRejeki</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></div> -->
						<!-- 추가 끝 -->
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->