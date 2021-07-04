/**
 * 
 */
$(document).ready(()=>{
	let idCheck = 0;
	$('#loginId').on('keyup',function(){
		idCheck = 0;
	});
	$('#idValidBtn').on('click',function(){
		let loginId = $('#loginId').val();
		if(loginId == "") return;
		$.ajax({
         url: "/app/member/idCheck/" + loginId,
            method: "GET"
      }).done(function (data, textStatus, xhr) {
			alert("중복확인 성공!");
            idCheck = 1;
      }).fail(function (data, textStatus, xhr){
		  alert("중복된 아이디입니다!");
      });
	});
	
	$('#registerForm').on('submit',function(e){
		let pw = $("#password").val();
		let pwCheck = $('#passwordCheck').val();
		if(idCheck == 0){
			alert("아이디 중복체크를 해주세요!");
			e.preventDefault();
			return;
		}
		if(pw != pwCheck){
			alert("비밀번호가 일치하지 않습니다!");
			e.preventDefault();
			return;
		}
//		$('#registerForm').submit();
	});
});