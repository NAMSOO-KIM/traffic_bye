<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="currentPath"
	value="${contextPath}/admin/${loginInfo.storeId}" />
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
<title>현대백화점 면세점 관리자 페이지</title>

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

<!-- ico-font-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/icofont.css">

<!-- Prism css-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/prism.css">

<!-- Chartist css -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/assets/css/vendors/chartist.css">


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
		<jsp:include page="adminHeader.jsp"></jsp:include>
		<!-- Page Header Ends -->

		<!-- Page Body Start-->
		<div class="page-body-wrapper">

			<!-- Page bar Start-->
			<jsp:include page="adminSidebar.jsp"></jsp:include>
			<!-- Page bar Ends-->


			<div class="page-body">

				<!-- Container-fluid starts-->
				<div class="container-fluid">
					<div class="page-header">
						<div class="row">
							<div class="col-xl-3 col-md-6 xl-50">
								<div class="card o-hidden widget-cards">
									<div class="bg-warning card-body">
										<div class="media static-top-widget row">
											<div class="icons-widgets col-4">
												<div class="align-self-center text-center">
													<i data-feather="navigation" class="font-warning"></i>
												</div>
											</div>
											<div class="media-body col-8">
												<span class="m-0">수락 대기</span>
												<h3 class="mb-0">
													<span class="counter">${storeStatus[0].cnt}건</span><small
														class="monthDate">${month}월</small>
												</h3>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-md-6 xl-50">
								<div class="card o-hidden  widget-cards">
									<div class="bg-secondary card-body">
										<div class="media static-top-widget row">
											<div class="icons-widgets col-4">
												<div class="align-self-center text-center">
													<i data-feather="box" class="font-secondary"></i>
												</div>
											</div>
											<div class="media-body col-8">
												<span class="m-0">주문 수락</span>
												<h3 class="mb-0">
													<span class="counter">${storeStatus[1].cnt}건</span><small
														class="monthDate">${month}월</small>
												</h3>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-md-6 xl-50">
								<div class="card o-hidden widget-cards">
									<div class="bg-primary card-body">
										<div class="media static-top-widget row">
											<div class="icons-widgets col-4">
												<div class="align-self-center text-center">
													<i data-feather="message-square" class="font-primary"></i>
												</div>
											</div>
											<div class="media-body col-8">
												<span class="m-0">준비 완료</span>
												<h3 class="mb-0">
													<span class="counter">${storeStatus[2].cnt}건</span><small
														class="monthDate">${month}월</small>
												</h3>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-md-6 xl-50">
								<div class="card o-hidden widget-cards">
									<div class="bg-danger card-body">
										<div class="media static-top-widget row">
											<div class="icons-widgets col-4">
												<div class="align-self-center text-center">
													<i data-feather="users" class="font-danger"></i>
												</div>
											</div>
											<div class="media-body col-8">
												<span class="m-0">수령 완료</span>
												<h3 class="mb-0">
													<span class="counter">${storeStatus[3].cnt}건</span><small
														class="monthDate">${month}월</small>
												</h3>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-6">
								<div class="page-header-left">
									<h3>주문관리</h3>
								</div>
							</div>
							<div class="col-lg-6">
								<ol class="breadcrumb pull-right">
									<li class="breadcrumb-item"><a href="${currentPath}"><i
											data-feather="home"></i></a></li>
									<li class="breadcrumb-item active">주문관리</li>
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
													<td><span class="badge badge-secondary"> <c:choose>
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
		<!-- 모달 실험 시작 -->
		
		
<button id="modal-on">클릭</button>
<div class="modal" tabindex="-1" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
       <!--  <h5 class="modal-title">알림 제목이 들어갑니다.</h5> -->
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">✖</button>
      </div>
      <div class="modal-body">
       <!--  <p>여기에 알림 내용이 들어갑니다.</p> -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

var myModal = document.getElementById('myModal');
var myInput = document.getElementById('myInput');



myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus()
})
</script>



<!-- 모달 실험 끝 -->
		
		
		
		
			<!--------------------------- 소켓 시작 ---------------------------->
			<script type="text/javascript">
				var auth = '<c:out value="${loginInfo.storeId}"/>';
			</script>


			<!-- footer start-->
			<jsp:include page="adminFooter.jsp"></jsp:include>
			<!-- footer end-->
		</div>

	</div>

	

	<!-- feather icon js-->
	<script
		src="${contextPath}/resources/assets/js/icons/feather-icon/feather.min.js"></script>
	<script
		src="${contextPath}/resources/assets/js/icons/feather-icon/feather-icon.js"></script>

	<!-- bar jquery-->
	<script src="${contextPath}/resources/assets/js/bar-menu.js"></script>

	<!-- Datatable js-->
	<script
		src="${contextPath}/resources/assets/js/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${contextPath}/resources/assets/js/datatables/custom-basic.js"></script>

	<!-- lazyload js-->
	<script src="${contextPath}/resources/assets/js/lazysizes.min.js"></script>

	<!--right bar js-->
	<script src="${contextPath}/resources/assets/js/chat-menu.js"></script>

	<!--script admin-->
	<script src="${contextPath}/resources/assets/js/admin-script.js"></script>

</body>
</html>
