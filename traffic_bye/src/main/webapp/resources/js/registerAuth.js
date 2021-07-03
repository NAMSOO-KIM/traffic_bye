/**
 * 
 */
 
 $(document).ready(()=>{
	$('#kakaoAuth').on('click',function(){
		location.href="/app/member/login/kakao";
	});
	$('#phoneAuth').on('click',function(){
		location.href="/app/member/login/phone";
	});
});