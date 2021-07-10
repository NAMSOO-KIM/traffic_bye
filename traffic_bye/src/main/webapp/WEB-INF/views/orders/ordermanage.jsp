<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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
<!-- latest jquery-->
<script src="${contextPath}/resources/assets/js/jquery-3.3.1.min.js"></script>

<!-- fly cart ui jquery-->
<script src="${contextPath}/resources/assets/js/jquery-ui.min.js"></script>

<!-- exitintent jquery-->
<script src="${contextPath}/resources/assets/js/jquery.exitintent.js"></script>
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

<!-- Datatables css-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/datatables.css">

<!-- Bootstrap css-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/bootstrap.css">

<!-- App css-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/admin.css">
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
										placeholder="Search${contextPath}/resources"><span
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
												Ship${contextPath}/resources!
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
							<img class="img-60 rounded-circle blur-up lazyloaded"
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
										Orders <small>Multikart Admin panel</small>
									</h3>
								</div>
							</div>
							<div class="col-lg-6">
								<ol class="breadcrumb pull-right">
									<li class="breadcrumb-item"><a href="index.html"><i
											data-feather="home"></i></a></li>
									<li class="breadcrumb-item">Sales</li>
									<li class="breadcrumb-item active">Orders</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
				<!-- Container-fluid Ends-->

				<!-- Container-fluid starts-->
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-header">
									<h5>Manage Order</h5>
								</div>
								<div class="card-body order-datatable">
									<table class="display" id="basic-1">
										<thead>
											<tr>
												<th>주문번호</th>
												<th>주문자 명</th>
												<th>주문 상태</th>
												<th>총 가격</th>
												<th>날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ordersList}" var="list">
												<tr>
													<td>${list.ordersId}</td>
													<td>
														<div class="d-flex">${list.memberName}</div>
													</td>
													<td><span class="badge badge-secondary">
												<c:choose>
												<c:when test="${list.status eq 0}">수락 대기</c:when>
												<c:when test="${list.status eq 1}">주문 수락</c:when>
												<c:when test="${list.status eq 2}">준비 완료</c:when>
												<c:otherwise>수령완료</c:otherwise>
												</c:choose></span></td>
													<td><span class="badge badge-success">${list.amount}</span></td>
													<td>${list.paymentDate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Container-fluid Ends-->
			</div>
			<!--------------------------- 내용 시작 ---------------------------->
		<!-- 모달 세트  시작 -->
<style>
#modal-open{ position:absolute; top:50%; left:50%;
  width:120px; height:30px; margin-top:-15px; margin-left:-60px;
  line-height:15px; cursor:pointer;
}

.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}

.modal-content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:absolute; top:10%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
</style>
<div class="modal">
  <div id="modal-content" class="modal-content" 
       title="클릭하면 창이 닫힙니다."><br>
  </div>
</div>
<!-- 모달 세트  끝 -->
			<!--------------------------- 소켓 시작 ---------------------------->
				<script type="text/javascript">
				var wsocket;
				var auth = '<c:out value="${loginInfo.storeId}"/>';

				function connect() {
					wsocket = new WebSocket("ws://localhost/app/smartOrder-ws");
					wsocket.onmessage = onMessage;
					wsocket.onclose = onClose;
				}

				var receiveData = {};
				
				function onMessage(evt) {
					$('.modal-content').empty();
					$('.modal-content').append(evt.data);
					$(function(){ 
					    $(".modal").fadeIn()
						  $(".modal-content").click(function(){
						    $(".modal").fadeOut();
						  });
						});
				}
				function onClose(evt) {
					console.log("연결을 끊었습니다.");
				}
				
				$(document).ready(function() {
					connect();
					$('#orderId').click(function() {
						console.log('hi');

					});
					

				});
			</script>
			
			<!--------------------------- 소켓 끝 ---------------------------->
			
			<script>
				
				$("#basic-1 tr").click(function() {
					$('#myModalContent').empty();
					var str = ""
					var tdArr = new Array(); // 배열 선언
					var tr = $(this);
					var td = tr.children();
					td.each(function(i) {
						tdArr.push(td.eq(i).text());
					});
					// td.eq(index)를 통해 값을 가져올 수도 있다.
					var orderId = td.eq(0).text();
					var sendData = "orderId="+orderId;
					let link = "${contextPath}/getOrderId";
					$.ajax({
						url : link,
						type : 'post',
						data : sendData,
						success : function(result) {
							console.log(result);
							var memberName = result[0].memberName;
							
							$('#myModalContent').append("<p style='text-align: center;'>"+result[0].memberId+"</p>");
							$('#myModalContent').append("<p style='text-align: center;'>"+result[0].orderId+"</p>");
							for(var i=0;i<result.length;i++){
								//itemName: ~ VO형식으로 출력
								$('#myModalContent').append("<p style='text-align: center;'>"+result[i].itemName+"</p>");
								$('#myModalContent').append("<p style='text-align: center;'>"+result[i].price+"</p>");
							}
							$('#myModalContent').append("&nbsp<button id='acceptBtn'>주문수락</button>&nbsp");
							$('#myModalContent').append("&nbsp<button id='readyBtn'>준비완료</button>&nbsp");
							$('#myModalContent').append("<button id='receiptBtn'>수령완료</button><br><br>");
							$('#myModalContent').append("<button id='closeBtn'>닫기</button>");
							$('#orderModal').show();
							
							$('#closeBtn').click(function(){
								$('#orderModal').hide();
								
							});
							
							var acceptLink = "${contextPath}/orderAccept";
							$('#acceptBtn').click(function(){
								console.log(memberName);
								$.ajax({
									url : acceptLink,
									type : 'post',
									data : sendData,
									success : function(){
										console.log('주문 수락되었습니다.');
										console.log(result);
											
											receiveData.type="accept";
											receiveData.customer = memberName;
											receiveData.auth = auth;
											console.log(receiveData);
											wsocket.send(JSON.stringify(receiveData));
										location.reload();
										$('#orderModal').hide();
									}
									
								});
							});
							var readyLink = "${contextPath}/orderReady";
							$('#readyBtn').click(function(){
								$.ajax({
									url : readyLink,
									type : 'post',
									data : sendData,
									success : function(){
											receiveData.customer = memberName;
											receiveData.auth = auth;
											receiveData.type="ready";
											wsocket.send(JSON.stringify(receiveData));
										    console.log('상품이 준비완료 되었습니다.');	
										location.reload();
										$('#orderModal').hide();
									}
									
								});
							});
							var receiptLink = "${contextPath}/orderReceipt";
							$('#receiptBtn').click(function(){
								$.ajax({
									url : receiptLink,
									type : 'post',
									data : sendData,
									success : function(){
											receiveData.customer = memberName;
											receiveData.auth = auth;
											receiveData.type="receipt";
											wsocket.send(JSON.stringify(receiveData));
											console.log('상품 수령을 완료했습니다.');	
											location.reload();
											$('#orderModal').hide();
									}
									
								});
							});
							
							
							
						}
					});

				});
				
				
			
				
			</script>

		

			<!-- The Modal -->
			<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}

/* The Modal (background) */
.myModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.myModal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}
</style>
<!-- orderModal custom -->
			<div id="orderModal" class="myModal">
				<div class="myModal-content" id="myModalContent">
				</div>
			</div>
			
<!-- orderModal custom -->
			<div id="myModal" class="modal">
				<!-- Modal content -->
				<div class="modal-content">
					<p style="text-align: center;">
						<span style="font-size: 14pt;"><b><span
								style="font-size: 24pt;">알림</span></b></span>
					</p>
					<p style="text-align: center; line-height: 1.5;">
						<br />
					</p>
					<p style="text-align: center; line-height: 1.5;">
						<span style="font-size: 14pt;">주문이 도착했습니다.</span>
					</p>
					<p style="text-align: center; line-height: 1.5;">
						<b><span style="color: rgb(255, 0, 0); font-size: 14pt;">내용추가</span></b>
					</p>
					<p style="text-align: center; line-height: 1.5;">
						<span style="font-size: 14pt;">내용추가</span>
					</p>
					<p style="text-align: center; line-height: 1.5;">
						<span style="font-size: 14pt;"><br /></span>
					</p>
					<p style="text-align: center; line-height: 1.5;">
						<span style="font-size: 14pt;">내용추가 </span>
					</p>
					<p style="text-align: center; line-height: 1.5;">
						<span style="font-size: 14pt;">내용추가</span>
					</p>
					<p style="text-align: center; line-height: 1.5;">
						<br />
					</p>
					<p>
						<br />
					</p>
					<div
						style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
						onClick="close_pop();">
						<span class="pop_bt" style="font-size: 13pt;"> <a
							id="confirmBtn">주문 수락</a>
						</span>
					</div>
					<div
						style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
						onClick="close_pop();">
						<a>X</a>
					</div>
				</div>
			</div>
			<!--End Modal-->

			<script type="text/javascript">
				//팝업 Close 기능
				function close_pop(flag) {
					$('#myModal').hide();
				};
				let link = "${contextPath}/getOrderId";
				$('#confirmBtn').click(function() {
					
				});
			</script>

			<!--------------------------- 내용 끝 ---------------------------->
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

	<!-- Datatable js-->
	<script
		src="${contextPath}/resources/assets/js/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${contextPath}/resources/assets/js/datatables/custom-basic.js"></script>

	<!--Customizer admin-->
	<script src="${contextPath}/resources/assets/js/admin-customizer.js"></script>

	<!-- lazyload js-->
	<script src="${contextPath}/resources/assets/js/lazysizes.min.js"></script>

	<!--right sidebar js-->
	<script src="${contextPath}/resources/assets/js/chat-menu.js"></script>

	<!--script admin-->
	<script src="${contextPath}/resources/assets/js/admin-script.js"></script>

</body>
</html>
