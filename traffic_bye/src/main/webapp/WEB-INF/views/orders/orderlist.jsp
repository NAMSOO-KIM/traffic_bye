<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description" content="multikart">
<meta name="keywords" content="multikart">
<meta name="author" content="multikart">
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
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- 내용 입력해주세요 -->
				<!-- Container-fluid starts-->
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-header">
									<h5>나의 주문 목록</h5>
								</div>
								<div class="card-body order-datatable">
									<table class="display" id="basic-1">
										<thead>
											<tr>
												<th>주문번호</th>
												<th>주문자 출국일</th>
												<th>주문 상태</th>
												<th>총 가격</th>
												<th>결제일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ordersList}" var="list">
												<tr onclick="location.href='${contextPath}/order/orderlist/${list.memberId}/${list.orderId}'" style="cursor:pointer;">
													<td>${list.orderId}</td>
													<td>
														<div class="d-flex">${list.departureDate}</div>
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
				
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src =
                'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js#xfbml=1&version=v2.12&autoLogAppEvents=1';
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