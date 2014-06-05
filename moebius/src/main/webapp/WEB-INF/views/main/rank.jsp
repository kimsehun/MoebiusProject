<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css" />" type="text/css" />
<title>Insert title here</title>
</head>
<body class="rankBody">
<table class="rank"  cellpadding="20">
	<tr>
		<c:forEach items="${rankinglist}" var="movieVO" varStatus="st">
		<c:choose>
			<c:when test="${st.index < 5 }">
					<td class="rank">
						<div class="ranknum"> ${st.index +1} </div>
						<img src="/moebius/movie/download?fileName=${movieVO.movie_poster}" class="poster_img" id="btninsert"/>

							<c:if test="${movieVO.movie_grade == 1 }">
								<div class="age15">15</div>
							</c:if>
							<c:if test="${movieVO.movie_grade == 2 }">
								<div class="age19">19</div>
							</c:if>
							<c:if test="${movieVO.movie_grade == 3 }">
								(전체관람)
							</c:if>
						<p class="movie_title">
							${movieVO.movie_title}
						</p>
						<p class="movie_opendate">${movieVO.movie_sdate} 개봉</p>
						<p class="btn"><a href ="/moebius/reserve/${movieVO.movie_no}" target="_blank" class="movie_btnreserve">예매</a> / <a href="/moebius/movie/detail/${movieVO.movie_no}/" target="_blank" class="movie_btnreserve">상세보기</a> </p>
					</td>
				</c:when>
			</c:choose>
		</c:forEach>
	</tr>
</table>
</body>
</html>