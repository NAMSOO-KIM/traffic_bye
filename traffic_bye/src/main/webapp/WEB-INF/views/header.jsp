<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- 
<!DOCTYPE html>
<html>
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description" content="multikart">
<meta name="keywords" content="multikart">
<meta name="author" content="multikart">
<link rel="icon" href="${contextPath}/resources/imgs/favicon.ico" type="image/x-icon">
	

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
	
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/modal.css">

<!-- 
<meta charset="UTF-8">
<title>Insert title here</title>
 -->
</head>
<body>
	<div class="popup-container"></div>
	<!-- loader start -->
	<div class="loader_skeleton">
		<div class="top-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
					</div>
					<div class="col-lg-6 text-end">
						<ul class="header-dropdown">
							<li class="mobile-wishlist"><a href="#"><i
									class="fa fa-heart" aria-hidden="true"></i></a></li>
							<li class="onhover-dropdown mobile-account"><i
								class="fa fa-user" aria-hidden="true"></i> My Account</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<header>
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="main-menu">
							<div class="menu-left">
								<div class="navbar">
									<!-- <a href="javascript:void(0)">
										<div class="bar-style">
											<i class="fa fa-bars sidebar-bar" aria-hidden="true"></i>
										</div>
									</a> -->
								</div>
								<div class="brand-logo">

									<a href="${contextPath}"><img
										src="${contextPath}/resources/assets/images/icon/logos2.png"
										class="img-fluid blur-up lazyload" alt=""
										style="width: 179px; height: 34px;"></a>
								</div>
							</div>
							<div class="menu-right pull-right">
								<div>
									<nav>
										<div class="toggle-nav">
											<i class="fa fa-bars sidebar-bar"></i>
										</div>
										<ul class="sm pixelstrap sm-horizontal">
											<li>
												<div class="mobile-back text-end">
													Back<i class="fa fa-angle-right ps-2" aria-hidden="true"></i>
												</div>
											</li>
											<li><a href="${contextPath}">Home</a></li>
											<li><a href="${contextPath}/store">매장
													<!-- <div class="lable-nav">new</div> -->
											</a></li>
											<!-- <li><a href="#">패션</a></li> -->
											<li><a href="#">전자/리빙</a></li>
											<li><a href="#">식품</a></li>
											<li><a href="#">담배/주류</a></li>
										</ul>
									</nav>
								</div>
								<div>
									<div class="icon-nav d-none d-sm-block">
										<ul>
											<li class="onhover-div mobile-search">
												<div>
													<img
														src="${contextPath}/resources/assets/images/icon/search.png"
														onclick="openSearch()" class="img-fluid blur-up lazyload"
														alt=""> <i class="ti-search" onclick="openSearch()"></i>
												</div>
											</li>
											
											<li class="onhover-div mobile-cart">
												<div>
													<img
														src="${contextPath}/resources/assets/images/icon/cart.png"
														class="img-fluid blur-up lazyload" alt=""> <i
														class="ti-shopping-cart"></i>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div class="home-slider">
			<div class="home"></div>
		</div>
		<section class="collection-banner">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="ldr-bg">
							<div class="contain-banner">
								<div>
									<h4></h4>
									<h2></h2>
									<h6></h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="ldr-bg">
							<div class="contain-banner">
								<div>
									<h4></h4>
									<h2></h2>
									<h6></h6>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="container section-b-space">
			<div class="row section-t-space">
				<div class="col-lg-6 offset-lg-3">
					<div class="product-para">
						<p class="first"></p>
						<p class="second"></p>
					</div>
				</div>
				<div class="col-12">
					<div class="no-slider row">
						<div class="product-box">
							<div class="img-wrapper"></div>
							<div class="product-detail">
								<h4></h4>
								<h5></h5>
								<h5 class="second"></h5>
								<h6></h6>
							</div>
						</div>
						<div class="product-box">
							<div class="img-wrapper"></div>
							<div class="product-detail">
								<h4></h4>
								<h5></h5>
								<h5 class="second"></h5>
								<h6></h6>
							</div>
						</div>
						<div class="product-box">
							<div class="img-wrapper"></div>
							<div class="product-detail">
								<h4></h4>
								<h5></h5>
								<h5 class="second"></h5>
								<h6></h6>
							</div>
						</div>
						<div class="product-box">
							<div class="img-wrapper"></div>
							<div class="product-detail">
								<h4></h4>
								<h5></h5>
								<h5 class="second"></h5>
								<h6></h6>
							</div>
						</div>
						<div class="product-box">
							<div class="img-wrapper"></div>
							<div class="product-detail">
								<h4></h4>
								<h5></h5>
								<h5 class="second"></h5>
								<h6></h6>
							</div>
						</div>
						<div class="product-box">
							<div class="img-wrapper"></div>
							<div class="product-detail">
								<h4></h4>
								<h5></h5>
								<h5 class="second"></h5>
								<h6></h6>
							</div>
						</div>
						<div class="product-box">
							<div class="img-wrapper"></div>
							<div class="product-detail">
								<h4></h4>
								<h5></h5>
								<h5 class="second"></h5>
								<h6></h6>
							</div>
						</div>
						<div class="product-box">
							<div class="img-wrapper"></div>
							<div class="product-detail">
								<h4></h4>
								<h5></h5>
								<h5 class="second"></h5>
								<h6></h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- loader end -->


	<!-- header start -->
	<header>
		<div class="mobile-fix-option"></div>
		<div class="top-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
					</div>
					<div class="col-lg-6 text-end">
						<ul class="header-dropdown">
							<li class="mobile-wishlist"><a href="#"><i
									class="fa fa-heart" aria-hidden="true"></i></a></li>
							<li class="onhover-dropdown mobile-account"><i
								class="fa fa-user" aria-hidden="true"></i> My Account
								<ul class="onhover-show-div">
									<s:authorize access="isAnonymous()">
										<li><a href="${contextPath}/member/login">로그인</a></li>
										<li><a href="${contextPath}/member/register/auth">회원가입</a></li>
									</s:authorize>
									<s:authorize access="isAuthenticated()">
										<li><a href="${contextPath}/member/logout">로그아웃</a></li>
										<li><a href="${contextPath}/member/mypage">마이페이지</a></li>
									</s:authorize>
									<s:authorize access="hasAuthority('ADMIN')">
										<li><a href="${contextPath}/admin/${loginInfo.storeId}">매장관리</a></li>
									</s:authorize>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="main-menu">
						<div class="menu-left">
							<div class="navbar">
								<!-- <a href="javascript:void(0)" onclick="openNav()">
									<div class="bar-style">
										<i class="fa fa-bars sidebar-bar" aria-hidden="true"></i>
									</div>
								</a> -->
								<div id="mySidenav" class="sidenav">
									<a href="javascript:void(0)" class="sidebar-overlay"
										onclick="closeNav()"></a>
									<nav>
										<div onclick="closeNav()">
											<div class="sidebar-back text-start">
												<i class="fa fa-angle-left pe-2" aria-hidden="true"></i>
												Back
											</div>
										</div>
										<ul id="sub-menu" class="sm pixelstrap sm-vertical">
											<li><a href="#">clothing</a>
												<ul class="mega-menu clothing-menu">
													<li>
														<div class="row m-0">
															<div class="col-xl-4">
																<div class="link-section">
																	<h5>women's fashion</h5>
																	<ul>
																		<li><a href="#">dresses</a></li>
																		<li><a href="#">skirts</a></li>
																		<li><a href="#">westarn wear</a></li>
																		<li><a href="#">ethic wear</a></li>
																		<li><a href="#">sport wear</a></li>
																	</ul>
																	<h5>men's fashion</h5>
																	<ul>
																		<li><a href="#">sports wear</a></li>
																		<li><a href="#">western wear</a></li>
																		<li><a href="#">ethic wear</a></li>
																	</ul>
																</div>
															</div>
															<div class="col-xl-4">
																<div class="link-section">
																	<h5>accessories</h5>
																	<ul>
																		<li><a href="#">fashion jewellery</a></li>
																		<li><a href="#">caps and hats</a></li>
																		<li><a href="#">precious jewellery</a></li>
																		<li><a href="#">necklaces</a></li>
																		<li><a href="#">earrings</a></li>
																		<li><a href="#">wrist wear</a></li>
																		<li><a href="#">ties</a></li>
																		<li><a href="#">cufflinks</a></li>
																		<li><a href="#">pockets squares</a></li>
																	</ul>
																</div>
															</div>
															<div class="col-xl-4">
																<a href="#" class="mega-menu-banner"><img
																	src="${contextPath}/resources/assets/images/mega-menu/fashion.jpg"
																	alt="" class="img-fluid blur-up lazyload"></a>
															</div>
														</div>
													</li>
												</ul></li>
											<li><a href="#">bags</a>
												<ul>
													<li><a href="#">shopper bags</a></li>
													<li><a href="#">laptop bags</a></li>
													<li><a href="#">clutches</a></li>
													<li><a href="#">purses</a>
														<ul>
															<li><a href="#">purses</a></li>
															<li><a href="#">wallets</a></li>
															<li><a href="#">leathers</a></li>
															<li><a href="#">satchels</a></li>
														</ul></li>
												</ul></li>
											<li><a href="#">footwear</a>
												<ul>
													<li><a href="#">sport shoes</a></li>
													<li><a href="#">formal shoes</a></li>
													<li><a href="#">casual shoes</a></li>
												</ul></li>
											<li><a href="#">watches</a></li>
											<li><a href="#">Accessories</a>
												<ul>
													<li><a href="#">fashion jewellery</a></li>
													<li><a href="#">caps and hats</a></li>
													<li><a href="#">precious jewellery</a></li>
													<li><a href="#">more..</a>
														<ul>
															<li><a href="#">necklaces</a></li>
															<li><a href="#">earrings</a></li>
															<li><a href="#">wrist wear</a></li>
															<li><a href="#">accessories</a>
																<ul>
																	<li><a href="#">ties</a></li>
																	<li><a href="#">cufflinks</a></li>
																	<li><a href="#">pockets squares</a></li>
																	<li><a href="#">helmets</a></li>
																	<li><a href="#">scarves</a></li>
																	<li><a href="#">more...</a>
																		<ul>
																			<li><a href="#">accessory gift sets</a></li>
																			<li><a href="#">travel accessories</a></li>
																			<li><a href="#">phone cases</a></li>
																		</ul></li>
																</ul></li>
															<li><a href="#">belts & more</a></li>
															<li><a href="#">wearable</a></li>
														</ul></li>
												</ul></li>
											<li><a href="#">house of design</a></li>
											<li><a href="#">beauty & personal care</a>
												<ul>
													<li><a href="#">makeup</a></li>
													<li><a href="#">skincare</a></li>
													<li><a href="#">premium beaty</a></li>
													<li><a href="#">more</a>
														<ul>
															<li><a href="#">fragrances</a></li>
															<li><a href="#">luxury beauty</a></li>
															<li><a href="#">hair care</a></li>
															<li><a href="#">tools & brushes</a></li>
														</ul></li>
												</ul></li>
											<li><a href="#">home & decor</a></li>
											<li><a href="#">kitchen</a></li>
										</ul>
									</nav>
								</div>
							</div>
							<div class="brand-logo">
								<a href="${contextPath}/"><img
									src="${contextPath}/resources/assets/images/icon/logos2.png"
									class="img-fluid blur-up lazyload" alt=""
									style="width: 179px; height: 34px;"></a>
							</div>
						</div>
						<div class="menu-right pull-right">
							<div>
								<nav id="main-nav">
									<div class="toggle-nav">
										<i class="fa fa-bars sidebar-bar"></i>
									</div>
									<ul id="main-menu" class="sm pixelstrap sm-horizontal">
										<li>
											<div class="mobile-back text-end">
												Back<i class="fa fa-angle-right ps-2" aria-hidden="true"></i>
											</div>
										</li>
										<li><a href="${contextPath}">Home</a></li>
										
											<li><a href="${contextPath}/store">매장</a>
											
											</li>
											
										<li><a href="${contextPath}/mm/items/list/3">전자/리빙</a>
											<ul>
												<li><a href="${contextPath}/mm/items/list/6">카메라/캠코더

												</a></li>
												<li><a href="${contextPath}/mm/items/list/7">음향기기

												</a></li>
												<li><a href="${contextPath}/mm/items/list/8">가전제품</a>
												</li>
													
													
												<li><a href="${contextPath}/mm/items/list/9">스마트기기/ACC</a>
													</li>
												<li><a href="${contextPath}/mm/items/list/10">노트북/태블릿</a>
													</li>
												<li><a href="${contextPath}/mm/items/list/11">리빙용품</a></li>
												<li><a href="${contextPath}/mm/items/list/12">미용기기/도구</a></li>
												<li><a href="${contextPath}/mm/items/list/13">면도기/칫솔</a></li>
											</ul></li>
											
										<li><a href="${contextPath}/mm/items/list/4">식품</a>
											<ul>
												<li><a href="${contextPath}/mm/items/list/14">건강식품
													</a></li>
												<li><a href="${contextPath}/mm/items/list/15">홍삼/인삼
													</a></li>
												<li><a href="${contextPath}/mm/items/list/16">가공식품</a></li>
											</ul>
										</li>
										
										<li><a href="${contextPath}/mm/items/list/5">담배/주류</a>
											<ul>
												<li><a href="${contextPath}/mm/items/list/1">담배</a>
													</li>
												
												<li><a href="${contextPath}/mm/items/list/2">주류</a>
													</li>
											</ul></li>
									</ul>
								</nav>
							</div>
							<div>
								<div class="icon-nav">
									<ul>
										<li class="onhover-div mobile-search">
											<div>
												<img
													src="${contextPath}/resources/assets/images/icon/search.png"
													onclick="openSearch()" class="img-fluid blur-up lazyload"
													alt=""> <i class="ti-search" onclick="openSearch()"></i>
											</div>
											<div id="search-overlay" class="search-overlay">
												<div>
													<span class="closebtn" onclick="closeSearch()"
														title="Close Overlay">×</span>
													<div class="overlay-content">
														<div class="container">
															<div class="row">
																<div class="col-xl-12">
																	<form>
																		<div class="form-group">
																			<input type="text" class="form-control"
																				id="exampleInputPassword1"
																				placeholder="Search a Product">
																		</div>
																		<button type="submit" class="btn btn-primary">
																			<i class="fa fa-search"></i>
																		</button>
																	</form>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>

										<li class="onhover-div mobile-cart">
											<div>
												<img
													src="${contextPath}/resources/assets/images/icon/cart.png"
													class="img-fluid blur-up lazyload" alt=""> <i
													class="ti-shopping-cart"></i>
											</div>

											<ul class="show-div shopping-cart" id="shopping-cart">

												<!-- ajax 시작 -->
												<s:authorize access="isAnonymous()">
												<li>
							                        <div class="buttons">
							                        	<a href="${contextPath}/member/login">로그인 후 이용할 수 있습니다.</a>
							                        </div>
                        						</li>
												</s:authorize>

											</ul>

										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header end -->
