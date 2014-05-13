<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<form action="searchid" method="post" >
		<table>
			<caption>아이디 찾기</caption>
			<tr>
				<th>이름</th>
					<td>
						<input type="text" name="user_name" /><br/>
					</td>
			</tr>
			<tr>
				<th>주민등록번호</th>
					<td>
						<input type="text" name="user_jumin1" id="user_jumin1" />-
						<input type="password" name="user_jumin2" id="user_jumin2" />
					</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="center">
					<input type="submit" value="찾기" id="btnRegistOk" />
					</div>
				</td>
			</tr>
		</table>
</form>
</body>
</html>