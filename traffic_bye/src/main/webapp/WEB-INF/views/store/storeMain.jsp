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

<!-- prism -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/prism.css">

<!-- App css-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/pages/elements.css">

<style type="text/css">
.custom-select{
	background-color: white;
	text-align: center;
	height: 40px;
	margin: auto;
}
.custom-select:hover{
	background-color: #2b2b2b;
	cursor: pointer;
}
.box{
	border: 1px solid black;
	padding-left: 10px; 
	padding-right: 10px; 
	padding-top: 5px;
	padding-bottom: 5px;
	margin-right: 7px;
	font-weight: bold;
}
.categories:hover{
	border-left: 3px solid #ff4c3b;
	color: #ff4c3b;
}
</style>

</head>

<body class="theme-color-1">


	<jsp:include page="../header.jsp"></jsp:include>

	<c:choose>
		<c:when test="${not empty msg}">
			<script>
				alert("${msg}");
			</script>
		</c:when>
	</c:choose>


	<!-- breadcrumb start -->
	<div class="breadcrumb-section" style="padding-bottom: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="page-title">
						<h2>STORE MAIN</h2>
					</div>
				</div>
				<div class="col-sm-6">
					<nav aria-label="breadcrumb" class="theme-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active">Store</li>
						</ol>
					</nav>
				</div>
				<br /><br />
				
				<div class="row">
					<div class="col-sm-6 col-lg-6 custom-select" id="intro" data-selected="true">
		    			<h3 style="line-height: 1.7;">소개</h3>
		    		</div>
		    		<div class="col-sm-6 col-lg-6 custom-select" id="store" data-selected="false">
		    			<h3 style="line-height: 1.7;">매장안내</h3>
		    		</div>
	    		</div>
	    		
	    		
			</div>
		</div>
	</div>
	<!-- breadcrumb End -->


	<!-- store info start -->
		<div class="container" id="intro-body" style="display:block; padding-top: 30px;">
			<div class="row title title5">
				<h3 style=" margin-bottom: 40px; color: black;">인천공항점</h3>
			</div>
			
			<div class="col-sm-12 col-lg-12" style="padding-bottom: 30px; text-align: center;">
				<img src="${contextPath}/resources/imgs/bg_incheonairport.jpg" style="max-width: 100%; height: auto;" />
			</div>
			
			<div style="padding-bottom: 30px;">
				<h3 style=" margin-bottom: 20px; color: black;">위치</h3>
				<hr />
				
				<div class="row">
					<div class="col-lg-4 col-sm-12" style="padding-bottom: 15px;">
						<span class="box" style="padding-left: 24px; padding-right: 24px;">주소</span>
						<span>인천광역시 중구 공항로 272,인천국제공항 제1터미널</span>
					</div>
					<div class="col-lg-4 col-sm-12" style="padding-bottom: 15px;">
						<span class="box">운영시간</span>
						<span>06:30~21:30(연중무휴)</span>
					</div>
					<div class="col-lg-4 col-sm-12" style="padding-bottom: 15px;">
						<span class="box">대표전화</span>
						<span>1811-6688</span>
					</div>
				</div>
				
				<br />
				
				<div class="col-sm-12 col-lg-12" style="padding-bottom: 30px; text-align: center;">
					<img src="${contextPath}/resources/imgs/pc_incheonairport_map_ko.png" style="max-width: 100%; height: auto;" />
				</div>
			</div>
			
		</div>
	<!-- store info end -->
	
	
	<!-- store announce start -->
		<div class="container" id="store-body" style="display: none; padding-top: 30px;">
			<p>※ 입점 브랜드는 당사 사정에 따라 변동될 수 있습니다.</p>
			<br />
			<h3 style=" margin-bottom: 40px; color: black;">입점 브랜드</h3>
			
			<section class="section-b-space container element-page">
		        <div class="row">
		            <div class="left-sidebar col-lg-3">
		                <a href="#" class="btn btn-solid btn-sm d-lg-none d-inline-block mb-4 element-btn">
		                	<i class="fa fa-bars me-2" aria-hidden="true"></i> all elements
		                </a>
		                <div class="sticky-sidebar">
		                    <div class="collection-mobile-back">
		                        <span class="filter-back"><i class="fa fa-angle-left" aria-hidden="true"></i> back</span>
		                    </div>
		                    <ul class="nav list-unstyled nav-sidebar doc-nav">
		                    	<li class="nav-item direct">
		                            <span class="nav-link active categories" data-categoryid="0">ALL</span>
		                        </li>
		                    	<c:forEach items="${categoryList}" var="category">
		                    		<li class="nav-item direct">
		                            	<span class="nav-link categories" data-categoryid="${category.id}">${category.name}</span>
		                        	</li>
		                    	</c:forEach>
		                    </ul>
		                </div>
		            </div>
		            <div class="col-lg-9 content component-col">
		                <div class="product-wrapper-grid list-view">
								<c:forEach items="${storeList}" var="store">
									<div class="row store-row category-0" id="store-${store.id}" style="border: 0.3px solid #ababab; margin-bottom: 10px; border-radius: 5px; ">
										<div class="col-3" style="display: table;">
											<div class="image-wrapper" style=" padding-bottom: 10px; padding-top: 10px;  display: table-cell; text-align-center; vertical-align: middle;">
												<c:if test="${empty store.thumb_file_url}">
													<img src="${contextPath}/resources/assets/images/icon/logos.png" style="max-width: 100%; height: auto;" />
												</c:if>
												
												<c:if test="${not empty store.thumb_file_url}">
													<img src="${store.thumb_file_url}" style="max-width: 100%; height: auto; "/>
												</c:if>
											</div>
											
											
										</div>
										
										<div class="col-9">
											<div class="content-wrapper" style="padding-bottom: 10px; padding-top: 10px;">
												<p style="font-size: 16px; font-weight: 700; color: black;">${store.name}</p>
												
												<div class="row">
													<div class="col-7">
														<div class="row">
															<div class="col-3">
																<span style="font-size: 12px; font-weight: 700;">영업시간</span>
															</div>
															<div class="col-9">
																<span style="font-size: 12px;">06:30~21:30</span>
															</div>
														</div>
													</div>
													<div class="col-5">
														<div class="row">
															<div class="col-4">
																<span style="font-size: 12px; font-weight: 700;">연락처</span>
															</div>
															<div class="col-8">
																<span style="font-size: 12px;">${store.contact}</span>
															</div>
														</div>
													</div>
												</div>
												<hr style="border-top: 1px dashed #bbb;" />
												
												<div class="row">
													<div class="col-7">
														<div class="row">
															<div class="col-3">
																<span style="font-size: 12px; font-weight: 700;">위치</span>
															</div>
															<div class="col-9">
																<span style="font-size: 12px;">1여객터미널 3층 면세지역 29번 게이트</span>
															</div>
														</div>
													</div>
												</div>
												<hr style="border-top: 1px dashed #bbb;" />
												
												<div class="row">
													<div class="col-7">
														<div class="row">
															<div class="col-3">
																<span style="font-size: 12px; font-weight: 700;">주요상품</span>
															</div>
															<div class="col-9">
																<span style="font-size: 12px;">카테고리명</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										
									</div>
								</c:forEach>
						</div>
		            </div>
		        </div>
		    </section>
		</div>
	<!-- store announce end -->

	<jsp:include page="../footer.jsp"></jsp:include>

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
	<script src="${contextPath}/resources/js/loginForm.js"></script>
	
	<!-- feather icon js-->
	<script src="../assets/js/feather.min.js"></script>

	<script>
		function openSearch() {
			document.getElementById("search-overlay").style.display = "block";
		}

		function closeSearch() {
			document.getElementById("search-overlay").style.display = "none";
		}
		
		$(document).ready(function(){
			$('#intro').data('selected', 'true');
			$('#store').data('selected', 'false');
			$('#intro').css('background-color', '#2b2b2b');
			$('#intro').children().css('color', 'white');
			$('#store').css('background-color', 'white');
			$('#store').children().css('color', 'black');
			
			$('#intro').click(function(){
				$(this).data('selected', 'true');
				$('#store').data('selected', 'false');
				$(this).css('background-color', '#2b2b2b');
				$(this).children().css('color', 'white');
				$('#store').css('background-color', 'white');
				$('#store').children().css('color', 'black');
				$('#store-body').css('display', 'none');
				$('#intro-body').css('display', 'block');
			});
			$('#store').click(function(){
				$(this).data('selected', true);
				$('#intro').data('selected', 'false');
				$(this).css('background-color', '#2b2b2b');
				$(this).children().css('color', 'white');
				$('#intro').css('background-color', 'white');
				$('#intro').children().css('color', 'black');
				$('#intro-body').css('display', 'none');
				$('#store-body').css('display', 'block');
			});
			$('.categories').click(function(){
				$('.categories').attr('class', 'nav-link categories');
				$(this).addClass('active');
				console.log($(this).text() + $(this).data('categoryid'));
				$('.store-row').css('display', 'none');
				$('.category-' + $(this).data('categoryid')).css('display', '');
			});
			
			<c:forEach items="${storeList}" var="store">
				<c:forEach items="${store.categories}" var="storeCategory">
					$('#store-${store.id}').addClass('category-${storeCategory}');
				</c:forEach>
			</c:forEach>
		});
	</script>
</body>

</html>