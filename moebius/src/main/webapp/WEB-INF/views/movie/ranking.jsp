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
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<div class="snb">
   <ul>
	   <li class='active'><a href='/moebius/movie/ranking'><span>현재상영작</span></a></li>
	   <li class='active'><a href='/moebius/movie/plan'><span>상영예정작</span></a></li>
	</ul>
</div>
<div id="content">
<table align="center" cellspacing="50" >
	<c:forEach items="${rankinglist}" var="movieVO" varStatus="st">
		<c:choose>
			<c:when test="${st.index%5 == 0 }">
				<tr>
					<td align="center">
						${st.index +1}<br>
						<img src="/moebius/movie/download?fileName=${movieVO.movie_poster}" id="btninsert"/>
						<p><a href ="/moebius/reserve/${movieVO.movie_no}" target="newwin" class="btnMovieReserve">예매</a> / <a href="detail/${movieVO.movie_no}/"  class="btnMovieReserve">상세보기</a> </p>
					</td>
			</c:when>
			<c:otherwise>
				<td align="center">
					${st.index +1}<br>
					<img src="/moebius/movie/download?fileName=${movieVO.movie_poster}" id="btninsert"/>
					<p><a href ="/moebius/reserve/${movieVO.movie_no}" target="newwin" class="btnMovieReserve">예매</a> / <a href="detail/${movieVO.movie_no}/"  class="btnMovieReserve">상세보기</a> </p>
				</td>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</table>
</div>
</body>
</html>