<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href='<c:url value="/resources/css/board.css"/>'
	type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#goLogin').click(function() {
		location.href = 'login';
	});
});
</script>
</head>
<body>
축하합니다. 가입되셨습니다.</br>
아래 항목을 확인하세요<br/>
	<table>
		<caption>회원 가입 결과</caption>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="user_id" value="${userVO.user_id }"
				readonly="readonly" />
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="user_name"
				value="${userVO.user_name }" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><c:if test="${userVO.user_gender == 1 }">남</c:if> <c:if
					test="${userVO.user_gender == 2 }">여</c:if></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="user_email" readonly="readonly"
				value="${userVO.user_email }" /></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="user_phone"
				value="${userVO.user_phone }" /></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="text" name="user_zipcode" class="textZipcode"
				id="user_zipcode" value="${userVO.user_zipcode }"
				readonly="readonly" onclick="noClick();" /></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="user_addr1" class="input_text_300"
				id="user_addr1" value="${userVO.user_addr1 }" /></td>
		</tr>
		<tr>
			<th>상세 주소</th>
			<td><input type="text" name="user_addr2" class="input_text_300"
				id="user_addr2" value="${userVO.user_addr2 }" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="center">
					<input type="button" value="가입 내용 확인" id="goLogin"/>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>