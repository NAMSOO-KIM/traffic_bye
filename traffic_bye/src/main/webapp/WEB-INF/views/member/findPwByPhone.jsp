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
					<h3>휴대폰 인증</h3>
					<div class="theme-card">
						<label for="phone">휴대폰 번호</label> <input type="text" id="phoneNum"
							required="required" placeholder="번호를 입력하세요"> <input
							type="button" id="sendSMS" value="인증번호 전송">
						<form action="${contextPath}/member/auth/findPw/phone/check"
							id="phoneCheck">
							<input type="text" name="loginId" placeholder="비밀번호를 찾을 아이디를 입력하세요">
							<input type="text" name="randomNumber"> <input
								type="hidden" id="phone" name="phone"> <input
								type="submit" value="입력">
						</form>
						<p id="certTimer"></p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--Section ends-->

	<jsp:include page="../footer.jsp"></jsp:include>

	<script src="${contextPath}/resources/js/findPwByPhone.js"></script>



</body>
</html>

