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
<title>Multikart - Multi-purpopse E-commerce Html Template</title>


<!-- latest jquery-->
<script src="${contextPath}/resources/assets/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/animate.min.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/jquery.modal.css" />

<script
	src="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/js/jquery.modal.js"></script>

<script
	src="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/js/modal.js"></script>

<!-- fly cart ui jquery-->
<script src="${contextPath}/resources/assets/js/jquery-ui.min.js"></script>
<!-- exitintent jquery-->
<script src="${contextPath}/resources/assets/js/jquery.exitintent.js"></script>
<!-- tap to top end -->
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



<script src="${contextPath}/resources/assets/js/exit.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- thank-you section start -->
	<section class="section-b-space light-layout">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="success-text">
						<div class="checkmark">
							<svg class="star" height="19" viewBox="0 0 19 19" width="19"
								xmlns="http://www.w3.org/2000/svg">
                                <path
									d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                            </svg>
							<svg class="star" height="19" viewBox="0 0 19 19" width="19"
								xmlns="http://www.w3.org/2000/svg">
                                <path
									d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                            </svg>
							<svg class="star" height="19" viewBox="0 0 19 19" width="19"
								xmlns="http://www.w3.org/2000/svg">
                                <path
									d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                            </svg>
							<svg class="star" height="19" viewBox="0 0 19 19" width="19"
								xmlns="http://www.w3.org/2000/svg">
                                <path
									d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                            </svg>
							<svg class="star" height="19" viewBox="0 0 19 19" width="19"
								xmlns="http://www.w3.org/2000/svg">
                                <path
									d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                            </svg>
							<svg class="star" height="19" viewBox="0 0 19 19" width="19"
								xmlns="http://www.w3.org/2000/svg">
                                <path
									d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                            </svg>
							<svg class="checkmark__check" height="36" viewBox="0 0 48 36"
								width="48" xmlns="http://www.w3.org/2000/svg">
                                <path
									d="M47.248 3.9L43.906.667a2.428 2.428 0 0 0-3.344 0l-23.63 23.09-9.554-9.338a2.432 2.432 0 0 0-3.345 0L.692 17.654a2.236 2.236 0 0 0 .002 3.233l14.567 14.175c.926.894 2.42.894 3.342.01L47.248 7.128c.922-.89.922-2.34 0-3.23">
                                </path>
                            </svg>
							<svg class="checkmark__background" height="115"
								viewBox="0 0 120 115" width="120"
								xmlns="http://www.w3.org/2000/svg">
                                <path
									d="M107.332 72.938c-1.798 5.557 4.564 15.334 1.21 19.96-3.387 4.674-14.646 1.605-19.298 5.003-4.61 3.368-5.163 15.074-10.695 16.878-5.344 1.743-12.628-7.35-18.545-7.35-5.922 0-13.206 9.088-18.543 7.345-5.538-1.804-6.09-13.515-10.696-16.877-4.657-3.398-15.91-.334-19.297-5.002-3.356-4.627 3.006-14.404 1.208-19.962C10.93 67.576 0 63.442 0 57.5c0-5.943 10.93-10.076 12.668-15.438 1.798-5.557-4.564-15.334-1.21-19.96 3.387-4.674 14.646-1.605 19.298-5.003C35.366 13.73 35.92 2.025 41.45.22c5.344-1.743 12.628 7.35 18.545 7.35 5.922 0 13.206-9.088 18.543-7.345 5.538 1.804 6.09 13.515 10.696 16.877 4.657 3.398 15.91.334 19.297 5.002 3.356 4.627-3.006 14.404-1.208 19.962C109.07 47.424 120 51.562 120 57.5c0 5.943-10.93 10.076-12.668 15.438z">
                                </path>
                            </svg>
						</div>
						<h2>thank you</h2>
						<p>Payment is successfully processsed and your order is on the
							way</p>
						<p class="font-weight-bold">Transaction ID:267676GHERT105467</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Section ends -->
	<!-- order-detail section start -->
	<section class="section-b-space">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="product-order">
						<div class="row product-order-detail">
							<div class="col-3">
								<img src="../assets/images/pro3/27.jpg" alt=""
									class="img-fluid blur-up lazyload">
							</div>
							<div class="col-3 order_detail">
								<div>
									<h4>product name</h4>
									<h5>cotton shirt</h5>
								</div>
							</div>
							<div class="col-3 order_detail">
								<div>
									<h4>quantity</h4>
									<h5>1</h5>
								</div>
							</div>
							<div class="col-3 order_detail">
								<div>
									<h4>price</h4>
									<h5>$555.00</h5>
								</div>
							</div>
						</div>
						<div class="row product-order-detail">
							<div class="col-3">
								<img src="../assets/images/pro3/35.jpg" alt=""
									class="img-fluid blur-up lazyload">
							</div>
							<div class="col-3 order_detail">
								<div>
									<h4>product name</h4>
									<h5>cotton shirt</h5>
								</div>
							</div>
							<div class="col-3 order_detail">
								<div>
									<h4>quantity</h4>
									<h5>1</h5>
								</div>
							</div>
							<div class="col-3 order_detail">
								<div>
									<h4>price</h4>
									<h5>$555.00</h5>
								</div>
							</div>
						</div>
						<div class="total-sec">
							<ul>
								<li>subtotal <span>$55.00</span></li>
								<li>shipping <span>$12.00</span></li>
								<li>tax(GST) <span>$10.00</span></li>
							</ul>
						</div>
						<div class="final-total">
							<h3>
								total <span>$77.00</span>
							</h3>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="order-success-sec">
						<div class="row">
							<div class="col-sm-6">
								<h4>summery</h4>
								<ul class="order-detail">
									<li>order ID: 5563853658932</li>
									<li>Order Date: October 22, 2018</li>
									<li>Order Total: $907.28</li>
								</ul>
							</div>
							<div class="col-sm-6">
								<h4>shipping address</h4>
								<ul class="order-detail">
									<li>gerg harvell</li>
									<li>568, suite ave.</li>
									<li>Austrlia, 235153</li>
									<li>Contact No. 987456321</li>
								</ul>
							</div>
							<div class="col-sm-12 payment-mode">
								<h4>payment method</h4>
								<p>Pay on Delivery (Cash/Card). Cash on delivery (COD)
									available. Card/Net banking acceptance subject to device
									availability.</p>
							</div>
							<div class="col-md-12">
								<div class="delivery-sec">
									<h3>
										expected date of delivery: <span>october 22, 2018</span>
									</h3>
									<a href="order-tracking.html">track order</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--section end-->
	<!-- 내용 시작 -->
	<!-- Button that triggers the popup -->
	<!-- 모달 세트  시작 -->
	<style>
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: rgba(69, 139, 197, 0.70);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
</style>
	<div id="container">
		<div id="lorem-ipsum"></div>
	</div>
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title-modal">
				<!-- <h2>모달</h2> -->
			</div>
			<div class="close-area">X</div>
			<div class="content-modal">
				<!-- <p>가나다라마바사 아자차카타파하</p>
				<p>가나다라마바사 아자차카타파하</p>
				<p>가나다라마바사 아자차카타파하</p>
				<p>가나다라마바사 아자차카타파하</p> -->

			</div>
		</div>
	</div>
	<script>
   
    </script>

	<script type="text/javascript">
	var modal = document.getElementById("modal");
	
	const closeBtn = modal.querySelector(".close-area");
	closeBtn.addEventListener("click", e => {
	    modal.style.display = "none"
	});
	
	modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none"
    }
});

window.addEventListener("keyup", e => {
    if(modal.style.display === "flex" && e.key === "Escape") {
        modal.style.display = "none"
    }
});
	function isModalOn() {
    return modal.style.display === "flex"
}
	</script>

	<!-- 모달 세트  끝 -->
	<script type="text/javascript">
	
		//웹소켓으로 이값을 전송		
		var wsocket;

		function connect() {
			wsocket = new WebSocket("ws://localhost/app/smartOrder-ws");
			wsocket.onopen = onOpen;
			wsocket.onmessage = onMessage;
			wsocket.onclose = onClose;
		}
		function onMessage(evt) {
			console.log("메세지 도착");
			$('.title-modal').empty();
			$('.content-modal').empty();
			$('.title-modal').append('<h2>제목</h2>');
			$('.content-modal').append(evt.data);
			   modal.style.display = "flex";
			
		}
		function onOpen(){
			console.log('hi');
		}
		function onClose(evt) {
			console.log("연결을 끊었습니다.");
		}
		$(document).ready(function() {
			connect();
		});
	</script>



	<!-- 내용 끝 -->

	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js#xfbml=1&version=v2.12&autoLogAppEvents=1';
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<!-- Your customer chat code -->
	<div class="fb-customerchat" attribution=setup_tool
		page_id="2123438804574660" theme_color="#0084ff"
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