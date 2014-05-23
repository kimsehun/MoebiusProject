<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/reserve.css" />" type="text/css" />

<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/reserveSeat.js"/>"></script>

</head>
<body>

<div id="reserve_content">
	<div class="seat_top">
	<input type="hidden" value="${sitVO.location_no}" id="location_no">
	<input type="hidden" value="${sitVO.schedule_no}" id="schedule_no">
	<input type="hidden" value="${sitVO.seat_name}" id="seat_name">
	<input type="hidden" value="${sitVO.seat_no}" id="seat_no">
	<input type="hidden" value="${sitVO.screen_name}" id="screen_name">
	<input type="hidden" value="${sitVO.screen_no}" id="screen_no">
	<input type="hidden" value="${user_id}" id="user_id">
		인원 수 : 
		<select id="movierLimit">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
		</select>
	</div>
	<div class="seat_content">
		<table border="1" class="seat_table">
			<% 
			// onclick='reserve("+result+j+")'
				int i,j;
				char result;
				for(i = 65; i < 74; i++){
					result = (char)i;
					out.print("<tr>");
					for(j = 1; j < 11; j++){
						out.print("<td class='resultSeat' id="+result+j+">"+result+j);
						out.print("</td>");
					} 
					out.print("</tr>");	
				}
			%>
		</table>
	</div>
	<input type="button" value="확인" id="btnReserveOk" >
</div>
</body>
</html>


