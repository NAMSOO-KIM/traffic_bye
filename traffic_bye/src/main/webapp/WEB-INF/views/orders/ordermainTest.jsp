<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="memberVO" value="${memberVO}" />
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script>

<body>


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
									<td><a href="#">${cart.name}<input type="hidden"
											name="itemid${status.index}" class="current-item-id"
											value="${cart.item_id}" /></a>
										<div class="mobile-cart-content row">
											<div class="col">
												<div class="qty-box">
													<div class="input-group">
														<input type="text" name="quantity"
															class="form-control input-number"
															value="${cart.quantity}">
													</div>
												</div>
											</div>
											<div class="col">
												<h2 class="td-color">
													<a href="#" class="icon"><i class="ti-close"
														onclick="deleteQuantity('${cart.item_id}')"></i></a>
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
													id="cart-quantity${cart.item_id}"
													class="form-control input-number" value="${cart.quantity}">
												<button class="change-quantity-btn"
													onclick="updateQuantity('${cart.item_id}')">확인</button>
											</div>
										</div>
									</td>
									<td><a href="#" class="icon"><i class="ti-close"
											onclick="deleteQuantity('${cart.item_id}')"></i></a></td>
									<td>
										<h2 class="td-color">${cart.quantity*cart.price}</h2> <c:set
											var="sum" value="${sum + cart.quantity*cart.price}" />
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
					<input type="hidden" id="member_name" value="${memberVO.name}" /> <input
						type="hidden" id="phone_number" value="${memberVO.phone}" /> <input
						type="hidden" id="birth" value="${memberVO.birth}" /> <a href="#"
						class="btn btn-solid">쇼핑 계속하기</a>
				</div>
				<div class="col-6">
					<button class="btn btn-solid" onclick="open_modal();">스마트오더
						주문하기</button>

					<form action="orderInsert" method="post" id="myForm">
						<!-- <button class="btn btn-solid" id="sendBtn" type="hidden">스마트오더 주문하기!</button>  -->
						<!-- <input type="hidden" id="sendBtn"> -->
					</form>

				</div>
			</div>
		</div>
	</section>
	<!--section end-->
	<!-- 내용 시작 -->
	
		<!---------------------------------------------- 카트 수정/삭제 모달 ------------------------------------>

	<style>
#modal-open {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 120px;
	height: 30px;
	margin-top: -15px;
	margin-left: -60px;
	line-height: 15px;
	cursor: pointer;
}
.modal-cart {
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	top: 0;
	left: 0;
	display: none;
}
.modal-content-cart {
	width: 400px;
	height: 200px;
	background: #fff;
	border-radius: 10px;
	position: absolute;
	top: 10%;
	left: 50%;
	margin-top: -100px;
	margin-left: -200px;
	text-align: center;
	box-sizing: border-box;
	padding: 74px 0;
	line-height: 23px;
	cursor: pointer;
}
</style>
	<div class="modal-cart">
		<div id="modal-content-cart" class="modal-content-cart"
			title="클릭하면 창이 닫힙니다."></div>
	</div>
	<!---------------------------------------------- 카트 수정/삭제 끝 ------------------------------------>

	<!-- Button that triggers the popup -->
	<script>
		function deleteQuantity(itemId) {
			let deleteData = "itemId=" + itemId;
			let deletelink = "${contextPath}/deleteQuantity";
			/* 	$('.title-modal').empty();
				$('.content-modal').empty();
				$('.title-modal').append('<h2>장바구니에서 삭제하시겠습니까?</h2>');
				$('.content-modal').append('<button id="yes-btn">Yes</button>&nbsp&nbsp&nbsp<button id="no-btn">No</button>');
			 */
			$('.modal-content-cart').empty();
			$('.modal-content-cart').append('<h2>장바구니에서 삭제하시겠습니까?</h2>');
			$('.modal-content-cart').append('<br><br><br><br><br><button id="yes-btn">Yes</button>&nbsp&nbsp&nbsp<button id="no-btn">No</button>');
			$(function() {
				$(".modal-cart").fadeIn()
				$('#no-btn').click(function() {
					$(".modal-content-cart").fadeOut();
				});

			});
			$('#yes-btn').click(function() {
				$.ajax({
					url : deletelink,
					type : 'post',
					data : deleteData,
					success : function() {
						location.reload();
						console.log('삭제 완료');
					}

				});
			});

		}

		function updateQuantity(itemId) {
			var elId = 'cart-quantity' + itemId;

			var currentQuantity = document.getElementById(elId).value;
			//memberId 세션 있음
			var currentMemberId = '<c:out value="${loginInfo.id}"/>';
			var currentItemId = itemId;
			console.log(currentItemId);
			let currentlink = "${contextPath}/changeQuantity";
			var currentSendData = {
				"currentMemberId" : currentMemberId,
				"currentQuantity" : currentQuantity,
				"currentItemId" : currentItemId
			};
			console.log(currentSendData);
			$('.modal-content-cart').empty();
			$('.modal-content-cart').append('정말로 수량을 변경 하시겠습니까?');
			$('.modal-content-cart').append('<br><br><button id="yes-btn">Yes</button>&nbsp&nbsp&nbsp<button id="no-btn">No</button>');
			$(function() {
				$(".modal-cart").fadeIn()
				$('#no-btn').click(function() {
					$(".modal-content-cart").fadeOut();
				});

			});
			$('#yes-btn').click(function() {
				$.ajax({
					url : currentlink,
					type : 'post',
					data : {
						data : JSON.stringify(currentSendData)
					},
					success : function() {
						location.reload();
						console.log('수정 완료');
					}

				});
			});
			console.log(currentQuantity);
		}

		/* 결제부분  */
		function iamport() {

			let member_name = document.getElementById('member_name').value;
			let phone_number = document.getElementById('phone_number').value;
			let birth = document.getElementById('birth').value;

			console.log(member_name);
			console.log(phone_number);
			console.log(birth);
			let total_price = $
			{
				sum
			}
			;
			console.log(total_price);

			// 가맹점 식별코드
			// IMP.init('imp30146952');
			IMP.init('imp20966089');

			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : member_name + '님의 결제',
				amount : total_price, // 나중에 수정
				// buyer_email : 'iamport@siot.do',
				buyer_name : member_name,
				buyer_tel : phone_number,
			// buyer_addr : '서울특별시 강남구 삼성동',
			// buyer_postcode : '123-456'
			}, function(rsp) {
				if (rsp.success) {
					send();
					alert("결제가 정상적으로 완료되었습니다.");
					$('#myForm').submit();

					console.log(rsp.imp_uid);
					console.log(rsp.merchant_uid);
					console.log(rsp.paid_amount);
					console.log(rsp.apply_num);
					// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						url : "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
						type : 'POST',
						dataType : 'json',
						data : {
							imp_uid : rsp.imp_uid
						// 기타 필요한 데이터가 있으면 추가 전달
						}
					}).done(function(data) {
						// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
						if (everythings_fine) {
							var msg = '결제가 완료되었습니다.';
							msg += '\n고유ID : ' + rsp.imp_uid;
							msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							msg += '\결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;

							alert(msg);
						} else {
							// [3] 아직 제대로 결제가 되지 않았습니다.
							// [4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;

					alert(msg);
				}
			});
		}

		function iamport2() {

			let member_name = document.getElementById('member_name').value;
			let phone_number = document.getElementById('phone_number').value;
			let birth = document.getElementById('birth').value;

			console.log(member_name);
			console.log(phone_number);
			console.log(birth);
			let total_price = $
			{
				sum
			}
			;
			console.log(total_price);

			// 가맹점 식별코드

			IMP.init('imp20966089');

			IMP.request_pay({
				pg : 'html5_inicis', // ActiveX 결제창은 inicis를 사용
				pay_method : 'card', // card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
				merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
				name : member_name + '님의 결제',
				amount : total_price,
				buyer_name : member_name,
				buyer_tel : phone_number,

			}, function(rsp) {
				if (rsp.success) {
					send();
					alert('결제가 정상적으로 완료되었습니다.');
					$('#myForm').submit();

					// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						url : "/payments/complete", // cross-domain error가 발생하지 않도록 주의해주세요
						type : 'POST',
						dataType : 'json',
						data : {
							imp_uid : rsp.imp_uid
						// 기타 필요한 데이터가 있으면 추가 전달
						}
					}).done(function(data) {

						// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
						if (everythings_fine) {
							var msg = '결제가 완료되었습니다.';
							msg += '\n고유ID : ' + rsp.imp_uid;
							msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							msg += '\n결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;

							alert(msg);
						} else {
							// [3] 아직 제대로 결제가 되지 않았습니다.
							// [4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;

					alert(msg);
				}
			});
		}
	</script>


	<script type="text/javascript">
		
	</script>


	<script type="text/javascript">
		var storeList = new Array();
		<c:forEach items="${cartList}" var="storeList">
		storeList.push("${storeList.store_id}");
		</c:forEach>
		storeList = new Set(storeList);
		storeList = Array.from(storeList);
	</script>

	<!-- 모달 세트  시작 -->
	<script type="text/javascript">
		/*
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
			
		 */

		//팝업 Close 기능
		function close_pop(flag) {
			$('#myModal').hide();
		};

		function open_modal() {
			$('#myModal').show();
		};
		/*
		$('#confirmBtn').click(function(){
		receive();
		});
		 */
	</script>

	<!-- 모달 세트  끝 -->

	<!--------------------------------------------결제 모달 시작-------------------------------->

	<style>
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
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
	<div id="myModal" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<p style="text-align: center;">
				<span style="font-size: 14pt;"><b><span
						style="font-size: 24pt;">결제 방법 선택</span></b></span>
			</p>
			<p style="text-align: center; line-height: 1.5;">
				<br />
			</p>
			<p style="text-align: center; line-height: 1.5;">
				<br />
			</p>

			<button class="btn btn-solid" onclick="iamport2();">KG이니시스
				결제</button>
			<br> <br>

			<button class="btn btn-solid" onclick="iamport();">카카오페이
				결제하기</button>
			<p>
				<br />
			</p>
			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onClick="close_pop();">
				<span class="pop_bt" style="font-size: 13pt;"> <a
					id="confirmBtn">닫기</a>
				</span>
			</div>
		</div>
	</div>
	<!--------------------------------------------결제 모달 끝-------------------------------->


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

		/* 결제부분  */
		function iamport() {

			let member_name = document.getElementById('member_name').value;
			let phone_number = document.getElementById('phone_number').value;
			let birth = document.getElementById('birth').value;

			console.log(member_name);
			console.log(phone_number);
			console.log(birth);
			let total_price = $
			{
				sum
			}
			;
			console.log(total_price);

			// 가맹점 식별코드
			// IMP.init('imp30146952');
			IMP.init('imp20966089');

			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : member_name + '님의 결제',
				amount : total_price, // 나중에 수정
				// buyer_email : 'iamport@siot.do',
				buyer_name : member_name,
				buyer_tel : phone_number,
			// buyer_addr : '서울특별시 강남구 삼성동',
			// buyer_postcode : '123-456'
			}, function(rsp) {
				if (rsp.success) {
					send();
					alert("하이");
					$('#myForm').submit();

					console.log(rsp.imp_uid);
					console.log(rsp.merchant_uid);
					console.log(rsp.paid_amount);
					console.log(rsp.apply_num);
					// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						url : "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
						type : 'POST',
						dataType : 'json',
						data : {
							imp_uid : rsp.imp_uid
						// 기타 필요한 데이터가 있으면 추가 전달
						}
					}).done(function(data) {
						// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
						if (everythings_fine) {
							var msg = '결제가 완료되었습니다.';
							msg += '\n고유ID : ' + rsp.imp_uid;
							msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							msg += '\결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;

							alert(msg);
						} else {
							// [3] 아직 제대로 결제가 되지 않았습니다.
							// [4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;

					alert(msg);
				}
			});
		}

		function iamport2() {

			let member_name = document.getElementById('member_name').value;
			let phone_number = document.getElementById('phone_number').value;
			let birth = document.getElementById('birth').value;

			console.log(member_name);
			console.log(phone_number);
			console.log(birth);
			let total_price = $
			{
				sum
			}
			;
			console.log(total_price);

			// 가맹점 식별코드
			// IMP.init('imp30146952');
			IMP.init('imp20966089');
			// let total_price = document.getElementById("total_price").value;
			IMP.request_pay({
				pg : 'html5_inicis', // ActiveX 결제창은 inicis를 사용
				pay_method : 'card', // card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
				merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
				name : '주문명:결제테스트',
				amount : total_price,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678', // 누락되면 이니시스 결제창에서 오류
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456'
			}, function(rsp) {
				if (rsp.success) {
					send();
					// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						url : "/payments/complete", // cross-domain error가 발생하지 않도록 주의해주세요
						type : 'POST',
						dataType : 'json',
						data : {
							imp_uid : rsp.imp_uid
						// 기타 필요한 데이터가 있으면 추가 전달
						}
					}).done(function(data) {

						// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
						if (everythings_fine) {
							var msg = '결제가 완료되었습니다.';
							msg += '\n고유ID : ' + rsp.imp_uid;
							msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							msg += '\n결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;

							alert(msg);
						} else {
							// [3] 아직 제대로 결제가 되지 않았습니다.
							// [4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;

					alert(msg);
				}
			});
		}
	</script>


	<script src="${contextPath}/resources/js/websocket.js"></script>
</body>
</html>