<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript">
</script>
</head>
<body>
<table>
	<tr>
		<td rowspan="4" align="center">
		<img src="download?fileName=${movieVO.movie_poster}" />
		</td>
		<th>
			<a href="${movieVO.movie_no}/">${movieVO.movie_title}</a>
		</th>
	</tr>
	<tr>
		<td>
			기본 ${movieVO.movie_genre} | ${movieVO.movie_nation} | ${movieVO.movie_runningtime} | 개봉일 : ${movieVO.movie_sdate}
		</td>
	</tr>
	<tr>
		<td>
			감독 ${movieVO.movie_directer}
		</td>
	</tr>
	<tr>
		<td>
			출연 ${movieVO.movie_actor}
		</td>
	</tr>
	<tr>
		<td>
			등급
		<c:if test="${movieVO.movie_grade == 1 }">
			15세 미만 관람불가
		</c:if>
		<c:if test="${movieVO.movie_grade == 2 }">
			청소년 관람불가
		</c:if>
		<c:if test="${movieVO.movie_grade == 3 }">
			전연령 관람가능
		</c:if>
		</td>
	</tr>
	<tr>
		<th colspan="2">줄거리</th>
	</tr>
	<tr>		
		<td colspan="2">${movieVO.movie_story}</td>
	</tr>
</table>
</body>
</html>