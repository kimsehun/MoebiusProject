<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>CGV - 상영예정작</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
</head>
<body>
<div class="snb">
   <ul>
	   <li class='active'><a href='/moebius/movie/ranking'><span>현재상영작</span></a></li>
	   <li class='active'><a href='/moebius/movie/plan'><span>상영예정작</span></a></li>
	</ul>
</div>
<div id="content">
<table>
	<c:forEach items="${list2}" var="movieVO">
	<tr>
		<td rowspan="4">
		<img src="download?fileName=${movieVO.movie_poster}" style="width:150px;height:150px"/>
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
</div>
</body>
</html>