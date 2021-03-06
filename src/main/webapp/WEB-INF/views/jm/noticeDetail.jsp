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
    <title>NOTICE | PIB</title>

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
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
	<script> 
		function modalSelect() {
			str = "";
			$('.form-group').empty();
			$.ajax({						/* controller 호출  url, dataType 호출 할 때 정보*/
				url : "<%=context%>/modalSelect",
				dataType : 'json',				/* dataType, success 응답 후 정보 */
				success : function(data){
					var jsondata = JSON.stringify(data);
					var index = 0;
					$(data).each(
						function() {
							str += "<label for='"+index+"'><input type='radio' name='p_product' id='"+index+"' value1='"+this.p_code+"' value2='"+this.p_size+"'>"
										+this.p_code+"&nbsp"+this.p_name+"&nbsp<img alt='"+this.p_img+"' src='"+this.p_img+"' width='100px' height='100px'></label><br>";
										index+=1;
						}
					);
					$('.form-group').append(str);
					alert(".ajax getListDept str->"+str);
					$('#exampleModal').modal('show');
				}
			});
		}

		function orderSelect() {
			/* var p_code = $("input[name=p_product]:checked").val(); */
			var p_code;
			var p_size;
			$("input[name=p_product]:checked").each(
				function(index, item){
			       p_code = $(item).attr("value1");
			       p_size = $(item).attr("value2");
				});
			       /* var p_code = $(item).attr("value1").val();
			       var p_size = $(item).atrr("value2").val(); */
			/* var p_code = $('input[name="p_product"]:checked').val();
			var p_size = $() */
			alert(p_code);
			$('#selectProduct').text(p_code);
			$('input[name="p_code"]').val(p_code);
			$('input[name="p_size"]').val(p_size);
			$('#exampleModal').modal('hide');
		}
	</script>
    
    <style>
        #modal {
          display: none;
          position:relative;
          width:100%;
          height:100%;
          z-index:1;
        }
        
        #modal h2 {
          margin:0;
        }
        #modal button {
          display:inline-block;
          width:100px;
          margin-left:calc(100% - 100px - 10px);
        }
        
        #modal .modal_content {
          width:300px;
          margin:100px auto;
          padding:20px 10px;
          background:#fff;
          border:2px solid #666;
        }
        
        #modal .modal_layer {
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
          z-index:-1;
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
	<section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>공지사항 관리</h4>
                        <div class="breadcrumb__links">
                            <a href="adminPageForm">AdminPage</a>
                            <span>공지사항 관리</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<br>
    <section>
   	 <div class="container">
     <div class="breadcrumb__text">
     <h4>공지사항 내용</h4>
	 </div>
       <div class="shopping__cart__table">
		 <form action="noticeDetail" method="post" enctype="multipart/form-data" target="myBatisFrame">
		 <table>
			<tr><th>번호　　 </th><td>${notice.n_num }</td></tr>
			<tr><th>제목　　</th><td>${notice.n_title }</td></tr>
			<tr><th>내용　　</th><td>${notice.n_content }</td></tr>
			<tr><th>마감일</th><td>${notice.n_date }</td></tr>

		</table>
		<Br>
   		<input type="button" value="목록" onclick="location.href='noticeList'" class="primary-btn">
   		<input type="button" value="수정" onclick="location.href='noticeUpdateForm?n_num=${notice.n_num}'" class="primary-btn">
   		<input type="button" value="삭제" onclick="location.href='noticeDelete?n_num=${notice.n_num}'" class="primary-btn">
   		</form>
 	   </div>
     </div>
 	 </section>


	<!-- modal Start -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">주문리스트</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div id="product_list">
	          </div>
	          <div class="form-group">
	            <%-- <c:forEach var="order1" items="${orderList }" varStatus="status">
	            	<input type="radio" name="p_code" value="${order1.p_code }" id="${status.index }">
	            	
	            	<label for="${status.index }">${order1.p_code }</label><br>
	            </c:forEach> --%>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" onclick="orderSelect()">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- modal End -->
	
	
	
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