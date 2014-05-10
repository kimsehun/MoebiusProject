/**
 *  로그인 js
 */
$(document).ready(function(){
	$('#btnRegist').bind('click',function(){
		location.href='regist';
	});
		
	$('#btnLoginOk').bind('click',function(){
		if($('#user_id').val() == ''){
			alert('아이디를 입력하세요');
			$('#user_id').focus();
			return false;
		}
		if($('#user_pwd').val() == ''){
			alert('비밀번호를 입력하세요');
			$('#user_pwd').focus();
			return false;
		}
	});
});