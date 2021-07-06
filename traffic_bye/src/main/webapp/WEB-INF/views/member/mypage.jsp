<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

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

<body class="theme-color-1">

	<jsp:include page="../header.jsp"></jsp:include>

	<!-- breadcrumb start -->
	<div class="breadcrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="page-title">
						<h2>Dashboard</h2>
					</div>
				</div>
				<div class="col-sm-6">
					<nav aria-label="breadcrumb" class="theme-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Dashboard</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumb End -->


	<!-- section start -->
	<section class="section-b-space">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="account-sidebar">
						<a class="popup-btn">my account</a>
					</div>
					<div class="dashboard-left">
						<div class="collection-mobile-back">
							<span class="filter-back"><i class="fa fa-angle-left"
								aria-hidden="true"></i> back</span>
						</div>
						<div class="block-content">
							<ul>
								<li class="active"><a href="#">정보 수정</a></li>
								<li><a href="#">주문 내역</a></li>
								<li class="last"><a href="#">회원 탈퇴</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="dashboard-right">
						<div class="dashboard">
							<div class="page-title">
								<h2>My Dashboard</h2>
							</div>
							<div class="welcome-msg">
								<p>Hello, MARK JECNO !</p>
								<p>From your My Account Dashboard you have the ability to
									view a snapshot of your recent account activity and update your
									account information. Select a link below to view or edit
									information.</p>
							</div>
							<div class="box-account box-info">
								<div class="box-head">
									<h2>Account Information</h2>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="box">
											<div class="box-title">
												<h3>Contact Information</h3>
												<a href="#">Edit</a>
											</div>
											<div class="box-content">
												<h6>MARK JECNO</h6>
												<h6>MARk-JECNO@gmail.com</h6>
												<h6>
													<a href="#">Change Password</a>
												</h6>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="box">
											<div class="box-title">
												<h3>Newsletters</h3>
												<a href="#">Edit</a>
											</div>
											<div class="box-content">
												<p>You are currently not subscribed to any newsletter.</p>
											</div>
										</div>
									</div>
								</div>
								<div>
									<div class="box">
										<div class="box-title">
											<h3>Address Book</h3>
											<a href="#">Manage Addresses</a>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<h6>Default Billing Address</h6>
												<address>
													You have not set a default billing address.<br>
													<a href="#">Edit Address</a>
												</address>
											</div>
											<div class="col-sm-6">
												<h6>Default Shipping Address</h6>
												<address>
													You have not set a default shipping address.<br>
													<a href="#">Edit Address</a>
												</address>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- section end -->



	<jsp:include page="../footer.jsp"></jsp:include>





	<!-- tap to top start -->
	<div class="tap-top">
		<div>
			<i class="fa fa-angle-double-up"></i>
		</div>
	</div>
	<!-- tap to top end -->


	<!-- latest jquery-->
	<script src="${contextPath}/resources/assets/js/jquery-3.3.1.min.js"></script>

	<!-- menu js-->
	<script src="${contextPath}/resources/assets/js/menu.js"></script>

	<!-- lazyload js-->
	<script src="${contextPath}/resources/assets/js/lazysizes.min.js"></script>

	<!-- slick js-->
	<script src="${contextPath}/resources/assets/js/slick.js"></script>

	<!-- Bootstrap js-->
	<script
		src="${contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>

	<!-- Bootstrap Notification js-->
	<script
		src="${contextPath}/resources/assets/js/bootstrap-notify.min.js"></script>

	<!-- Theme js-->
	<script src="${contextPath}/resources/assets/js/theme-setting.js"></script>
	<script src="${contextPath}/resources/assets/js/script.js"></script>
	<script src="${contextPath}/resources/js/registerForm.js"></script>

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