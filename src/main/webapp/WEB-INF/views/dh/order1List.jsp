<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>PIB Home</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap" rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
    
<script type="text/javascript">
	function productDetailPage(pcode){
		location.href="bhDetail?p_code="+pcode;
    }
</script>

<style type="text/css">
.orderTable {
	position: relative;
	width: 100%;
	margin-left:auto; 
	margin-right:auto;
	text-align: center;
	
	
}

.orderTable .orderTbody:hover { 
	background-color: #fafafa;
	
	}


li{
	list-style: none; 
	text-align: center;
}	

.orderPage {
	text-align: center;
	padding: 30px;
}

.orderThead {
	font-size: 17;
	border-bottom: 2px solid black;
	padding: 10px;
	
}

th{
	height : 52px;
	width : 4px;
	
}

td{
	padding : 15px;
	border-bottom: 1px solid #e5e5e5;

}

.orderCategoryDiv{
	text-align: right;
	width: 90%;
	align-content: right;
	padding-top: 20px;
	
}

.orderTable2{
	width: 100%;
	margin: auto;
	border-bottom: 2px solid black;	
}

.formManagerC{
	margin-bottom: 1px;
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
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>나의 주문내역</h4>
                        <div class="breadcrumb__links">
                            <a href="myPageForm">MyPage</a>
                            <span>나의 주문내역</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="container">
		<form action="order1ListCategory?currentPage=${pg.currentPage}" class="formManagerC">
		<table class="orderTable2">
			<tr>
				<td width="190px"></td>
				<td width="500px"></td>
			<td align="right">
			<select name='o_cancel' required="required" class="formManagerC">
				<option value='' selected>-주문상태-</option>
				<option value='0'>주문요청</option>
				<option value='1'>주문확정</option>
				<option value='2'>주문취소</option>
				</select>
			<input type="submit" class="site-btnOrder1" value="확인">
			</td>
			<td>
				<button type="button" onclick="location.href='order1Date?currentPage=${pg.currentPage}'" class="site-btnOrder1">오래된 순</button>
				<button type="button" onclick="location.href='order1List?currentPage=1'" class="site-btnOrder1">목록</button>
			</td>
			</tr>
		</table>
		</form>
	</div>
	
	
	
	<div class="container">
		<table class="orderTable">
			<thead class="orderThead">
				<tr>
					<th>상품정보</th>
					<th>주문일자</th>
					<th>주문번호</th>
					<th>수령인</th>
					<th>연락처</th>
					<th>주소</th>
					<th>금액(수량)</th>
					<th>주문상태</th>
				</tr>
			</thead>
			<c:if test="${total > 0 }">
				<c:forEach var="order1" items="${order1List }">
				<tbody class="orderTbody">
					<tr>
						<td>
							<div>
								<a href="bhDetail?p_code=${order1.p_code}" style="color: black"><input type="image" src="${order1.p_img }" style="width:100px;height:100px;"></a>
								<ul class="orderLi">
									<li>상품명 : <a href="bhDetail?p_code=${order1.p_code}" style="color: black; font-weight: bold;">${order1.p_name}</a></li>
									<li>사이즈 : ${order1.content}</li>
								</ul>
							</div>
						</td>
							<td>${order1.o_date }</td>
							<td>${order1.o_num }</td>
							<td style="width: 70px;">${order1.o_accept }</td>
							<td style="width: 100px;">${order1.o_tel }</td>
							<td>${order1.o_address }</td>
							<td style="width: 70px;">
								<div>
									<ul>
										<li>${order1.sumValue }원</li>
										<li style="font-size: 15;">수량 : ${order1.p_qty }개</li>
									</ul>
							 	</div>
						 	</td>
							<td width="70px">
								<c:set var ="o_cancel" value="${order1.o_cancel}"></c:set>
								<c:choose>
								<c:when test="${o_cancel eq '0'}">
									<a style="font-weight: bold;">주문요청</a><br>
									<a href="order1Cancel?o_num=${order1.o_num}&p_size=${order1.p_size}&p_code=${order1.p_code}" class="primary-btnOrder1">취소하기</a>
								</c:when>
								<c:when test="${o_cancel eq '1'}">
									<a style="color : blue; font-weight: bold;">주문확정</a>
								</c:when>
								<c:otherwise>
									<a style="color : red; font-weight: bold;">주문취소</a>
								</c:otherwise>
								</c:choose>
							</td>
					</tr>
				</tbody>
			</c:forEach>
		</c:if>
		<c:if test="${total == 0 }">
			<tr>
				<td>주문하신 상품이 없습니다</td>
			</tr>
		</c:if>
	</table>
	</div>
	<div class="product__pagination" style="margin-bottom: 25px;">
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="order1List?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
		<a href="order1List?currentPage=${i}" class="<c:if test="${pg.currentPage == i }">active</c:if>">${i }</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="order1List?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
	</c:if>
	</div>
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