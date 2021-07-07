/**
 * 
 */
$('document').ready(()=>{
	$('#changePw').on('submit', function(e){
		let pw = $('#password').val();
		let pwCheck = $('#passwordCheck').val();
		if(pw != pwCheck){
			alert("비밀번호가 일치하지 않습니다!");
			e.preventDefault();
		}
	});
});