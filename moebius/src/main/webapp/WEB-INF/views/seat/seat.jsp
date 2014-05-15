<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<title>Insert title here</title>
</head>
<body>
<table>
	<caption>좌석 배치</caption>
		<c:forEach step="1" items="i">
			<tr id="i">i
			<c:forEach step="1" items="j">
			<td id="j">j</td>
			</c:forEach>
			</tr>
		</c:forEach>
</table>
</body>
</html>