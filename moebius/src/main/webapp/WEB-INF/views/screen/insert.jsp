<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>관리자페이지 - 상영관 등록</title>
<link rel="stylesheet" href="<c:url value="/resources/css/admin.css" />" type="text/css" />
</head>
<body>
<form action="insert" method="post">
	<table class="insertScreen">
		<caption>영화 정보 입력</caption>
		<tr>
			<th>영화</th>
			<td>
				<select name="movie_no">
					<c:forEach items="${movieList}" var="movieVO">
						<option value="${movieVO.movie_no}">${movieVO.movie_title}</option>
					</c:forEach>
				</select>
			</td>	
		</tr>
		<tr>
			<th>지역</th>
			<td>
				<select name="location_no">
					<c:forEach items="${locationList}" var="locationVO">
						<option value="${locationVO.location_no}">${locationVO.location_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>스크린</th>
			<td>
				<select name="screen_name">
					<option value="1">1관</option>
					<option value="2">2관</option>
					<option value="3">3관</option>
				</select>
			</td>
		</tr>
		<tr class="center">
			<td colspan="2">
				<input type="submit" value="등록완료"/>
			</td>
		</tr>
	</table>
</form>
<br>
	<table border="1" cellspacing="1" cellpadding="5" class="nowScreenInfo">
		
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