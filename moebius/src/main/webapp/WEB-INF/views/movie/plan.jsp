<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<c:forEach items="${list2}" var="movieVO">
	<tr>
		<td>
			${movieVO.movie_title}
		</td>
	<tr>
	</c:forEach>
	</tr>
</table>
</body>
</html>