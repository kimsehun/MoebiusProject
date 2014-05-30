<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.moebius.seat.SitVO"%>
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
<c:set var="list" value="${list}" />
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
	<input type="hidden" value="${sitVO.movie_no}" id="movie_no">
	<input type="hidden" value="${user_id}" id="user_id">

		인원 수 : 
		<select id="movierLimit">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
		</select>
	</div>
	<div class="seat_content">
		<table border="1" class="seat_table"  cellpadding="10" cellspacing="10">
		<tr>
			<td colspan="10">
			스크린 위치
			</td>
		</tr>
			<%
				int i,j;
				
				char result;
				List<String> list = (List<String>) pageContext.getAttribute("list");	
				String reservedSeat = null;
				int start=0;
				Logger logger = LoggerFactory.getLogger("seat.jsp");

				if(list.isEmpty() == false){
					for(i = 65; i < 74; i++){
						result = (char)i;
						out.print("<tr>");
						for(j = 1; j < 11; j++){
							reservedSeat= result+""+ j;
							
							for(int z = start;z<list.size();z++){
								if(list.get(z).equals(reservedSeat)){							
									out.print("<td class='reservedSeat' id="+result+j+" >"+result+j);
									out.print("</td>");
									start++;
									if (start == list.size()) {
										start = list.size() - 1;
									}
									z = list.size();
								} else {
									out.print("<td class='resultSeat' id="+result+j+">"+result+j);
									out.print("</td>");
									z = list.size();
								} 
								
							}

						}
					}
				} else {
					for(i = 65; i < 74; i++){
						result = (char)i;
						out.print("<tr>");
						for(j = 1; j < 11; j++){
							reservedSeat= result+""+ j;
							out.print("<td class='resultSeat' id="+result+j+">"+result+j);
							out.print("</td>");
						}
								
					}

				}
						
					
			%>
		</table>
	</div>
	<input type="button" value="확인" id="btnReserveOk" >
</div>
</body>
</html>


