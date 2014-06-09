/**
 * 	회원가입
 */
$(document).ready(function(){
	//가입ok버튼 클릭
	$('#btnRegistOk').click(function(){
		
		if (!(4 <= $('#user_id').val().length && 
			$('#user_id').val().length <= 20)) {
			$('#user_id_msg').html('아이디는 4자이상 20자 이하로 입력하세요');
			$('#user_id').focus();
			return false;
		}
		if ($('#user_email').val().search(/(\S+)@(\S+)\.(\S+)/)){
			$('#user_email_msg').html('이메일 형식을 맞춰주세요. ex.oraclejava@naver.com');
			$('#user_email').focus();
			return false;
		}
		if ($('#user_phone').val().search(/(\S+)-(\S+)-(\S+)/)){
			$('#user_phone_msg').html('전화번호 형식을 맞춰주세요. ex.012-1234-1234');
			$('#user_phone').focus();
			return false;
		}
		if ($('#user_jumin_msg').val().length >= 25) {
			return false;
		}
		
		//$('#frmRegist').attr('action','tests')
		//				.attr('method','get');
		//$('#frmRegist').submit();
	});
	
	//우편번호 검색창
	$('#btnSearchZipcode').click(function(){
		window.open('zipcode','zipcode','width=400,height=400');		
	});
	
	$('#user_pwd').keyup(function(){
		$('#user_pwd_ok').val('');
		$('#user_pwd_ok_msg').html('');
	});
	
	$('#user_pwd_ok').keyup(function(){
		if ($('#user_pwd').val() != '') {	// 비밀번호에 값이 존재
			if ($('#user_pwd_ok').val() == '') {	
				// 비밀번호 확인에 값이 존재하지 않을때
				$('#user_pwd_ok_msg').removeClass();
				$('#user_pwd_ok_msg')
					.html("비밀번호와 일치하게 재 입력하세요.")
					.addClass('msg_ok');
			} else if ($('#user_pwd').val() == $('#user_pwd_ok').val()) { 
				// 비밀번호와 비밀번호 확인이 같으면
				$('#user_pwd_ok_msg').removeClass();				
				$('#user_pwd_ok_msg')
					.html("비밀번호가 맞습니다.")
					.addClass('msg_ok');
			} else {
				$('#user_pwd_ok_msg').removeClass();
				$('#user_pwd_ok_msg')
					.html("비밀번호가 틀립니다.")
					.addClass('msg_warn');
			}
			
		} else {							// 비밀번호에 값이 존재하지 않음
			$('#user_pwd_ok_msg')
				.html("비밀번호를 먼저 입력후 확인하세요")
				.addClass('msg_warn');
		}
	});
	$('#user_jumin2').blur(function(user_jumin1, user_jumin2, user_gender){
		var user_jumin1 = $('#user_jumin1').val();
		var user_jumin2 = $('#user_jumin2').val();
		var today = new Date();
		var currYear = today.getFullYear(); //현재년도
		var birthYear = user_jumin1.substring(0,2); //년도자리 추출
		var flag = user_jumin2.substring(0,1); //성별 추출
		if($('#user_jumin1').val() != '') { //주민번호란에 값이 존재
			if(flag == 1 || flag == 2) {
				birth = 19 + birthYear;
				$('#user_age').val(currYear - birth + 1);
			} else if(flag == 3 || flag == 4) {
				birth = 20 + birthYear;
				$('#user_age').val(currYear - birth + 1);
			}
		}
		if($('#user_jumin2').val() != '') { //주민 뒷자리 입력시 일단 체크 해제
			$('#user_gender_1').attr('checked',false);
			$('#user_gender_2').attr('checked',false);
			if(flag == 1 || flag == 3) {
				$('#user_gender_1').attr('checked',true);
				$('#user_gender_2').attr('checked',false);
			} else {
				$('#user_gender_1').attr('checked',false);
				$('#user_gender_2').attr('checked',true);
			}
		}
	});
});
