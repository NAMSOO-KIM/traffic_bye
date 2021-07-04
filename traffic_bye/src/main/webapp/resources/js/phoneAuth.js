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
         method: "GET"
      }).done(function (data, textStatus, xhr) {
			count = 180;
			$('#phone').val(phoneNum);
			time = setInterval("timer()", 1000);
      }).fail(function (data, textStatus, xhr){
		  alert("잠시 후에 다시 시도해주세요!");
      });
	});
});

function timer() {
		count -= 1;
		$('#certTimer').html(getTime(count));
		if(count == 0){
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