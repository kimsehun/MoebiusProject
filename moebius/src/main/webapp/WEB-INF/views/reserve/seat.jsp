<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/reserve.css" />" type="text/css" />

<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>

<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$('.resultSeat').bind('click',function(){
		var seatName = $(this).text();
		var user_id = '${sessionScope.user_id}';
		var sit_url = '<c:url value="/reserve/seat/'+seatName+'" />';
		alert(sit_url);
		$.ajax({
			url:sit_url,
			type:'POST',
			data:{
				'user_id':user_id,
				'seatName':seatName
			},
			success:function(data) {
				alert("success");
			}
		});
	});
});

</script>
</head>
<body>
<div id="reserve_content">
	<div class="seat_top"> 인원수 설정 menu | 상영관정보(뿌려주려면 뿌려주고 말려면 말고) </div>
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
						out.print("<td>");
						out.print("<div class='resultSeat' id="+result+j+">"+result+j+"</div>" );
// 						out.print(result);
// 						out.print(j);
						out.print("</td>");
					}
					out.print("</tr>");	
				}
			%>
		</table>
	</div>

</div>
</body>
</html>


