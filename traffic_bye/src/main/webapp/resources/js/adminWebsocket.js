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
					$('.modal-title').empty();
					$('.modal-header').empty();
					$('.modal-title').append('<div class="title1 title5"><h4>'+evt.data+'번 매장 관리자님!</h4><h2 class="title-inner1">새로운 주문이 들어왔습니다!</h2><hr role="tournament6"></div><br>');
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
				
		$("#basic-1 tr")
						.click(
								function() {
									$('.modal-header').empty();
									$('.modal-body').empty();
									$('.modal-footer').empty();
									var str = ""
									var tdArr = new Array(); // 배열 선언
									var tr = $(this);
									var td = tr.children();
									td.each(function(i) {
										tdArr.push(td.eq(i).text());
									});
									// td.eq(index)를 통해 값을 가져올 수도 있다.
									var orderId = td.eq(0).text();
									var sendData = "orderId=" + orderId;
									let link = "${contextPath}/getOrderId";
									$.ajax({	
										url : link,
										type : 'post',
										data : sendData,
										success : function(result) {
													var memberName = result[0].memberName;
													console.log(result);
													$('.modal-header')
															.append(
																	'<div class="title1 title5">' +
																	 '<h4 >주문자 성함 :'+result[0].memberName+'</h4>' +
																	 '<h2 class="title-inner1">주문 번호:'+result[0].orderId+'</h2>' +
																	 '<hr role="tournament6">'+
																	'</div>');
													for (var i = 0; i < result.length; i++) {
														//itemName: ~ VO형식으로 출력
														$('.modal-body')
																.append(
																		"<p style='text-align: center;'> 상품 명 :"
																				+ result[i].itemName
																				+ "</p>");
														$('.modal-body')
																.append(
																		"<p style='text-align: center;'> 수량 :"
																				+ result[i].price
																				+ "</p>");
													}
													$('.modal-footer')
															.append('&nbsp<button type="button" id ="acceptBtn" class="btn btn-secondary" data-bs-dismiss="modal">주문수락</button>&nbsp');
													$('.modal-footer')
															.append(
																	'&nbsp<button type="button" id ="readyBtn" class="btn btn-secondary" data-bs-dismiss="modal">준비완료</button>&nbsp');
													$('.modal-footer')
															.append(
																	'&nbsp<button type="button" id ="receiptBtn" class="btn btn-secondary" data-bs-dismiss="modal">수령완료</button>&nbsp');
													$('#myModal').modal('show');

													var acceptLink = "${contextPath}/orderAccept";
													$('#acceptBtn')
															.click(
																	function() {
																		console
																				.log(memberName);
																		$
																				.ajax({
																					url : acceptLink,
																					type : 'post',
																					data : sendData,
																					success : function() {
																						console
																								.log('주문 수락되었습니다.');
																						console
																								.log(result);

																						receiveData.type = "accept";
																						receiveData.customer = memberName;
																						receiveData.auth = auth;
																						console
																								.log(receiveData);
																						wsocket
																								.send(JSON
																										.stringify(receiveData));
																						location
																								.reload();
																						$(
																								'#myModal')
																								.hide();
																					}

																				});
																	});
													var readyLink = "${contextPath}/orderReady";
													$('#readyBtn')
															.click(
																	function() {
																		$
																				.ajax({
																					url : readyLink,
																					type : 'post',
																					data : sendData,
																					success : function() {
																						receiveData.customer = memberName;
																						receiveData.auth = auth;
																						receiveData.type = "ready";
																						wsocket
																								.send(JSON
																										.stringify(receiveData));
																						console
																								.log('상품이 준비완료 되었습니다.');
																						location
																								.reload();
																						$(
																								'#myModal')
																								.hide();
																					}

																				});
																	});
													var receiptLink = "${contextPath}/orderReceipt";
													$('#receiptBtn')
															.click(
																	function() {
																		$
																				.ajax({
																					url : receiptLink,
																					type : 'post',
																					data : sendData,
																					success : function() {
																						receiveData.customer = memberName;
																						receiveData.auth = auth;
																						receiveData.type = "receipt";
																						wsocket
																								.send(JSON
																										.stringify(receiveData));
																						console
																								.log('상품 수령을 완료했습니다.');
																						location
																								.reload();
																						$(
																								'#myModal')
																								.hide();
																					}

																				});
																	});

												}
											});

								});
				
				