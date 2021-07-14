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

	<c:choose>
		<c:when test="${not empty msg}">
			<script>
				alert("${msg}");
			</script>
		</c:when>
	</c:choose>

	<!--section start-->
	<section class="register-page section-b-space">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h3>회원가입</h3>
					<div class="theme-card">
						<form class="theme-form" action="${contextPath}/member"
							method="post" id="registerForm">
							<div class="form-row row">
								<div class="col-md-6">
									<label for="loginId">아이디</label> <input type="text"
										class="form-control" id="loginId" placeholder="아이디를 입력하세요"
										required="required" name="loginId"> <input
										type="button" value="중복확인" id="idValidBtn" class="btn btn-solid w-auto">
								</div>
							</div>
							<div class="form-row row">
								<div class="col-md-6">
									<label for="password">비밀번호</label> <input type="password"
										class="form-control" id="password" placeholder="비밀번호를 입력하세요"
										required="required" name="password">
								</div>
							</div>
							<div class="form-row row">
								<div class="col-md-6">
									<label for="passwordCheck">비밀번호 확인</label> <input
										type="password" class="form-control" id="passwordCheck"
										placeholder="비밀번호 확인" required="required">
								</div>
							</div>
							<div class="form-row row">
								<div class="col-md-6">
									<label for="name">이름</label> <input type="text"
										class="form-control" id="name" placeholder="이름을 입력하세요"
										required="required" name="name">
								</div>
							</div>
							<div class="form-row row">
								<div class="col-md-6">
									<label for="birth">생년월일</label> <input type="date"
										class="form-control" id="birth" placeholder="생년월일을 입력하세요"
										required="required" name="birth">
								</div>
							</div>
							<div class="form-row row">
								<div class="col-md-6">
									<label for="phone">휴대폰 번호</label>
									<input type="text" class="form-control" id="phone"
										placeholder="휴대폰 번호를 입력하세요" required="required" name="phone">
								</div>
							</div>
							<div class="form-row row">
								<div class="col-md-6">
									<label for="passport">여권 번호</label> <input type="text"
										class="form-control" id="passport" placeholder="여권 번호를 입력하세요"
										required="required" name="passport">
								</div>
								<div>
									<input type="submit" class="btn btn-solid w-auto" value="가입하기" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--Section ends-->

	<jsp:include page="../footer.jsp"></jsp:include>





	<!-- tap to top start -->
	<div class="tap-top">
		<div>
			<i class="fa fa-angle-double-up"></i>
		</div>
	</div>
	<!-- tap to top end -->


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