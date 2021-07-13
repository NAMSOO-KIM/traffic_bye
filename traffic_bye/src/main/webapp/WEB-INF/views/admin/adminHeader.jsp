<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Multikart admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Multikart admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="pixelstrap">
<link rel="icon"
	href="${contextPath}/resources/assets/images/dashboard/favicon.png"
	type="image/x-icon">
<link rel="shortcut icon"
	href="${contextPath}/resources/assets/images/dashboard/favicon.png"
	type="image/x-icon">
<title>현대백화점 면세점 관리자페이지</title>

<!-- Google font-->
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Font Awesome-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/fontawesome.css">

<!-- Flag icon-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/flag-icon.css">

<!-- Dropzone css-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/dropzone.css">

<!-- Bootstrap css-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/bootstrap.css">

<!-- App css-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/admin.css">
</head>
<body>
	<!-- Page Header Start-->
	<div class="page-main-header">
		<div class="main-header-right row">
			<div class="main-header-left d-lg-none w-auto">
				<div class="logo-wrapper">
					<%-- <a href="index.html"><img class="blur-up lazyloaded"
						src="${contextPath}/resources/assets/images/icon/logos2.png"
						alt="" style="width: 179px; height: 34px;"></a> --%>
				</div>
			</div>
			<div class="mobile-sidebar w-auto"></div>
			<div class="nav-right col">
				<ul class="nav-menus">
					<li></li>
					<li class="onhover-dropdown"><i data-feather="bell"></i><span
						class="badge badge-pill badge-primary pull-right notification-badge">3</span><span
						class="dot"></span>
						<ul class="notification-dropdown onhover-show-div p-0">
							<li>Notification <span
								class="badge badge-pill badge-primary pull-right">3</span></li>
							<li>
								<div class="media">
									<div class="media-body">
										<h6 class="mt-0">
											<span><i class="shopping-color"
												data-feather="shopping-bag"></i></span>Your order ready for Ship..!
										</h6>
										<p class="mb-0">Lorem ipsum dolor sit amet, consectetuer.</p>
									</div>
								</div>
							</li>
							<li>
								<div class="media">
									<div class="media-body">
										<h6 class="mt-0 txt-success">
											<span><i class="download-color font-success"
												data-feather="download"></i></span>Download Complete
										</h6>
										<p class="mb-0">Lorem ipsum dolor sit amet, consectetuer.</p>
									</div>
								</div>
							</li>
							<li>
								<div class="media">
									<div class="media-body">
										<h6 class="mt-0 txt-danger">
											<span><i class="alert-color font-danger"
												data-feather="alert-circle"></i></span>250 MB trash files
										</h6>
										<p class="mb-0">Lorem ipsum dolor sit amet, consectetuer.</p>
									</div>
								</div>
							</li>
							<li class="bg-light txt-dark"><a href="#">All</a>
								notification</li>
						</ul></li>
					<li><a href="#"><i class="right_side_toggle"
							data-feather="message-square"></i><span class="dot"></span></a></li>
					<li class="onhover-dropdown">
						<div class="media align-items-center">
							<h6 class="mt-3 f-14">${loginInfo.memberName}</h6>
						</div>
						<ul class="profile-dropdown onhover-show-div p-20">
							<li><a href="${contextPath}/member/mypage"><i data-feather="user"></i>마이페이지</a></li>
							<li><a href="${contextPath}/member/logout"><i data-feather="log-out"></i>로그아웃</a></li>
						</ul>
					</li>
				</ul>
				<div class="d-lg-none mobile-toggle pull-right">
					<i data-feather="more-horizontal"></i>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header Ends -->


	<!-- jquery 로딩 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


	<!-- fly cart ui jquery-->
	<script src="${contextPath}/resources/assets/js/jquery-ui.min.js"></script>

	<!-- exitintent jquery-->
	<script src="${contextPath}/resources/assets/js/jquery.exitintent.js"></script>
	<!-- feather icon js-->
	<script
		src="${contextPath}/resources/assets/js/icons/feather-icon/feather.min.js"></script>
	<script
		src="${contextPath}/resources/assets/js/icons/feather-icon/feather-icon.js"></script>

	<!-- Sidebar jquery-->
	<script src="${contextPath}/resources/assets/js/sidebar-menu.js"></script>

	<!--Customizer admin-->
	<%-- 	<script src="${contextPath}/resources/assets/js/admin-customizer.js"></script> --%>

	<!-- lazyload js-->
	<script src="${contextPath}/resources/assets/js/lazysizes.min.js"></script>

	<!--right sidebar js-->
	<script src="${contextPath}/resources/assets/js/chat-menu.js"></script>

	<!--script admin-->
	<script src="${contextPath}/resources/assets/js/admin-script.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>