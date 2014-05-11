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
		<td rowspan="4">
		<img src="download?fileName=sm_${movieVO.movie_poster}" />
		</td>
		<th>
		<c:if test="${movieVO.movie_grade == 1 }">
			(15세)
		</c:if>
		<c:if test="${movieVO.movie_grade == 2 }">
			(19세)
		</c:if>
		<c:if test="${movieVO.movie_grade == 3 }">
			(전체관람)
		</c:if>
			<a href="detail/${movieVO.movie_no}/">${movieVO.movie_title}</a>
		</th>
		<th rowspan="4" ><h1>D-${movieVO.dday}</h1></th>
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
	</c:forEach>
	</tr>
</table>
</body>
</html>