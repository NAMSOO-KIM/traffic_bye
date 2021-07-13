/**
 * 
 */
 
 $(document).ready(function(){
		connect();
		console.log('안녕');
		//$('#sendBtn').click(function(){send();});
		console.log("준비완료");
	});
	
	var wsocket;
	function connect() {
		wsocket = new WebSocket("ws://localhost/app/smartOrder-ws");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function onMessage(evt) {
		console.log("메세지 도착");
   		plusMsg = '';
   		plusMsg += `   <div class="popup">`
           +  '        <a class="closeBtn" >✔</a>'
           +  `      <p class="popup-title">🤞 ${evt.data} 🤞</p> `
         +  `      <p class="popup-content"><a href='/app/member/mypage'>진행상황 보기</a></p>`
         +  '   </div>';
   
   $(".popup-container").append(plusMsg);
   $('.popup' + window.popupId).hide();
   $('.popup' + window.popupId).show("slow");
   
   setTimeout(()=>{
      $('.popup:first').remove();
   }, 5000);
	
		
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
		console.log(wsocket);
		wsocket.send(JSON.stringify(sendData));
	}
	
	
	