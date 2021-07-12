<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="icon" href="${contextPath}/resources/assets/images/favicon/1.png" type="image/x-icon" />
    <link rel="shortcut icon" href="${contextPath}/resources/assets/images/favicon/1.png" type="image/x-icon" />
    <title>Multikart - Multi-purpopse E-commerce Html Template</title>

    <!--Google font-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/fontawesome.css">

    <!--Slick slider css-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/slick.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/slick-theme.css">

    <!-- Animate icon -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/animate.css">

    <!-- Themify icon -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/themify-icons.css">

    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/bootstrap.css">

    <!-- Theme css -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/style.css">
  <!-- latest jquery-->
    <script src="${contextPath}/resources/assets/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- breadcrumb start -->
	<div class="breadcrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="page-title">
						<h2>주문현황</h2>
					</div>
				</div>
				<div class="col-sm-6">
					<nav aria-label="breadcrumb" class="theme-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${contextPath}/member/mypage">마이페이지</a></li>
							<li class="breadcrumb-item"><a href="${contextPath}/member/mypage/orders">주문목록</a></li>
							<li class="breadcrumb-item active" aria-current="page">주문현황</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumb End -->
	
	
	<c:set var="myList" value="${list}" />
	<!-- tracking page start -->
	<section class="tracking-page section-b-space">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h3>주문 번호 : ${myList.orderId}</h3>
					<div class="row border-part">
						<div class="col-xl-2 col-md-3 col-sm-4">
							<div class="product-detail">
								<img src="${contextPath}/resources/imgs/orderdetail.jpg"
									class="img-fluid blur-up lazyload" alt="">
							</div>
						</div>
						<div class="col-xl-4 col-lg-5 col-sm-8">
							<div class="tracking-detail">
								<ul>
									<li>
										<div class="left">
											<span>주문자 성함 :</span>
										</div>
										<div class="right">
											<span>${myList.memberName}</span>
										</div>
									</li>
									<li>
										<div class="left">
											<span>주문 날짜 :</span>
										</div>
										<div class="right">
											<span>${myList.paymentDate}</span>
										</div>
									</li>
									<li>
										<div class="left">
											<span>총 금액 :</span>
										</div>
										<div class="right">
											<span>$${myList.amount}</span>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					  <div class="wrapper">
                        <div class="arrow-steps clearfix">
                            <div class="step" id="status1"> <span> 수락 대기</span> </div>
                            <div class="step" id="status2"> <span>주문 수락</span> </div>
                            <div class="step" id="status3"><span> 준비 완료</span> </div>
                            <div class="step" id="status4"><span> 수령 완료</span> </div>
                        </div>
                    </div>     
                   
                    <script type="text/javascript">
                	$(document).ready(function() {
                		var currentStatus = '<c:out value="${myList.status}"/>';
                		console.log(currentStatus);
                		if(currentStatus == 0){
                			$("#status1").attr('class','step current'); 
                			$("#status2").attr('class','step'); 
                			$("#status3").attr('class','step'); 
                			$("#status4").attr('class','step'); 
                		}else if(currentStatus == 1){
                			$("#status1").attr('class','step done'); 
                			$("#status2").attr('class','step current'); 
                			$("#status3").attr('class','step'); 
                			$("#status4").attr('class','step'); 
                		}else if(currentStatus == 2){
                			$("#status1").attr('class','step done'); 
                			$("#status2").attr('class','step done'); 
                			$("#status3").attr('class','step current'); 
                			$("#status4").attr('class','step'); 
                		}else if(currentStatus == 3){
                			$("#status1").attr('class','step done'); 
                			$("#status2").attr('class','step done'); 
                			$("#status3").attr('class','step done'); 
                			$("#status4").attr('class','step current');
                		}
                		
            		});
                    
                    </script>
				</div>
			</div>
		</div>
	</section>
	<!-- tracking page end -->


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
	<!-- tap to top end -->




	<!-- slick js-->
  

    <!-- menu js-->
    <script src="${contextPath}/resources/assets/js/menu.js"></script>

    <!-- lazyload js-->
    <script src="${contextPath}/resources/assets/js/lazysizes.min.js"></script>

    <!-- slick js-->
    <script src="${contextPath}/resources/assets/js/slick.js"></script>

    <!-- Bootstrap js-->
    <script src="${contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>

    <!-- Bootstrap Notification js-->
    <script src="${contextPath}/resources/assets/js/bootstrap-notify.min.js"></script>

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