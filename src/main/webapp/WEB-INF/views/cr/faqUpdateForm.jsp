<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FAQ | PIB</title>

    <!-- Google Font -->
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
    
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
                <a href="#">Sign in</a>
                <a href="#">FAQs</a>
            </div>
            <div class="offcanvas__top__hover">
                <span>Usd <i class="arrow_carrot-down"></i></span>
                <ul>
                    <li>USD</li>
                    <li>EUR</li>
                    <li>USD</li>
                </ul>
            </div>
        </div>
        <div class="offcanvas__nav__option">
            <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
            <a href="#"><img src="img/icon/heart.png" alt=""></a>
            <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
            <div class="price">$0.00</div>
        </div>
        <div id="mobile-menu-wrap"></div>
       
    </div>
    <!-- Offcanvas Menu End -->

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
                                <a href="cm/register">????????????</a>
                                <a href="cm/loginForm">?????????</a>
                            </c:when>
                            <c:when test="${mem_id != null && mem_admin == 0}">
                                <span style="color: white; padding-right: 20px;">${mem_id }???</span>
                                <a href="cm/logout">????????????</a>
                                <a href="myPageForm">???????????????</a>
                            </c:when>
                            <c:when test="${mem_admin == 1 }">
                            	<span style="color: white; padding-right: 20px;">${mem_id }???</span>
                                <a href="cm/logout">????????????</a>
                                <a href="adminPageForm">??????????????????</a>
                            </c:when>
                            </c:choose>
                                <a href="faqListAll">????????????</a>
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
                        <!-- ?????? (?????? ?????? ??????) 21.12.13. -->
                        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                        <!-- ?????? ??? -->
                        <a href="wishList"><img src="img/icon/heart.png" alt=""></a>
                        <a href="cartList"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                        <!-- ?????? (?????? ??? ?????? ??????) 21.12.13. -->
                        <a href="latestProductList"><img src="img/icon/time.png" width="19px" height="19px" alt="?????? ??? ??????"></a>
                        <!-- <div>????????? ????????? <a href="" title="SumberRejeki">SumberRejeki</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></div> -->
						<!-- ?????? ??? -->
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->
	<section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>FAQ ??????</h4>
                        <div class="breadcrumb__links">
                            <a href="adminPageForm">AdminPage</a>
                            <span>FAQ ??????</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br>
    <br>
    <section>
    	<div class="container">
    	<div class="contact__form">
    	<form action="faqUpdatePro" method="post">
    		<input type="hidden" name="f_num" value="${faq.f_num }">
    		<div>
    			<input type="text" name="f_title" placeholder="????????? ???????????????" value="${faq.f_title }" required="required">
    		</div>
    		<div>
    			<select name="q_mcode">
    				<c:forEach var="faq_code" items="${faq_mcode }">
    					<option id="code" <c:if test="${faq_code.mcode == faq.q_mcode}">selected</c:if> value="${faq_code.mcode}">
    						${faq_code.content}
    					</option>
    				</c:forEach>
    			</select>
    			
    		</div>
    		<br>
    		<br>
    		<div>
				<textarea rows="10" cols="100" name="f_content" placeholder="????????? ???????????????" required="required">${faq.f_content }</textarea>
			</div>
			<div class="shopping__cart__table">
				<button type="button" onclick="location.href='adminFaqListAll'" class="primary-btn">??????</button>
				<button type="submit" value="??????" class="primary-btn">??????</button>
			</div>
		</form>
    	</div>
    	</div>
    </section>

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
                        <p>Copyright ??
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

<!-- ?????? (?????? ?????? ??????)  21.12.13. -->
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
<!-- ?????? ??? -->

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