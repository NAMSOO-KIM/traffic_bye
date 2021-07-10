<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

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
<title>Multikart - Premium Admin Template</title>

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
<script>
	itemDetailVO = ${itemDetailVO};
</script>
</head>
<body>

	<!-- page-wrapper Start-->
	<div class="page-wrapper">

		<!-- Page Header Start-->
		<div class="page-main-header">
			<div class="main-header-right row">
				<div class="main-header-left d-lg-none w-auto">
					<div class="logo-wrapper">
						<a href="index.html"><img class="blur-up lazyloaded"
							src="${contextPath}/resources/assets/images/dashboard/multikart-logo.png"
							alt=""></a>
					</div>
				</div>
				<div class="mobile-sidebar w-auto">
					<div class="media-body text-end switch-sm">
						<label class="switch"><a href="#"><i
								id="sidebar-toggle" data-feather="align-left"></i></a></label>
					</div>
				</div>
				<div class="nav-right col">
					<ul class="nav-menus">
						<li>
							<form class="form-inline search-form">
								<div class="form-group">
									<input class="form-control-plaintext" type="search"
										placeholder="Search.."><span
										class="d-sm-none mobile-search"><i
										data-feather="search"></i></span>
								</div>
							</form>
						</li>
						<li><a class="text-dark" href="#!"
							onclick="javascript:toggleFullScreen()"><i
								data-feather="maximize-2"></i></a></li>
						<li class="onhover-dropdown"><a class="txt-dark" href="#">
								<h6>EN</h6>
						</a>
							<ul class="language-dropdown onhover-show-div p-20">
								<li><a href="#" data-lng="en"><i
										class="flag-icon flag-icon-is"></i> English</a></li>
								<li><a href="#" data-lng="es"><i
										class="flag-icon flag-icon-um"></i> Spanish</a></li>
								<li><a href="#" data-lng="pt"><i
										class="flag-icon flag-icon-uy"></i> Portuguese</a></li>
								<li><a href="#" data-lng="fr"><i
										class="flag-icon flag-icon-nz"></i> French</a></li>
							</ul></li>
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
													data-feather="shopping-bag"></i></span>Your order ready for
												Ship..!
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
								<img
									class="align-self-center pull-right img-50 rounded-circle blur-up lazyloaded"
									src="${contextPath}/resources/assets/images/dashboard/man.png"
									alt="header-user">
								<div class="dotted-animation">
									<span class="animate-circle"></span><span class="main-circle"></span>
								</div>
							</div>
							<ul class="profile-dropdown onhover-show-div p-20">
								<li><a href="#"><i data-feather="user"></i>Edit Profile</a></li>
								<li><a href="#"><i data-feather="mail"></i>Inbox</a></li>
								<li><a href="#"><i data-feather="lock"></i>Lock Screen</a></li>
								<li><a href="#"><i data-feather="settings"></i>Settings</a></li>
								<li><a href="#"><i data-feather="log-out"></i>Logout</a></li>
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

		<!-- Page Body Start-->
		<div class="page-body-wrapper">

			<!-- Page Sidebar Start-->
			<div class="page-sidebar">
				<div class="main-header-left d-none d-lg-block">
					<div class="logo-wrapper">
						<a href="index.html"><img class="blur-up lazyloaded"
							src="${contextPath}/resources/assets/images/dashboard/multikart-logo.png"
							alt=""></a>
					</div>
				</div>
				<div class="sidebar custom-scrollbar">
					<div class="sidebar-user text-center">
						<div>
							<img class="img-60 rounded-circle"
								src="${contextPath}/resources/assets/images/dashboard/man.png"
								alt="#">
						</div>
						<h6 class="mt-3 f-14">JOHN</h6>
						<p>general manager.</p>
					</div>
					<ul class="sidebar-menu">
						<li><a class="sidebar-header" href="index.html"><i
								data-feather="home"></i><span>Dashboard</span></a></li>
						<li><a class="sidebar-header" href="#"><i
								data-feather="box"></i> <span>Products</span><i
								class="fa fa-angle-right pull-right"></i></a>
							<ul class="sidebar-submenu">
								<li><a href="#"><i class="fa fa-circle"></i> <span>Physical</span>
										<i class="fa fa-angle-right pull-right"></i> </a>
									<ul class="sidebar-submenu">
										<li><a href="category.html"><i class="fa fa-circle"></i>Category</a></li>
										<li><a href="category-sub.html"><i
												class="fa fa-circle"></i>Sub Category</a></li>
										<li><a href="product-list.html"><i
												class="fa fa-circle"></i>Product List</a></li>
										<li><a href="product-detail.html"><i
												class="fa fa-circle"></i>Product Detail</a></li>
										<li><a href="add-product.html"><i
												class="fa fa-circle"></i>Add Product</a></li>
									</ul></li>
								<li><a href="#"><i class="fa fa-circle"></i> <span>Digital</span>
										<i class="fa fa-angle-right pull-right"></i> </a>
									<ul class="sidebar-submenu">
										<li><a href="category-digital.html"><i
												class="fa fa-circle"></i>Category</a></li>
										<li><a href="category-digitalsub.html"><i
												class="fa fa-circle"></i>Sub Category</a></li>
										<li><a href="product-listdigital.html"><i
												class="fa fa-circle"></i>Product List</a></li>
										<li><a href="add-digital-product.html"><i
												class="fa fa-circle"></i>Add Product</a></li>
									</ul></li>
							</ul></li>
						<li><a class="sidebar-header" href=""><i
								data-feather="dollar-sign"></i><span>Sales</span><i
								class="fa fa-angle-right pull-right"></i></a>
							<ul class="sidebar-submenu">
								<li><a href="order.html"><i class="fa fa-circle"></i>Orders</a></li>
								<li><a href="transactions.html"><i class="fa fa-circle"></i>Transactions</a></li>
							</ul></li>
						<li><a class="sidebar-header" href=""><i
								data-feather="tag"></i><span>Coupons</span><i
								class="fa fa-angle-right pull-right"></i></a>
							<ul class="sidebar-submenu">
								<li><a href="coupon-list.html"><i class="fa fa-circle"></i>List
										Coupons</a></li>
								<li><a href="coupon-create.html"><i
										class="fa fa-circle"></i>Create Coupons </a></li>
							</ul></li>
						<li><a class="sidebar-header" href="#"><i
								data-feather="clipboard"></i><span>Pages</span><i
								class="fa fa-angle-right pull-right"></i></a>
							<ul class="sidebar-submenu">
								<li><a href="pages-list.html"><i class="fa fa-circle"></i>List
										Page</a></li>
								<li><a href="page-create.html"><i class="fa fa-circle"></i>Create
										Page</a></li>
							</ul></li>
						<li><a class="sidebar-header" href="media.html"><i
								data-feather="camera"></i><span>Media</span></a></li>
						<li><a class="sidebar-header" href="#"><i
								data-feather="align-left"></i><span>Menus</span><i
								class="fa fa-angle-right pull-right"></i></a>
							<ul class="sidebar-submenu">
								<li><a href="menu-list.html"><i class="fa fa-circle"></i>Menu
										Lists</a></li>
								<li><a href="create-menu.html"><i class="fa fa-circle"></i>Create
										Menu</a></li>
							</ul></li>
						<li><a class="sidebar-header" href=""><i
								data-feather="user-plus"></i><span>Users</span><i
								class="fa fa-angle-right pull-right"></i></a>
							<ul class="sidebar-submenu">
								<li><a href="user-list.html"><i class="fa fa-circle"></i>User
										List</a></li>
								<li><a href="create-user.html"><i class="fa fa-circle"></i>Create
										User</a></li>
							</ul></li>
						<li><a class="sidebar-header" href=""><i
								data-feather="users"></i><span>Vendors</span><i
								class="fa fa-angle-right pull-right"></i></a>
							<ul class="sidebar-submenu">
								<li><a href="list-vendor.html"><i class="fa fa-circle"></i>Vendor
										List</a></li>
								<li><a href="create-vendors.html"><i
										class="fa fa-circle"></i>Create Vendor</a></li>
							</ul></li>
						<li><a class="sidebar-header" href=""><i
								data-feather="chrome"></i><span>Localization</span><i
								class="fa fa-angle-right pull-right"></i></a>
							<ul class="sidebar-submenu">
								<li><a href="translations.html"><i class="fa fa-circle"></i>Translations</a></li>
								<li><a href="currency-rates.html"><i
										class="fa fa-circle"></i>Currency Rates</a></li>
								<li><a href="taxes.html"><i class="fa fa-circle"></i>Taxes</a></li>
							</ul></li>
						<li><a class="sidebar-header" href="reports.html"><i
								data-feather="bar-chart"></i><span>Reports</span></a></li>
						<li><a class="sidebar-header" href=""><i
								data-feather="settings"></i><span>Settings</span><i
								class="fa fa-angle-right pull-right"></i></a>
							<ul class="sidebar-submenu">
								<li><a href="profile.html"><i class="fa fa-circle"></i>Profile</a></li>
							</ul></li>
						<li><a class="sidebar-header" href="invoice.html"><i
								data-feather="archive"></i><span>Invoice</span></a></li>
						<li><a class="sidebar-header" href="login.html"><i
								data-feather="log-in"></i><span>Login</span></a></li>
					</ul>
				</div>
			</div>
			<!-- Page Sidebar Ends-->

			<!-- Right sidebar Start-->
			<div class="right-sidebar" id="right_side_bar">
				<div>
					<div class="container p-0">
						<div class="modal-header p-l-20 p-r-20">
							<div class="col-sm-8 p-0">
								<h6 class="modal-title font-weight-bold">FRIEND LIST</h6>
							</div>
							<div class="col-sm-4 text-end p-0">
								<i class="me-2" data-feather="settings"></i>
							</div>
						</div>
					</div>
					<div class="friend-list-search mt-0">
						<input type="text" placeholder="search friend"><i
							class="fa fa-search"></i>
					</div>
					<div class="p-l-30 p-r-30">
						<div class="chat-box">
							<div class="people-list friend-list">
								<ul class="list">
									<li class="clearfix"><img
										class="rounded-circle user-image blur-up lazyloaded"
										src="${contextPath}/resources/assets/images/dashboard/user.png"
										alt="">
										<div class="status-circle online"></div>
										<div class="about">
											<div class="name">Vincent Porter</div>
											<div class="status">Online</div>
										</div></li>
									<li class="clearfix"><img
										class="rounded-circle user-image blur-up lazyloaded"
										src="${contextPath}/resources/assets/images/dashboard/user1.jpg"
										alt="">
										<div class="status-circle away"></div>
										<div class="about">
											<div class="name">Ain Chavez</div>
											<div class="status">28 minutes ago</div>
										</div></li>
									<li class="clearfix"><img
										class="rounded-circle user-image blur-up lazyloaded"
										src="${contextPath}/resources/assets/images/dashboard/user2.jpg"
										alt="">
										<div class="status-circle online"></div>
										<div class="about">
											<div class="name">Kori Thomas</div>
											<div class="status">Online</div>
										</div></li>
									<li class="clearfix"><img
										class="rounded-circle user-image blur-up lazyloaded"
										src="${contextPath}/resources/assets/images/dashboard/user3.jpg"
										alt="">
										<div class="status-circle online"></div>
										<div class="about">
											<div class="name">Erica Hughes</div>
											<div class="status">Online</div>
										</div></li>
									<li class="clearfix"><img
										class="rounded-circle user-image blur-up lazyloaded"
										src="${contextPath}/resources/assets/images/dashboard/man.png"
										alt="">
										<div class="status-circle offline"></div>
										<div class="about">
											<div class="name">Ginger Johnston</div>
											<div class="status">2 minutes ago</div>
										</div></li>
									<li class="clearfix"><img
										class="rounded-circle user-image blur-up lazyloaded"
										src="${contextPath}/resources/assets/images/dashboard/user5.jpg"
										alt="">
										<div class="status-circle away"></div>
										<div class="about">
											<div class="name">Prasanth Anand</div>
											<div class="status">2 hour ago</div>
										</div></li>
									<li class="clearfix"><img
										class="rounded-circle user-image blur-up lazyloaded"
										src="${contextPath}/resources/assets/images/dashboard/designer.jpg"
										alt="">
										<div class="status-circle online"></div>
										<div class="about">
											<div class="name">Hileri Jecno</div>
											<div class="status">Online</div>
										</div></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Right sidebar Ends-->

			<div class="page-body">

				<!-- Container-fluid starts-->
				<div class="container-fluid">
					<div class="page-header">
						<div class="row">
							<div class="col-lg-6">
								<div class="page-header-left">
									<h3>
										Add Products <small>Multikart Admin panel</small>
									</h3>
								</div>
							</div>
							<div class="col-lg-6">
								<ol class="breadcrumb pull-right">
									<li class="breadcrumb-item"><a href="index.html"><i
											data-feather="home"></i></a></li>
									<li class="breadcrumb-item">Digital</li>
									<li class="breadcrumb-item active">Add Product</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
				<!-- Container-fluid Ends-->

				<!-- Container-fluid starts-->
				<div class="container-fluid">
					<div class="row product-adding">
						<div class="col-xl-6">
							<div class="card">
								<div class="card-header">
									<h5>가격 및 이미지</h5>
								</div>
								<div class="card-body">
									<div class="digital-add needs-validation">
										<div class="form-group">
											<label for="validationCustom01" class="col-form-label pt-0"><span>*</span>
												상품명</label> <input class="form-control" id="name" type="text"
												required="required" name="name">
										</div>
										<div class="form-group" id="categories">
											<label class="col-form-label"><span>*</span> 카테고리</label> <select
												class="custom-select form-control" required="required"
												name="bigCategory" id="bigCategory">
												<option value="">대분류</option>
												<c:forEach var="item" items="${bigCategories}">
												    <option value="${item.id}">${item.name}</option>
												</c:forEach>
											</select> <select class="custom-select form-control"
												required="required" name="midCategory" id="midCategory">
												<option value="">중분류</option>
												<c:forEach var="item" items="${midCategories}">
												    <option value="${item.id}">${item.name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label class="col-xl-3 col-sm-4 mb-0">재고 :</label>
											<div class="input-group">
												<input class="touchspin" type="text" value="1"
													style="text-align: center;" name="stock" id="stock">
											</div>
										</div>
										<div class="form-group">
											<label for="validationCustom02" class="col-form-label"><span>*</span>
												가격</label> <input class="form-control" id="price" type="text"
												required="required" name="price">
										</div>

										<label class="col-form-label pt-0"> 대표 이미지</label>
										<form class="dropzone digits" id="repreFileUpload" action="">
											<div class="dz-message needsclick">
												<i class="fa fa-cloud-upload"></i>
												<h4 class="mb-0 f-w-600">파일을 드래그 하거나 클릭해서 업로드하세요!</h4>
											</div>
										</form>
										<label class="col-form-label pt-0"> 추가 이미지</label>
										<form class="dropzone digits" id="anotherFileUpload" action="">
											<div class="dz-message needsclick">
												<i class="fa fa-cloud-upload"></i>
												<h4 class="mb-0 f-w-600">파일을 드래그 하거나 클릭해서 업로드하세요!</h4>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card">
								<div class="card-header">
									<h5>상품 설명</h5>
								</div>
								<div class="card-body">
									<div class="digital-add needs-validation">
										<div class="form-group mb-0">
											<div class="description-sm">
												<textarea id="editor1" name="editor1" cols="10" rows="50"></textarea>
											</div>
										</div>
									</div>
									<div class="digital-add needs-validation">
										<div class="form-group">
											<div class="product-buttons text-center">
												<button type="button" class="btn btn-primary"
													id="addProduct">등록</button>
												<button type="button" class="btn btn-light">취소</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Container-fluid Ends-->

			</div>

			<!-- footer start-->
			<footer class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6 footer-copyright">
							<p class="mb-0">Copyright 2019 © Multikart All rights
								reserved.</p>
						</div>
						<div class="col-md-6">
							<p class="pull-right mb-0">
								Hand crafted & made with<i class="fa fa-heart"></i>
							</p>
						</div>
					</div>
				</div>
			</footer>
			<!-- footer end-->

		</div>

	</div>

	<!-- latest jquery-->
	<script src="${contextPath}/resources/assets/js/jquery-3.3.1.min.js"></script>

	<!-- Bootstrap js-->
	<script
		src="${contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>

	<!-- feather icon js-->
	<script
		src="${contextPath}/resources/assets/js/icons/feather-icon/feather.min.js"></script>
	<script
		src="${contextPath}/resources/assets/js/icons/feather-icon/feather-icon.js"></script>

	<!-- Sidebar jquery-->
	<script src="${contextPath}/resources/assets/js/sidebar-menu.js"></script>

	<!-- touchspin js-->
	<script
		src="${contextPath}/resources/assets/js/touchspin/vendors.min.js"></script>
	<script src="${contextPath}/resources/assets/js/touchspin/touchspin.js"></script>
	<script
		src="${contextPath}/resources/assets/js/touchspin/input-groups.min.js"></script>

	<!--dropzone js-->
	<script src="${contextPath}/resources/assets/js/dropzone/dropzone.js"></script>
	<script
		src="${contextPath}/resources/assets/js/dropzone/dropzone-script.js"></script>

	<!--ckeditor js-->
	<script
		src="${contextPath}/resources/assets/js/editor/ckeditor/ckeditor.js"></script>
	<script
		src="${contextPath}/resources/assets/js/editor/ckeditor/styles.js"></script>
	<script
		src="${contextPath}/resources/assets/js/editor/ckeditor/adapters/jquery.js"></script>
	<script
		src="${contextPath}/resources/assets/js/editor/ckeditor/ckeditor.custom.js"></script>

	<!--Customizer admin-->
	<script src="${contextPath}/resources/assets/js/admin-customizer.js"></script>

	<!-- lazyload js-->
	<script src="${contextPath}/resources/assets/js/lazysizes.min.js"></script>

	<!--right sidebar js-->
	<script src="${contextPath}/resources/assets/js/chat-menu.js"></script>

	<!--script admin-->
	<script src="${contextPath}/resources/assets/js/admin-script.js"></script>

	<script src="${contextPath}/resources/js/updateItem.js"></script>

</body>
</html>
