<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
</head>
<body>
<form action="insert" method="post">
<table>
	<caption>글 쓰기</caption>
	<tr>
		<th>제목</th>
		<td><input type="text" name="board_title" style="width:645px;"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="5" name="board_content" id="content" style="width:645px; height:268px"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="완료" id="btnOk"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>