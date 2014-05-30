<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV - 내 정보</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
</head>
<body>
<div class="snb">
   <ul>
	   <li class='active'><a href='/moebius/user/userInfo'><span>예매정보</span></a></li>
	   <li class='active'><a href='/moebius/user/update'><span>회원정보수정</span></a></li>
	   <li class='active'><a href='/moebius/user/change'><span>비밀번호수정</span></a></li>
	   <li class='active'><a href='/moebius/user/delete'><span>회원탈퇴</span></a></li>
	</ul>
</div>
<div id="content">
	<table border="2">
		<caption>상세 정보</caption>
			<tr>
				<th>이름</th>
				<th>지역</th>
				<th>상영관</th>
				<th>영화 제목</th>
				<th>좌석 정보</th>
				<th>일</th>
				<th>시간</th>
				<th>사용 포인트</th>
			</tr>
			
			<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.user_name }</td>
				<td>${list.location_name }</td>
				<td>${list.screen_name }</td>
				<td>${list.movie_title }</td>
				<td>${list.seat_name }</td>
				<td>${list.schedule_date }</td>
				<td>${list.schedule_time }</td>
				<td>${list.movie_point }</td>
			</tr>
			</c:forEach>
	</table>
</div>
</body>
</html>