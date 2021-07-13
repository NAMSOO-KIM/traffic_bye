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
<title>현대백화점 면세점</title>

 <!-- latest jquery-->
    <script src="${contextPath}/resources/assets/js/jquery-3.3.1.min.js"></script>
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
						<h2>마이페이지</h2>
					</div>
				</div>
				<div class="col-sm-6">
					<nav aria-label="breadcrumb" class="theme-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active" aria-current="page">마이페이지</li>
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
								<li class="active"><a href="${contextPath}/member/mypage/myinfo">정보 수정</a></li>
								<li><a href="${contextPath}/member/mypage/orders">주문 내역</a></li>
								<li class="last"><a href="${contextPath}/member/mypage/withdrawal">회원 탈퇴</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<!-- tracking page start -->
	<section class="tracking-page section-b-space">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="title1">
 					<h4>안녕하세요. ${loginInfo.memberName}</h4>
 					<h2 class="title-inner1">최근 스마트 오더 상황판</h2>
					</div>
					<!-- 여기 부터 -->
					<c:forEach items="${list}" var="detailList">
					<div class="row border-part">
						<div class="col-xl-2 col-md-3 col-sm-4">
							<div class="product-detail">
								<img src="${detailList.itemImg}"
									class="img-fluid blur-up lazyload" alt="">
							</div>
						</div>
						<div class="col-xl-4 col-lg-5 col-sm-8">
							<div class="tracking-detail">
								<ul>
									<li>
										<div class="left">
											<span>스토어 이름 :</span>
										</div>
										<div class="right">
											<span>${detailList.storeName}</span>
										</div>
										<br>
									</li>
									<li>
										<div class="left">
											<span>상품 :</span>
										</div>
										<div class="right">
											<span>${detailList.itemName}</span>
										</div>
										<br>
									</li>
									<li>
										<div class="left">
											<span>주문 날짜 :</span>
										</div>
										<div class="right">
											<span>${detailList.paymentDate}</span>
										</div>
										<br>
									</li>
								</ul>
							</div>
						</div>
						 <div class="col-xl-5 col-lg-4">
                          	<div class="tracking-detail">
								<ul>
									<li>
										<div class="left">
											<span>주문 수량 :</span>
										</div>
										<div class="right">
											<span>${detailList.quantity}</span>
										</div>
										<br>
									</li>
									<li>
										<div class="left">
											<span>가격 :</span>
										</div>
										<div class="right">
											<span>$${detailList.price}</span>
										</div>
										<br>
									</li>
									
									<li>
										<div class="left">
											<span>결제 금액 :</span>
										</div>
										<br>
										<br>
										<div class="right">
											<span>$${detailList.totalPrice}</span>
										</div>
									</li>
									<li>
										<div class="left">
											<span>스마트 오더 진행 상황</span>
										</div>
										<div class="right">
												<div class="title1 title-fancy">
												 <h4 class="title-inner1 title-gradient mb-0"><c:choose>
												<c:when test="${detailList.detailStatus eq '0'}">수락 대기</c:when>
												<c:when test="${detailList.detailStatus eq '1'}">주문 수락</c:when>
												<c:when test="${detailList.detailStatus eq '2'}">준비 완료</c:when>
												<c:otherwise>수령완료</c:otherwise>
												</c:choose></h4>
												</div>
										</div>
									</li>
								</ul>
							</div>
                        </div>
					</div>
					</c:forEach>
					<!-- 여기 까지가 한칸 -->
					  <div class="wrapper">
					  <div class="title2">
 					<!-- 	<h2 class="title-inner2">스마트 오더 전체 진행상황</h2> -->
						</div>
                        <div class="arrow-steps clearfix">
                            <div class="step" id="status1"> <span> 수락 대기</span> </div>
                            <div class="step" id="status2"> <span>주문 수락</span> </div>
                            <div class="step" id="status3"><span> 준비 완료</span> </div>
                            <div class="step" id="status4"><span> 수령 완료</span> </div>
                        </div>
                    </div>     
                   
                   <c:set var="myList" value="${list}"/>
                    <script type="text/javascript">
                	$(document).ready(function() {
                		var currentStatus = '<c:out value="${myList[0].totalStatus}"/>';
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