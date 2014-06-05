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
<form action="insert" method="post">
	<table>
		<tr>
			<td>영화</td>
			<td>
				<select name="movie_no">
					<c:forEach items="${movieList}" var="movieVO">
						<option value="${movieVO.movie_no}">${movieVO.movie_title}</option>
					</c:forEach>
				</select>
			</td>	
		</tr>
		<tr>
			<td>지역</td>
			<td>
				<select name="location_no">
					<c:forEach items="${locationList}" var="locationVO">
						<option value="${locationVO.location_no}">${locationVO.location_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>스크린</td>
			<td>
				<select name="screen_name">
					<option value="1">1관</option>
					<option value="2">2관</option>
					<option value="3">3관</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="등록완료"/>
			</td>
		</tr>
	</table>
</form>
<br>
	<table border="1" cellspacing="1" cellpadding="5">
		<tr>
			<th>극장(지역)</th>
			<th>상영관</th>
			<th>개봉영화 제목</th>
		</tr>
		<c:forEach items="${screenList}" var="screenVO">
		<tr>		
			<td align="center">${screenVO.location_name}</td>
			<td align="center">${screenVO.screen_name}</td>
			<td align="center">${screenVO.movie_title}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>