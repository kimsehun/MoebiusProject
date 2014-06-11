<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 관리</title>
<link rel="stylesheet" href="<c:url value="/resources/css/admin.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnDelete').click(function() {
			alert(${movieVO.Smovie_no});
// 			if (confirm('삭제하시겠습니까?')) {
// 				location.href = 'delete';
// 			}
		});
	})
</script>
</head>
<body>
<form action="delete" method="post">
<table border="1" cellspacing="0" class="deleteMovie">
<caption>영화 삭제하기</caption>
<tr>
	<th>번호</th>
	<th>영화 제목</th>
	<th>상영 시작일</th>
	<th>상영 종료일</th>
	<th></th>
</tr>
<c:forEach items="${list}" var="movieVO">
<tr>
	<td>${movieVO.movie_no}</td>
	<td>${movieVO.movie_title}</td>
	<td>${movieVO.movie_sdate}</td>
	<td>${movieVO.movie_edate}</td>
	<td><input type="button" value="삭제" onclick="if(confirm('삭제하시겠습니까?')){location.href='${movieVO.movie_no}/delete'}else{return;}"></td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>