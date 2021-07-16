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
<link rel="icon" href="${contextPath}/resources/imgs/favicon.ico"
	type="image/x-icon">
<title>현대백화점 면세점</title>





</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- thank-you section start -->
	<section class="section-b-space light-layout">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="success-text">
						<img alt="" src="${contextPath}/resources/imgs/dogimg.jpg"
							style="height: 500px; border-radius: 70%;" />
						<br><br>
						<div class="title2">
							<h2>이용해주셔서 감사합니다.</h2>
						<p>항상 웃는 얼굴로 고객과 함께 하겠습니다.</p>
							<h2 class="title-inner2">고객센터 : 1811-6688 /운영시간 09:30~18:30</h2>
						</div>
						<div>
						<a href="${contextPath}/member/mypage" class="btn btn-solid me-3">주문내역</a>
						<a href="${contextPath}" class="btn btn-solid me-3">쇼핑 계속하기</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Section ends -->
	<!-- order-detail section start -->

	<!--section end-->
	<!-- 내용 시작 -->



	<!-- 내용 끝 -->

	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js#xfbml=1&version=v2.12&autoLogAppEvents=1';
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