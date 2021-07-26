/**
 * 
 */
 
 count = 0;
 
$('document').ready(()=>{
	$('#sendSMS').on('click', function(){
		let phoneNum = $('#phoneNum').val();
		if(phoneNum == ""){
			alert("번호를 입력하세요!");
			return;
		}
		$('#phone').val(phoneNum);
		$.ajax({
         url: "/app/member/auth/phone",
         data: {"phoneNum" : phoneNum },
         method: "GET",
         statusCode: {
			409:function(data) {
				alert("이미 가입된 번호입니다!");
			},
			400:function(data){
				alert("잠시 후에 다시 시도하세요!");
			}
		}
      }).done(function (data, textStatus, xhr) {
			alert("인증번호가 발송되었습니다. 인증시간은 3분동안 유효합니다!");
			count = 180;
			$('#sendSMS').attr('disabled', true);
			$('#phone').val(phoneNum);
			time = setInterval("timer()", 1000);
      }).fail(function (data, textStatus, xhr){
      });
	});
});

function timer() {
		count -= 1;
		$('#certTimer').html(getTime(count));
		if(count == 0){
			$('#sendSMS').attr('disabled', false);
			clearInterval(time);
		}
}

function getTime(t){
	let minute = Math.floor(t / 60);
	let res = "";
	let sec = t % 60;
	if(sec < 10) sec = "0" + sec;
	res = `${minute}:${sec}`;
	return res;
}