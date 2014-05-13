<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/movie.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<table align="center" cellspacing="50" >
	<c:forEach items="${rankinglist}" var="movieVO" varStatus="st">
		<c:choose>
			<c:when test="${st.index == 5 }">
				<tr>
					<td>
						${st.index +1}
						<img src="download?fileName=sm_${movieVO.movie_poster}"  id="btninsert"/>
						<p><a href ="#">예매</a> / <a href="detail/${movieVO.movie_no}/">상세보기</a> </p>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<td>
					${st.index +1}
					<img src="download?fileName=sm_${movieVO.movie_poster}"  id="btninsert"/>
					<p><a href ="#">예매</a> / <a href="detail/${movieVO.movie_no}/">상세보기</a> </p>
				</td>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</table>
</body>
</html>