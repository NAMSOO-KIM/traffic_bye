<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description" content="multikart">
<meta name="keywords" content="multikart">
<meta name="author" content="multikart">
<link rel="icon"
	href="${contextPath}/resources/assets/images/favicon/1.png"
	type="image/x-icon">
<link rel="shortcut icon"
	href="${contextPath}/resources/assets/images/favicon/1.png"
	type="image/x-icon">
<title>현대백화점 면세점</title>

<!--Google font-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap"
	rel="stylesheet">
<!-- Icons -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/fontawesome.css">
<!--Slick slider css-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/slick.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/slick-theme.css">
<!-- Animate icon -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/animate.css">
<!-- Themify icon -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/themify-icons.css">
<!-- Bootstrap css -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/bootstrap.css">
<!-- Theme css -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/style.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- 내용 입력해주세요 -->
	
  <!-- section start -->
    <section>
        <div class="collection-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-lg-1 col-sm-2 col-xs-12">
                        <div class="row">
                            <div class="col-12 p-0">
                                <div class="slider-right-nav">
                                    <div><img src="../assets/images/pro3/1.jpg" alt=""
                                            class="img-fluid blur-up lazyload"></div>
                                    <div><img src="../assets/images/pro3/2.jpg" alt=""
                                            class="img-fluid blur-up lazyload"></div>
                                    <div><img src="../assets/images/pro3/27.jpg" alt=""
                                            class="img-fluid blur-up lazyload"></div>
                                    <div><img src="../assets/images/pro3/27.jpg" alt=""
                                            class="img-fluid blur-up lazyload"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-10 col-xs-12 order-up">
                        <div class="product-right-slick">
                            <div><img src="../assets/images/pro3/1.jpg" alt=""
                                    class="img-fluid blur-up lazyload image_zoom_cls-0"></div>
                            <div><img src="../assets/images/pro3/2.jpg" alt=""
                                    class="img-fluid blur-up lazyload image_zoom_cls-1"></div>
                            <div><img src="../assets/images/pro3/27.jpg" alt=""
                                    class="img-fluid blur-up lazyload image_zoom_cls-2"></div>
                            <div><img src="../assets/images/pro3/27.jpg" alt=""
                                    class="img-fluid blur-up lazyload image_zoom_cls-3"></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="product-right product-description-box">
                            <div class="product-count">
                                <ul>
                                    <li>
                                        <img src="../assets/images/fire.gif" class="img-fluid" alt="image">
                                        <span class="p-counter">37</span>
                                        <span class="lang">orders in last 24 hours</span>
                                    </li>
                                    <li>
                                        <img src="../assets/images/person.gif" class="img-fluid user_img" alt="image">
                                        <span class="p-counter">44</span>
                                        <span class="lang">active view this</span>
                                    </li>
                                </ul>
                            </div>
                            <h2>Women Pink Shirt</h2>
                            <div class="border-product">
                                <h6 class="product-title">product details</h6>
                                <p>The Model is wearing a white blouse from our stylist's collection, see the image for
                                    a mock-up of what the actual blouse would look like.</p>
                            </div>
                            <div class="single-product-tables border-product detail-section">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>Febric:</td>
                                            <td>Chiffon</td>
                                        </tr>
                                        <tr>
                                            <td>Color:</td>
                                            <td>Red</td>
                                        </tr>
                                        <tr>
                                            <td>Material:</td>
                                            <td>Crepe printed</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="border-product">
                                <h6 class="product-title">share it</h6>
                                <div class="product-icon">
                                    <ul class="product-social">
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                        <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="border-product">
                                <h6 class="product-title">100% SECURE PAYMENT</h6>
                                <div class="payment-card-bottom">
                                    <ul>
                                        <li>
                                            <a href="#"><img src="../assets/images/icon/visa.png" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="../assets/images/icon/mastercard.png" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="../assets/images/icon/paypal.png" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="../assets/images/icon/american-express.png"
                                                    alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="../assets/images/icon/discover.png" alt=""></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="product-right product-form-box">
                            <h4><del>$459.00</del><span>55% off</span></h4>
                            <h3>$32.96</h3>
                            <ul class="color-variant">
                                <li class="bg-light0 active"></li>
                                <li class="bg-light1"></li>
                                <li class="bg-light2"></li>
                            </ul>
                            <div id="selectSize" class="addeffect-section product-description border-product">
                                <h6 class="product-title">Sales Ends In</h6>
                                <div class="timer">
                                    <p id="demo"></p>
                                </div>
                                <h6 class="product-title">select size</h6>
                                <div class="modal fade" id="sizemodal" tabindex="-1" role="dialog"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Sheer Straight Kurta</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            </div>
                                            <div class="modal-body"><img src="../assets/images/size-chart.jpg" alt=""
                                                    class="img-fluid blur-up lazyload"></div>
                                        </div>
                                    </div>
                                </div>
                                <h6 class="error-message">please select size</h6>
                                <div class="size-box">
                                    <ul>
                                        <li><a href="javascript:void(0)">s</a></li>
                                        <li><a href="javascript:void(0)">m</a></li>
                                        <li><a href="javascript:void(0)">l</a></li>
                                        <li><a href="javascript:void(0)">xl</a></li>
                                    </ul>
                                </div>
                                <h6 class="product-title">quantity</h6>
                                <div class="qty-box">
                                    <div class="input-group"><span class="input-group-prepend"><button type="button"
                                                class="btn quantity-left-minus" data-type="minus" data-field=""><i
                                                    class="ti-angle-left"></i></button> </span>
                                        <input type="text" name="quantity" class="form-control input-number" value="1">
                                        <span class="input-group-prepend"><button type="button"
                                                class="btn quantity-right-plus" data-type="plus" data-field=""><i
                                                    class="ti-angle-right"></i></button></span>
                                    </div>
                                </div>
                            </div>
                            <div class="product-buttons"><a href="javascript:void(0)" id="cartEffect"
                                    class="btn btn-solid hover-solid btn-animation">장바구니 담기</a> <a href="#"
                                    class="btn btn-solid">구매하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Section ends -->
 

<!-- 내용 끝 -->
	<jsp:include page="../footer.jsp"></jsp:include>
	  <script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src =
                'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js#xfbml=1&version=v2.12&autoLogAppEvents=1';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
    <!-- Your customer chat code -->
    <div class="fb-customerchat" attribution=setup_tool page_id="2123438804574660" theme_color="#0084ff"
        logged_in_greeting="Hi! Welcome to PixelStrap Themes  How can we help you?"
        logged_out_greeting="Hi! Welcome to PixelStrap Themes  How can we help you?">
    </div>
    <!-- facebook chat section end -->


    <!-- tap to top -->
    <div class="tap-top top-cls">
        <div>
            <i class="fa fa-angle-double-up"></i>
        </div>
    </div>
    <!-- tap to top end -->


    <!-- latest jquery-->
    <script src="${contextPath}/resources/assets/js/jquery-3.3.1.min.js"></script>

    <!-- fly cart ui jquery-->
    <script src="${contextPath}/resources/assets/js/jquery-ui.min.js"></script>

    <!-- exitintent jquery-->
    <script src="${contextPath}/resources/assets/js/jquery.exitintent.js"></script>
    <script src="${contextPath}/resources/assets/js/exit.js"></script>

    <!-- slick js-->
    <script src="${contextPath}/resources/assets/js/slick.js"></script>

    <!-- menu js-->
    <script src="${contextPath}/resources/assets/js/menu.js"></script>

    <!-- lazyload js-->
    <script src="${contextPath}/resources/assets/js/lazysizes.min.js"></script>

    <!-- Bootstrap js-->
    <script src="${contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>

    <!-- Bootstrap Notification js-->
    <script src="${contextPath}/resources/assets/js/bootstrap-notify.min.js"></script>

    <!-- Fly cart js-->
    <script src="${contextPath}/resources/assets/js/fly-cart.js"></script>

    <!-- Theme js-->
    <script src="${contextPath}/resources/assets/js/theme-setting.js"></script>
    <script src="${contextPath}/resources/assets/js/script.js"></script>

    <script>
        function openSearch() {
            document.getElementById("search-overlay").style.display = "block";
        }

        function closeSearch() {
            document.getElementById("search-overlay").style.display = "none";
        }
    </script>
	
</body>
</html>