<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="delete" method="post">
<table>
	<caption>회원탈퇴</caption>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="user_id" id="user_id" autofocus="autofocus"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="user_pwd" id="user_pwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인" />
		</td>
	</tr>
	delete 버튼으로 구현해서 아작스로 post로 delete로 넘김.
	
</table>
</form>
</body>
</html>