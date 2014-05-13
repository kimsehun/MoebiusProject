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
$(document).ready(function() {
	$('img').each(function(index, item){
		$(item).mouseover(function() {
			$(item).css('opacity', 0.7);
			$('#btnDetail').toggle('slow');
		}),
		$(item).mouseout(function(){
			$(item).css('opacity', 1.0);
		}),
		$(item).click(function(){
			location.href="";
		});
		
	});
});
</script>
</head>
<body>
<c:forEach items="${rankinglist}" var="movieVO">
	<img src="download?fileName=sm_${movieVO.movie_poster}"  id="btninsert"/><br/><br/>
		<p style="display:none" id="btnDetail"> 예매 / 상세보기 </p>
</c:forEach>
</body>
</html>