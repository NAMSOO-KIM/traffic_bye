/**
 * 
 */
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
		//$('#sendBtn').click(function(){send();});
		console.log("준비완료");
	});