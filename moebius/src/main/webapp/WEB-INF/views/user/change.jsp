<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	$('#btnUpdateOk').bind('click',function(){
		alert('${msg}');	
		}
	});
});
</script>
<form action="change" method="post" >
		<table>
			<caption>비밀번호 바꾸기</caption>
			<tr>
				<th>아이디</th>
					<td>
						<input type="text" name="user_id" id="user_id" /><br/>
					</td>
			</tr>
			<tr>
				<th>기존 비밀번호</th>
					<td>
						<input type="password" name="user_inpwd" id="user_inpwd" /><br/>
						<form:errors path="user_name" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>새로운 비밀번호</th>
					<td>
						<input type="password" name="new_pwd" id="new_pwd" /><br/>
						<form:errors path="user_name" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>새로운 비밀번호 확인</th>
					<td>
						<input type="password" name="new_pwd_ok" id="new_pwd_ok" /><br/>
						<form:errors path="user_name" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="center">
					<input type="submit" value="수정" id="btnUpdateOk" />
					</div>
				</td>
			</tr>
		</table>
</form>
</body>
</html>