<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/mainboard.css" />" type="text/css" />
</head>
<body>
<table border="1">
	<caption>${boardInfo.bname}</caption>
	<tr>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<c:forEach items="${list}" var="boardVO" varStatus="st">
	<tr>
		<td><a href="../board/1/1/${boardVO.board_no}/"target="_blank">${boardVO.board_title}</a></td>
		<td>${boardVO.userVO.user_name}</td>
		<td>${boardVO.board_regdate}</td>
		<td>${boardVO.board_count}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>