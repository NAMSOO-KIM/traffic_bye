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
	<link rel="icon" href="${contextPath}/resources/imgs/favicon.ico" type="image/x-icon">
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
      <div class="modal-footer" style="justify-content: center;">
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

<script type="text/javascript">

$("#basic-1 tr")
				.click(
						function() {
							$('.modal-header').empty();
							$('.modal-body').empty();
							$('.modal-footer').empty();
							var str = ""
							var tdArr = new Array(); // 배열 선언
							var tr = $(this);
							var td = tr.children();
							td.each(function(i) {
								tdArr.push(td.eq(i).text());
							});
							// td.eq(index)를 통해 값을 가져올 수도 있다.
							var orderId = td.eq(0).text();
							var sendData = "orderId=" + orderId;
							let link = "${contextPath}/getOrderId";
							$.ajax({	
								url : link,
								type : 'post',
								data : sendData,
								success : function(result) {
											var memberName = result[0].memberName;
											console.log(result);
											$('.modal-header')
													.append(
															'<div class="title1 title5">' +
															 '<h4 >주문자 성함 : '+result[0].memberName+'</h4>' +
															 '<h2 class="title-inner1">주문 번호:'+result[0].orderId+'</h2>' +
															 '<hr role="tournament6">'+
															'</div>');
											for (var i = 0; i < result.length; i++) {
												//itemName: ~ VO형식으로 출력
												$('.modal-body')
														.append(
																"<p style='text-align: center;'> 상품 명 :"
																		+ result[i].itemName
																		+ "</p>");
												$('.modal-body')
														.append(
																"<p style='text-align: center;'> 수량 :"
																		+ result[i].price
																		+ "</p>");
											}
											
											$('.modal-footer')
													.append('&nbsp<button type="button" id ="acceptBtn" class="btn btn-secondary" data-bs-dismiss="modal">주문수락</button>&nbsp');
											$('.modal-footer')
													.append(
															'&nbsp<button type="button" id ="readyBtn" class="btn btn-secondary" data-bs-dismiss="modal">준비완료</button>&nbsp');
											$('.modal-footer')
													.append(
															'&nbsp<button type="button" id ="receiptBtn" class="btn btn-secondary" data-bs-dismiss="modal">수령완료</button>&nbsp');
											$('.modal-footer').css('justify-content', 'center');
											$('#myModal').modal('show');

											var acceptLink = "${contextPath}/orderAccept";
											$('#acceptBtn')
													.click(
															function() {
																console
																		.log(memberName);
																$
																		.ajax({
																			url : acceptLink,
																			type : 'post',
																			data : sendData,
																			success : function() {
																				console
																						.log('주문 수락되었습니다.');
																				console
																						.log(result);

																				receiveData.type = "accept";
																				receiveData.customer = memberName;
																				receiveData.auth = auth;
																				console
																						.log(receiveData);
																				wsocket
																						.send(JSON
																								.stringify(receiveData));
																				location
																						.reload();
																				$(
																						'#myModal')
																						.hide();
																			}

																		});
															});
											var readyLink = "${contextPath}/orderReady";
											$('#readyBtn')
													.click(
															function() {
																$
																		.ajax({
																			url : readyLink,
																			type : 'post',
																			data : sendData,
																			success : function() {
																				receiveData.customer = memberName;
																				receiveData.auth = auth;
																				receiveData.type = "ready";
																				wsocket
																						.send(JSON
																								.stringify(receiveData));
																				console
																						.log('상품이 준비완료 되었습니다.');
																				location
																						.reload();
																				$(
																						'#myModal')
																						.hide();
																			}

																		});
															});
											var receiptLink = "${contextPath}/orderReceipt";
											$('#receiptBtn')
													.click(
															function() {
																$
																		.ajax({
																			url : receiptLink,
																			type : 'post',
																			data : sendData,
																			success : function() {
																				receiveData.customer = memberName;
																				receiveData.auth = auth;
																				receiveData.type = "receipt";
																				wsocket
																						.send(JSON
																								.stringify(receiveData));
																				console
																						.log('상품 수령을 완료했습니다.');
																				location
																						.reload();
																				$(
																						'#myModal')
																						.hide();
																			}

																		});
															});

										}
									});

						});


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
	
	<script>
		$(document).ready(function(){
			$('.sidebar-header').removeClass('active');
			$('.sidebar-manage').addClass('active');
		});
	</script>

</body>
</html>
