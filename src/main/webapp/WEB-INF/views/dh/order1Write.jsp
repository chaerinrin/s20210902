<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PIB Home</title>

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
<script type="text/javascript" src="js/jquery1.js"></script>	<!-- ajax 사용하려면 필수  -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(document).ready(function() { 
		var totalPrice = 0;
		var totalPay = 0;
		
		$('.sumValue').each(function(){ //클래스가 sumValue인 항목의 갯수만큼 진행
			totalPrice += Number($(this).text()); 
		});
		
		var totalPay = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#totalPrice").text(totalPay);
		
});
	function showOrderForm() {
		if(${total} == 0){
			alert("장바구니에 상품에 담겨있지 않습니다.");
		}else{
			$('#order_form').show();
		}
	}
</script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<style type="text/css">
	.order_form input{
		height: 50px;
	    border: 1px solid #e1e1e1;
	    padding-left: 20px;
	    font-size: 15px;
	    color: #b7b7b7;
	    margin-bottom: 30px;
	}
</style>
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
    </header>
    <!-- Header Section End -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>장바구니</h4>
                        <div class="breadcrumb__links">
                            <a href="home">MyPage</a>
                            <span>장바구니</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
        <form action="order1Insert" method="post">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">              
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${cartList.size() == 0}">
                            <tr>
                            	<td colspan="4">장뱌구니 내역이 없습니다.</td>
                            </tr>
                            </c:if>
                            <c:if test="${cartList.size() != 0 }">
	                            <c:forEach var="cartList" items="${cartList }" varStatus="status">
	                                <tr>
	                                    <td class="product__cart__item">
	                                        <div class="product__cart__item__pic">
	                                            <img src="${cartList.p_img }" alt="" width="100px" height="100px">
	                                        </div>
	                                        <div class="product__cart__item__text">
	                                            <h5>${cartList.p_name }</h5>
	                                            <h6>${cartList.content }</h6>
	                                            <input type="hidden" name="p_code" value="${cartList.p_code }">
	                                            <input type="hidden" name="p_size" value="${cartList.p_size }">
	                                        </div>
	                                    </td>
	                                    <td class="quantity__item">
	                                        <div class="quantity">
	                                            	<input type="hidden" name="c_qty" value="${cartList.c_qty }">
	                                                <%-- <input type="text" id="qty" name="c_qty" value="${cartList.c_qty }"> --%>
	                                            	<span id="qty"> ${cartList.c_qty }</span>
	                                        </div>
	                                    </td>
	                                    <td class="cart__price">
	                                    	<span class="sumValue">${cartList.sumValue }</span>
	                                    </td>
	                                    <td class="cart__close">
	                                    	<i class="fa fa-close" onclick="location.href='cartDelete?c_num=${cartList.c_num }'"></i>
	                                    </td>
	                                </tr>
	                             </c:forEach>
							</c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>                
                            <li>Total <span id="totalPrice"></span></li>
                        </ul>
                        <a href="#order_form" class="primary-btn" onclick="showOrderForm()">주문하기</a>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <div class="contact__form" id="order_form" style="display: none; border-top : 1px solid #EAEAEA;  border-bottom : 1px solid #EAEAEA; padding : 20px 0px 20px 0px;">
            	<h3>주문서 작성</h3>
            	<br>
					<input type="text" name="o_accept" placeholder="받으시는분" required="required" style="width: 50%;"><br>
					<input type="tel" name="o_tel" placeholder="000-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" required="required" style="width: 50%;"><br>

					<input type="text" name="text1" id="sample6_postcode" placeholder="우편번호" width="100px" style="width: 20%;">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 20%;"><br>
					<input type="text"  name="text2" id="sample6_address" placeholder="받으시는분 주소" style="width: 50%;"><br>
					<input type="text"  name="text3" id="sample6_detailAddress" placeholder="상세주소" style="width: 50%;">
					<input type="text"  name="text4" id="sample6_extraAddress" placeholder="참고항목" style="width: 50%;"><br>
				
					<button onclick="test()" class="primary-btn">주문하기</button>	
        	</div>
        	</form>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
<%-- <h2>주문서 작성 및 배송지 입력</h2>
<form action="order1Insert" method="post">
<table border="1">
	<thead>
		<tr>
			<th>이미지</th><th>제품명</th><th>수량</th><th>사이즈</th><th>가격</th><th>취소</th><th>히든</th>
		</tr>
	</thead>
		<tbody>
		<c:if test="${total > 0 }">
		<c:forEach var="cartList" items="${cartList }">
			<tr>
				<td>${cartList.p_img }</td>
				<td>${cartList.p_name }</td>
				<td>${cartList.c_qty }</td>
				<td>${cartList.content }</td>
				<td>&#8361;<input type="number" class="sumValue" value="${cartList.sumValue }" readonly="readonly" style="border:0 solid black; width: 70px;"></td>
				<td><a href="cartDelete?c_num=${cartList.c_num }">[취소하기]</a></td>
				<td><input type="hidden" name="p_code" value="${cartList.p_code }">
					<input type="hidden" name="p_size" value="${cartList.p_size }">
					<input type="hidden" name="c_qty" value="${cartList.c_qty }"></td>
			</tr>
	</c:forEach>
	</c:if>
		</tbody>
		<c:if test="${total == 0 }">
		<tr>
			<td>장바구니 내역이 없습니다</td>
		</tr>
	</c:if>
	</table>
	<br>
	<div>
		합계 금액 : &#8361;<input type="text" id="totalPrice" readonly="readonly" style="border:0 solid black; width: 70px;"><br>
	</div>
				<div>
					<input type="text" name="o_accept" placeholder="받으시는분" required="required"><br>
					<input type="tel" name="o_tel" placeholder="000-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" required="required"><br>
				</div>
				<div>
					<input type="text" name="text1" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text"  name="text2" id="sample6_address" placeholder="받으시는분 주소"><br>
					<input type="text"  name="text3" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text"  name="text4" id="sample6_extraAddress" placeholder="참고항목"><br>
				</div>
					<button onclick="test()">주문하기</button>
	
	</form> --%>
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