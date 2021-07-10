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
						<c:forEach items="${cartList}" var="cart" varStatus="status">
							<tr>
								<td><a href="#"><img src="../assets/images/pro3/2.jpg"
										alt=""></a></td>
								<td><a href="#">${cart.name}<input type="hidden" name="itemid${status.index}" class="current-item-id" value="${cart.item_id}"/></a>
									<div class="mobile-cart-content row">
										<div class="col">
											<div class="qty-box">
												<div class="input-group">
													<input type="text" name="quantity"
														class="form-control input-number" value="${cart.quantity}">
												</div>
											</div>
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
											<input type="number" name="quantity" id="cart-quantity${cart.item_id}"
												class="form-control input-number" value="${cart.quantity}">
												<button class="change-quantity-btn" onclick="updateQuantity('${cart.item_id}')">확인</button>
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
	<style>
#element_to_pop_up { 
    background-color:#fff;
    border-radius:15px;
    color:#000;
    display:none; 
    padding:20px;
    min-width:400px;
    min-height: 180px;
}
.b-close{
    cursor:pointer;
    position:absolute;
    right:10px;
    top:5px;
}
</style>
<!-- Button that triggers the popup -->
	<script type="text/javascript">
	
	function updateQuantity(itemId) {
		var elId = 'cart-quantity'+itemId;
		
		var currentQuantity = document.getElementById(elId).value;
		//memberId 세션 있음
		var currentMemberId = '<c:out value="${loginInfo.id}"/>';
		var currentItemId = itemId;
		console.log(currentItemId);
		let currentlink = "${contextPath}/changeQuantity";
		var currentSendData = {"currentMemberId" : currentMemberId,
							    "currentQuantity" : currentQuantity,
							    "currentItemId" : currentItemId};
		console.log(currentSendData);
		
		$('.title-modal').empty();
		$('.content-modal').empty();
		$('.title-modal').append('<h2>정말로 변경하시겠습니까?</h2>');
		$('.content-modal').append('<button id="yes-btn">Yes</button>&nbsp&nbsp&nbsp<button id="no-btn">No</button>');
		   modal.style.display = "flex";
		
		   $('#yes-btn').click(function(){
				$.ajax({
					url : currentlink,
					type : 'post',
					data:{
						data : JSON.stringify(currentSendData)
					},
					success : function(){
						location.reload();
						console.log('수정 완료');
					}
					
				});
		   });
		   
		   
		   $('#no-btn').click(function(){
			   modal.style.display = "none"
		   });

		
		console.log(currentQuantity);
		
	}
	</script>


	<div id="element_to_pop_up">
    <a class="b-close">닫기<a/>
	</div>
	<script type="text/javascript">
	var storeList = new Array();
	<c:forEach items="${cartList}" var="storeList">
	storeList.push("${storeList.store_id}");
	</c:forEach>
	storeList = new Set(storeList);
	storeList = Array.from(storeList);
	</script>
	<script type="text/javascript" src=" https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js "></script>
	<script type="text/javascript">
	var wsocket;
	var customer = '<c:out value="${loginInfo.loginId}"/>';
	var memberId = '<c:out value="${loginInfo.id}"/>';
	var auth = '<c:out value="${loginInfo.storeId}"/>';
	var sendData = {};
	sendData.customer = customer;
	sendData.storeList= storeList;
	sendData.type = "order";
	sendData.auth=auth;
	console.log(sendData);
	console.log(sendData.customer);
	function connect() {
		wsocket = new WebSocket("ws://localhost/app/smartOrder-ws");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function onMessage(evt) {
		console.log("메세지 도착");
		$('.title-modal').empty();
		$('.content-modal').empty();
		$('.title-modal').append('<h2>제목</h2>');
		$('.content-modal').append(evt.data);
		   modal.style.display = "flex";
	}
	function onOpen(){
		console.log('hi');
	}
	
	function onClose(evt) {
		console.log("연결을 끊었습니다.");
	}
	function send() {
		wsocket.send(JSON.stringify(sendData));
	}
	
	
	$(document).ready(function(){
		connect();
		console.log('안녕');
		$('#sendBtn').click(function(){send();});
		console.log("준비완료");
	});
	
</script>
	<!-- 모달 세트  시작 -->
	<style>
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: rgba(69, 139, 197, 0.70);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
</style>
	<div id="container">
		<div id="lorem-ipsum"></div>
	</div>
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title-modal">
			</div>
			<div class="close-area">X</div>
			<div class="content-modal">
			</div>
		</div>
	</div>
	<script>
   
    </script>

	<script type="text/javascript">
	var modal = document.getElementById("modal");
	
	const closeBtn = modal.querySelector(".close-area");
	closeBtn.addEventListener("click", e => {
	    modal.style.display = "none"
	});
	
	modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none"
    }
});

window.addEventListener("keyup", e => {
    if(modal.style.display === "flex" && e.key === "Escape") {
        modal.style.display = "none"
    }
});
	function isModalOn() {
    return modal.style.display === "flex"
}
	</script>

	<!-- 모달 세트  끝 -->

	



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