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
<table>
	<caption>${boardInfo.bname}</caption>
	<c:forEach items="${list}" var="boardVO" varStatus="st">
	<tr>
		<td><a href="../board/1/1/${boardVO.board_no}/"target="_blank">${boardVO.board_title}</a></td>
		<c:if test="${boardInfo.bno == 1}">
			<td>${boardVO.board_regdate}</td>
			<td>${boardVO.board_count}</td>
		</c:if>
	</tr>
	</c:forEach>
</table>
</body>
</html>