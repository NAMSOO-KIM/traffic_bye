/**
 * 
 */
				var wsocket;
	
	
				function connect() {
					wsocket = new WebSocket("ws://localhost/app/smartOrder-ws");
					wsocket.onmessage = onMessage;
					wsocket.onclose = onClose;
				}

				var receiveData = {};

				function onMessage(evt) {
					$('.modal-footer').empty()
					$('.modal-body').empty();
					$('.modal-header').empty();
					$('.modal-header').append(`<div class="title1 title5"><h4 style="align-items: center; color: #000000;">`+evt.data+`번 매장 관리자님!</h4><h4 class="title-inner1">새로운 주문이 들어왔습니다!</h4><hr role="tournament6"></div><br>`);
					$('.modal-body').append(`<a href="${currentPath}">매장관리 이동</a>`);
					$('#myModal').modal('show');
				}
				function onClose(evt) {
					console.log("연결을 끊었습니다.");
				}

				$(document).ready(function() {
					connect();
					
					$('#orderId').click(function() {
						console.log('hi');

					});

				});
	
				
				