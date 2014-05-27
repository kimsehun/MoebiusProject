<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href='<c:url value="/resources/css/board.css"/>'
	type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript" src='<c:url value="/resources/js/regist.js"/>'></script>
<script type="text/javascript">

	function noClick() {
		if (!document.getElementById('user_zipcode').value) {
			alert('아 옆에 누르샘');
		}
	}
	//아이디 중복 체크
	$(document).ready(function() {
		$('#btnidCheck').bind('click', function() {
			var userid = $('#user_id').val();
			var idUrl = '<c:url value="/user/idCheck"/>';
			$.ajax({
				url : idUrl,
				type : 'POST',
				data : {
					user_id : userid
				},
				success : function(data) {
					$('#user_id_msg').html(data.msg);
					
				}
			});
		});
		$('#user_jumin2').blur(function(user_name, user_jumin1, user_jumin2) {
			var user_name = $('#user_name').val();
			var user_jumin1 = $('#user_jumin1').val();
			var user_jumin2 = $('#user_jumin2').val();
			var jmUrl = '<c:url value="/user/Check"/>';
			$.ajax({
				url : jmUrl,
				type : 'POST',
				data : {
					user_name : user_name,
					user_jumin1 : user_jumin1,
					user_jumin2 : user_jumin2
				},
				success : function(data) {
					if(data.result == "true") {
						$('#user_jumin_msg').html(data.msg);
						document.getElementById('btnRegistOk').disabled = false;
					} else {
						$('#user_jumin_msg').html(data.msg);
						document.getElementById('btnRegistOk').disabled = true;
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<form:form action="regist" method="post" commandName="userVO" name="frmRegist">
		<table>
			<caption>회원 가입</caption>
			<tr>
				<th>아이디</th>
					<td>
						<input type="text" name="user_id" id="user_id" autofocus="autofocus" value="${user_id }"/>
						<input type="button" name="check_id" value="ID중복체크" id="btnidCheck" />
						<div id="user_id_msg" class="msg_warn"><form:errors path="user_id" cssClass="msg_warn" /><br/></div> 
					</td>
			</tr>
			<tr>
				<th>비밀번호</th>
					<td>
						<input type="password" name="user_pwd" id="user_pwd" value="${userVO.user_pwd }" /><br/>
						<form:errors path="user_name" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
					<td>
						<input type="password" name="user_pwd_ok" id="user_pwd_ok" /><br/>
						<div id="user_pwd_ok_msg"></div>
					</td>
			</tr>
			<tr>
				<th>이름</th>
					<td>
						<input type="text" name="user_name" id="user_name" value="${userVO.user_name }" /><br/>
						<form:errors path="user_name" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>비밀번호 찾기 질문</th>
					<td>
						<select name="user_pwd_hint" id="user_pwd_hint">
							<option value="color">좋아하는 색깔은?</option>
							<option value="school">초등학교 이름은?</option>
							<option value="name">어머니 성함은?</option>
						</select><br/>
					</td>
			</tr>
			<tr>
				<th>비밀번호 찾기 답</th>
					<td>
						<input type="text" name="user_pwd_answer" class="input_text_300" value="${userVO.user_pwd_answer }" /><br/>
						<form:errors path="user_pwd_answer" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>주민등록번호</th>
					<td>
						<input type="text" name="user_jumin1" id="user_jumin1" value="${userVO.user_jumin1 }" maxlength="6" />-
						<input type="password" name="user_jumin2" id="user_jumin2" value="${userVO.user_jumin2 }" maxlength="7" /><br/>
						<div id="user_jumin_msg" ></div>
					</td>
			</tr>
			<tr>
				<th>나이</th>
					<td>
						<input type="text" name="user_age" id="user_age" readonly="readonly" value="${userVO.user_age }" /><br/>
						<form:errors path="user_age" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>성별</th>
					<td>
						<input type="radio" name="user_gender" id="user_gender_1" value="1" />남자
						<input type="radio" name="user_gender" id="user_gender_2" value="2" />여자
					</td>
			</tr>
			<tr>
				<th>이메일</th>
					<td>
						<input type="text" name="user_email" value="${userVO.user_email }" id="user_email" /><br/>
						<div id="user_email_msg" class="msg_warn">
						<form:errors path="user_email" cssClass="msg_warn" /></div><br/>
					</td>
			</tr>
			<tr>
				<th>전화번호</th>
					<td>
						<input type="text" name="user_phone" value="${userVO.user_phone }" /><br/>
						<form:errors path="user_phone" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>우편번호</th>
					<td>
						<input type="text" name="user_zipcode" class="textZipcode" id="user_zipcode" readonly="readonly" onclick="noClick();" value="${userVO.user_zipcode }"/>
						<input type="button" value="검색" id="btnSearchZipcode" /><br/>
						<form:errors path="user_zipcode" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>주소</th>
					<td>
						<input type="text" name="user_addr1" class="input_text_300" id="user_addr1" value="${userVO.user_addr1 }"/><br/>
						<form:errors path="user_addr1" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>상세 주소</th>
					<td>
						<input type="text" name="user_addr2" class="input_text_300" id="user_addr2" value="${userVO.user_addr2 }"/><br/>
						<form:errors path="user_addr2" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="center">
					<input type="submit" value="가입완료" id="btnRegistOk"  />
					</div>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>