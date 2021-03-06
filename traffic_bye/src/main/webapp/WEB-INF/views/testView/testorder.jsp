<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="memberVO" value="${memberVO}" />
<!DOCTYPE html>




<html>
<jsp:include page="../header.jsp"></jsp:include>
 
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script>

 


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
					<input type="hidden" id="member_name" value="${memberVO.name}"/>
					<input type="hidden" id="phone_number" value="${memberVO.phone}"/>
					<input type="hidden" id="birth" value="${memberVO.birth}"/>
					<button class="btn btn-solid" onclick="iamport2();">KG이니시스 결제</button>
				</div>
				<div class="col-6">
				<button class="btn btn-solid" onclick="open_modal();">스마트오더 주문하기</button>
				<button class="btn btn-solid" onclick="iamport();">카카오페이 결제하기</button>
				
				</div>
				<form action="orderInsert" method="post" id="myForm">
					<!-- <button class="btn btn-solid" id="sendBtn" type="hidden">스마트오더 주문하기!</button>  -->
					<!-- <input type="hidden" id="sendBtn"> -->
				</form>
			</div>
			
		</div>
	</section>
	<!--section end-->
	<!-- 내용 시작 -->
	
	
	<script>

function iamport(){
	
	let member_name = document.getElementById('member_name').value;
	let phone_number = document.getElementById('phone_number').value;
	let birth = document.getElementById('birth').value;
	
	console.log(member_name);
	console.log(phone_number);
	console.log(birth);
	let total_price = ${sum};
	
	
	
	// 가맹점 식별코드
	
	IMP.init('imp20966089');
	
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : member_name+'님의 결제',
	    amount : total_price, // 나중에 수정
	    buyer_name : member_name,
	    buyer_tel : phone_number,
	    
	}, function(rsp) {
	    if ( rsp.success ) {
	    	
	    	alert("하이");
	    	$('#myForm').submit();
	    	
	    	console.log(rsp.imp_uid);
	    	console.log(rsp.merchant_uid);
	    	console.log(rsp.paid_amount);
	    	console.log(rsp.apply_num);
	    	// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid
		    		// 기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	}).done(function(data) {
	    		// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
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

function iamport2(){
	// 가맹점 식별코드
	// IMP.init('imp30146952');
	IMP.init('imp20966089');
	let total_price = document.getElementById("total_price").value;
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
	    if ( rsp.success ) {
	    	// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	    		url: "/payments/complete", // cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid
		    		// 기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	}).done(function(data) {
	    		
	    		// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
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
		$('#element_to_pop_up').append(evt.data);
		 ;(function($) {
		        $(function() {
		            $('#my-button').bind('click', function(e) {
		                e.preventDefault();
		                $('#element_to_pop_up').bPopup({
		                   });
		            });
		            
		         });
		     })(jQuery);
		alert(evt.data+"메세지 도착");
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
	connect();
	$(document).ready(function(){
		//var sessionInfo = ${sessionScope.loginInfo};
		
		connect();
		console.log('안녕');
		// $('#sendBtn').click(function(){send();});
		send();
		console.log("준비완료");
		
		$('#exitBtn').click(function(){disconnect();});	
	});
	
	
</script>
 <style>
 			
        /* The Modal (background) */
        /* Hidden by default */
        /* Stay in place */
        /* Sit on top */
        /* Full width */
        /* Full height */
        /* Enable scroll if needed */
        /* Fallback color */
        /* Black w/ opacity */
        
        .modal {
            display: none; 
            position: fixed; 
            z-index: 1; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgb(0,0,0); 
            background-color: rgba(0,0,0,0.4); 
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
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">결제 방법 선택</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                
                <button class="btn btn-solid" onclick="iamport2();">KG이니시스 결제</button>
                <br>
                <br>
				
                <button class="btn btn-solid" onclick="iamport();">카카오페이 결제하기</button>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     <a id="confirmBtn">닫기</a>
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
        
        function open_modal() {
            $('#myModal').show();
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
    
   

</body>
</html>
