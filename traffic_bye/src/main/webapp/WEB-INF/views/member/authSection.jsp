<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="register-page section-b-space">
		<div class="container">
			<div class="row" style="text-align: center;">
				<div class="col-lg-12">
					<div class="title2">
						<h2 class="title-inner2">인증방식 선택</h2>
					</div>
					<div>
						<div class="theme-card">
							<div class="auth" id="phoneAuth"
								style="border-left-width: 100px; margin-left: 100px;">
								<img src="${contextPath}/resources/imgs/message.png"
									class="auth_img">
								<div id="phone">
									<h2>휴대폰 인증</h2>
									<!-- 
									<a href="#" class="btn btn-solid me-3" id="phone"></a>
									 -->
								</div>
							</div>
							<div class="auth" id="kakaoAuth">
								<img src="${contextPath}/resources/imgs/Kakao.png"
									class="auth_img">
								<div>
									<h2 id="kakao">카카오 인증</h2>
									<!-- 
									<a href="#" class="btn btn-solid me-3" id="kakao">카카오 인증</a>
									 -->
									 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>