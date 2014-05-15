<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/reserve.css" />" type="text/css" />
</head>
<body>
	<div id="reserve_content" >
		<div class="reserve_first_first" align="center">영화</div>
		<div class="reserve_first_second" align="center">극장</div>
		<div class="reserve_first_third" align="center">날짜</div>
		<div class="reserve_first_forth" align="center">시간</div>
		<div class="reserve_second_first"></div>
		<div class="reserve_second_second"></div>
		<div class="reserve_second_third"></div>
		<div class="reserve_second_forth"></div>
		
	</div>
<hr>
<div id="seat_select" align="right"><input type="button" value="좌석선택" onclick="javascript:location.href='/moebius/reserve/seat'"/></div>
</body>
</html>