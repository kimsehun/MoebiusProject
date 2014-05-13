<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript" src='<c:url value="/resources/js/regist.js"/>'></script>
</head>
<body>
	<form action="update" method="post">
		<table>
			<caption>회원 정보 수정</caption>
			<tr>
				<th>아이디</th>
					<td>
						<input type="text" name="user_id" id="user_id" value="${userVO.user_id }" readonly="readonly"/>
					</td>
			</tr>
			<tr>
				<th>비밀번호</th>
					<td>
						<input type="password" name="user_pwd" id="user_pwd" /><br/>
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
						<input type="text" name="user_name" value="${userVO.user_name }" readonly="readonly"/>
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
					<input type="submit" value="수정완료" id="btnRegistOk" />
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>