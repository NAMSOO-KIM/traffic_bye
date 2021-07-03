<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page session="false"%>
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
<!-- latest jquery-->
<script src="${contextPath}/resources/assets/js/jquery-3.3.1.min.js"></script>

<!-- fly cart ui jquery-->
<script src="${contextPath}/resources/assets/js/jquery-ui.min.js"></script>

<!-- exitintent jquery-->
<script src="${contextPath}/resources/assets/js/jquery.exitintent.js"></script>
<script src="${contextPath}/resources/assets/js/exit.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- 내용 입력해주세요 -->
	<!--section start-->
	<section class="cart-section section-b-space">
		<div class="container">
			<div class="row">
				<div class="col-sm-12"></div>
				<div class="col-sm-12 table-responsive-xs">
					<table class="table cart-table">
						<thead>
							<tr class="table-head">
								<th scope="col">상품</th>
								<th scope="col">상품명</th>
								<th scope="col">가격</th>
								<th scope="col">수량</th>
								<th scope="col">삭제</th>
								<th scope="col">총 가격</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="#"><img src="../assets/images/pro3/2.jpg"
										alt=""></a></td>
								<td><a href="#">cotton shirt</a>
									<div class="mobile-cart-content row">
										<div class="col">
											<div class="qty-box">
												<div class="input-group">
													<input type="text" name="quantity"
														class="form-control input-number" value="1">
												</div>
											</div>
										</div>
										<div class="col">
											<h2 class="td-color">$63.00</h2>
										</div>
										<div class="col">
											<h2 class="td-color">
												<a href="#" class="icon"><i class="ti-close"></i></a>
											</h2>
										</div>
									</div></td>
								<td>
									<h2>$63.00</h2>
								</td>
								<td>
									<div class="qty-box">
										<div class="input-group">
											<input type="number" name="quantity"
												class="form-control input-number" value="1">
										</div>
									</div>
								</td>
								<td><a href="#" class="icon"><i class="ti-close"></i></a></td>
								<td>
									<h2 class="td-color">$4539.00</h2>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="table-responsive-md">
						<table class="table cart-table ">
							<tfoot>
								<tr>
									<td>total price :</td>
									<td>
										<h2>$6935.00</h2>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
			<div class="row cart-buttons">
				<div class="col-6">
					<a href="#" class="btn btn-solid">쇼핑 계속하기</a>
				</div>
				<div class="col-6">
					<a href="#" class="btn btn-solid" id="sendBtn">스마트오더 주문하기!</a>
				</div>
			</div>
		</div>
	</section>
	<!--section end-->
	<!-- 내용 시작 -->
	<script type="text/javascript">
	var wsocket;
	function connect() {
		wsocket = new WebSocket("ws://localhost/app/smartOrder-ws");
		wsocket.open = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		wsocket.close();
	}
	function onOpen(evt) {
		appendMessage("연결되었습니다.");
	}
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
		console.log(data);
		plusMsg = '';
		plusMsg += ' <div class="popup">'
	           +'<button class="closeBtn" onClick="closePopup($(this))">X</button>'
	           +'<p class="popup-title">📧새로운 ${command}</p>'
	         +'<p class="popup-content">${senderNick} : ${content}</p>'
	         +'</div>';
		 $(".popup-container").append(plusMsg);
		 $('.popup' + window.popupId).hide();
		   $('.popup' + window.popupId).show("slow");
		   setTimeout(()=>{
			      $('.popup:first').remove();
			   }, 5000);
	}
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}
	function send() {
		//흠... 히든으로 닉네임을 가져온다.
		//주문 들어올때 아이디값 다 넘겨주고
		//센드 할때 받은 아이디값을 주문상태를 넘겨준다.
		var nickname = $('#nickname').val();
		var msg = "상품준비를 해주세요!"
		wsocket.send("1" + ":" + msg);
		//닉네임을 현재는 고정한상태
		$('#message').val("");
	}
	
	function appendMessage(msg){
		$('#chatMessageArea').append(msg+"<br>");
		var chatAreaHeight = $('#chatArea').height();
		var maxScroll = $('#chatMessageArea').height;
		$('#chatArea').scrollTop($('#chatArea')[0].scrollHeight);
	}
	
	
	$(document).ready(function(){
		connect();
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode=='13'){
				send();
			}
			event.stopPropagation();
		});
		
		$('#sendBtn').click(function(){send();});
		console.log("준비완료");
		$('#exitBtn').click(function(){disconnect();});
		
	});
</script>
	<div class="popup-container"></div>


	<!-- 내용 끝 -->
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




	<!-- slick js-->
	<script src="${contextPath}/resources/assets/js/slick.js"></script>

	<!-- menu js-->
	<script src="${contextPath}/resources/assets/js/menu.js"></script>

	<!-- lazyload js-->
	<script src="${contextPath}/resources/assets/js/lazysizes.min.js"></script>

	<!-- Bootstrap js-->
	<script
		src="${contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>

	<!-- Bootstrap Notification js-->
	<script
		src="${contextPath}/resources/assets/js/bootstrap-notify.min.js"></script>

	<!-- Fly cart js-->
	<script src="${contextPath}/resources/assets/js/fly-cart.js"></script>

	<!-- Theme js-->
	<script src="${contextPath}/resources/assets/js/theme-setting.js"></script>
	<script src="${contextPath}/resources/assets/js/script.js"></script>

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