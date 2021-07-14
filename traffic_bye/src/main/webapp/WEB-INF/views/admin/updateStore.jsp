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
	<link rel="icon" href="${contextPath}/resources/imgs/favicon.ico" type="image/x-icon">
<script>
	storeDetailVO = ${storeDetailVO};
</script>
</head>
<body>

	<!-- page-wrapper Start-->
	<div class="page-wrapper">

		<!-- Page Header Start-->
		<jsp:include page="adminHeader.jsp"></jsp:include>
		<!-- Page Header Ends -->

		<!-- Page Body Start-->
		<div class="page-body-wrapper">

			<!-- Page Sidebar Start-->
			<jsp:include page="adminSidebar.jsp"></jsp:include>
			<!-- Page Sidebar Ends-->

			<div class="page-body">

				<!-- Container-fluid starts-->
				<div class="container-fluid">
					<div class="page-header">
						<div class="row">
							<div class="col-lg-6">
								<div class="page-header-left">
									<h3>매장관리</h3>
								</div>
							</div>
							<div class="col-lg-6">
								<ol class="breadcrumb pull-right">
									<li class="breadcrumb-item"><a href="${currentPath}"><i
											data-feather="home"></i></a></li>
									<li class="breadcrumb-item active">매장관리</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
				<!-- Container-fluid Ends-->

				<!-- Container-fluid starts-->
				<div class="container-fluid">
					<div class="row product-adding">

						<div class="card">
							<div class="card-header">
								<h5>매장 정보</h5>
							</div>
							<div class="card-body">
								<div class="digital-add needs-validation">
									<div class="form-group">
										<label for="validationCustom01" class="col-form-label pt-0"><span>*</span>
											매장명</label> <input class="form-control" id="name" type="text"
											required="required" name="name">
									</div>
									<div class="form-group">
										<label for="validationCustom01" class="col-form-label pt-0"><span>*</span>
											실시간 영상 주소</label> <input class="form-control" id="streamingURL" type="text"
											required="required" name="streamingURL">
									</div>
									<div class="form-group">
										<label for="validationCustom01" class="col-form-label pt-0"><span>*</span>
											수용인원</label> <input class="form-control" id="capacity" type="text"
											required="required" name="capacity">
									</div>
									<div class="form-group">
										<label for="validationCustom01" class="col-form-label pt-0"><span>*</span>
											연락처</label> <input class="form-control" id="contact" type="text"
											required="required" name="contact">
									</div>
									<div class="form-group">
										<label for="validationCustom01" class="col-form-label pt-0"><span>*</span>
											위치</label> <input class="form-control" id="location" type="text"
											required="required" name="location">
									</div>
									<label class="col-form-label pt-0">대표 이미지</label>
									<form class="dropzone digits" id="repreFileUpload" action="">
										<div class="dz-message needsclick">
											<i class="fa fa-cloud-upload"></i>
											<h4 class="mb-0 f-w-600">파일을 드래그 하거나 클릭해서 업로드하세요!</h4>
										</div>
									</form>
								</div>
								<div class="digital-add needs-validation">
									<div class="form-group mb-0">
										<label for="validationCustom01" class="col-form-label pt-0"><span>*</span>
											매장설명</label>
										<div class="description-sm">
											<textarea id="editor1" name="editor1" cols="10" rows="50"></textarea>
										</div>
									</div>
								</div>
								<div class="digital-add needs-validation">
									<div class="form-group">
										<div class="product-buttons text-center">
											<button type="button" class="btn btn-primary" id="updateStore">등록</button>
											<button type="button" class="btn btn-light">취소</button>
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
			<jsp:include page="adminFooter.jsp"></jsp:include>
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
	<%-- <script src="${contextPath}/resources/assets/js/admin-customizer.js"></script> --%>

	<!-- lazyload js-->
	<script src="${contextPath}/resources/assets/js/lazysizes.min.js"></script>

	<!--right sidebar js-->
	<script src="${contextPath}/resources/assets/js/chat-menu.js"></script>

	<!--script admin-->
	<script src="${contextPath}/resources/assets/js/admin-script.js"></script>

	<script src="${contextPath}/resources/js/updateStore.js"></script>

</body>
</html>
