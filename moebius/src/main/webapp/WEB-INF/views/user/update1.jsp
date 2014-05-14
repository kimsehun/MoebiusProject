<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="update1" method="post" >
		<table>
			<caption>비밀번호 바꾸기</caption>
			<tr>
				<th>아이디</th>
					<td>
						<input type="text" name="user_id" /><br/>
					</td>
			</tr>
			<tr>
				<th>기존 비밀번호</th>
					<td>
						<input type="password" name="user_pwd" id="user_pwd" /><br/>
						<form:errors path="user_name" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>새로운 비밀번호</th>
					<td>
						<input type="password" name="user_pwd" id="user_pwd" /><br/>
						<form:errors path="user_name" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<th>새로운 비밀번호 확인</th>
					<td>
						<input type="password" name="user_pwd" id="user_pwd" /><br/>
						<form:errors path="user_name" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="center">
					<input type="submit" value="수정" id="btnRegistOk" />
					</div>
				</td>
			</tr>
		</table>
</form>
</body>
</html>