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
						<c:set var="sum" value="0" />
						<c:forEach items="${cartList}" var="cart">
							<tr>
								<td><a href="#"><img src="../assets/images/pro3/2.jpg"
										alt=""></a></td>
								<td><a href="#">${cart.name}</a>
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
									<h2>${cart.price}</h2>
								</td>
								<td>
									<div class="qty-box">
										<div class="input-group">
											<input type="number" name="quantity"
												class="form-control input-number" value="${cart.quantity}">
										</div>
									</div>
								</td>
								<td><a href="#" class="icon"><i class="ti-close"></i></a></td>
								<td>
									<h2 class="td-color">${cart.quantity*cart.price}</h2>
									<c:set var="sum" value="${sum + cart.quantity*cart.price}"/>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="table-responsive-md">
						<table class="table cart-table ">
							<tfoot>
								<tr>
									<td>total price :</td>
									<td>
										<h2>${sum}</h2>
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
				<form action="orderInsert" method="post">
					<button class="btn btn-solid" id="sendBtn">스마트오더 주문하기!</button>
				</form>
				</div>
			</div>
		</div>
	</section>
	<!--section end-->
	<!-- 내용 시작 -->
	<script type="text/javascript">
	var storeList = new Array();
	<c:forEach items="${cartList}" var="storeList">
	storeList.push("${storeList.store_id}");
	</c:forEach>
	storeList = new Set(storeList);
	storeList = Array.from(storeList);
	console.log(storeList);
	</script>
	
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
		send();
	}
	function onMessage(evt) {
		$('#myModal').show();
	}
	function onClose(evt) {
		console.log("연결을 끊었습니다.");
	}
	function send() {
		
		//메세지 보낼 스토어아이디는 
		var userId = $('#userId').val();
		wsocket.send("알람가야될 상점 목록:"+storeList);
	}
	connect();
	$(document).ready(function(){
		//var sessionInfo = ${sessionScope.loginInfo};
		
		console.log('안녕');
		/* $('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode=='13'){
				send();
			}
			event.stopPropagation();
		}); */
		$('#sendBtn').click(function(){send();});
		console.log("준비완료");
		$('#exitBtn').click(function(){disconnect();});		
	});
</script>
 <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
</style>
 
 
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">알림</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">주문이 도착했습니다.</span></p>
                <p style="text-align: center; line-height: 1.5;"><b><span style="color: rgb(255, 0, 0); font-size: 14pt;">내용추가</span></b></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">내용추가</span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><br /></span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">내용추가 </span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">내용추가</span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     <a id="confirmBtn">주문 수락</a>
                </span>
            </div>
      </div>
    </div>
        <!--End Modal-->
    <script type="text/javascript">
        //팝업 Close 기능
        function close_pop(flag) {
             $('#myModal').hide();
        };
        
      </script>
 
	<script type="text/javascript">
	$('#confirmBtn').click(function(){
		receive();
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