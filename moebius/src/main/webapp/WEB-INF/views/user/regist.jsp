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
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/regist.js"/>"></script>
<script type="text/javascript">
function noClick() {
	if(!document.getElementById('user_zipcode').value) {
		alert('아 옆에 누르샘');
	}
}
</script>
</head>
<body>
	<form:form action="regist" method="post" commandName="userVO" id="frmRegist">
		<table align="center">
			<caption><h1>회원 가입</h1></caption>
			<tr>
				<th>아이디</th>
					<td>
						<input type="text" name="user_id" id="user_id" autofocus="autofocus" value="${userVO.user_id }"/>
						<input type="button" name="check_id" value="ID중복체크" id="btnidCheck" />
						<div id="user_id_msg" calss="msg_warn"><form:errors path="user_id" cssClass="msg_warn" /><br/></div> 
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
						<input type="password" name="user_pwd_confirm" id="user_pwd_confirm" /><br/>
						<div id="user_pwd_confirm_msg"></div>
					</td>
			</tr>
			<tr>
				<th>이름</th>
					<td>
						<input type="text" name="user_name" value="${userVO.user_name}" /><br/>
						<form:errors path="user_name" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>비밀번호 찾기 질문</th>
					<td>
						<input type="text" name="user_pwd_hint" class="input_text_300" value="${userVO.user_pwd_hint }" /><br/>
						<form:errors path="user_pwd_hint" cssClass="msg_warn" /><br/>
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
				<th>나이</th>
					<td>
						<input type="text" name="user_age" value="${userVO.user_age }" /><br/>
						<form:errors path="user_age" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>주민등록번호</th>
					<td>
						<input type="text" name="user_jumin1" id="user_jumin1" value="${userVO.user_jumin1 }"/>-
						<input type="text" name="user_jumin2" id="user_jumin2" value="${userVO.user_jumin2 }"/>
					</td>
			</tr>
			<tr>
				<th>성별</th>
					<td>
						<input type="radio" name="user_gender" value="1" checked="checked" />남자
						<input type="radio" name="user_gender" value="2" />여자
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
				<td colspan="2" align="right">
					<input type="submit" value="가입완료" id="btnRegistOk" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>