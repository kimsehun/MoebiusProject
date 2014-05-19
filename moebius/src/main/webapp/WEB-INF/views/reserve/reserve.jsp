<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/reserve1.css" />" type="text/css" />
<link rel="stylesheet" href="<c:url value="/resources/css/process.css" />" type="text/css" />
<link rel="stylesheet" type="text/css" href="http://html.nhndesign.com/ui_library/css/shCore.css"> 
<link rel="stylesheet" type="text/css" href="http://html.nhndesign.com/ui_library/css/shThemeDefault.css"> 
<link rel="stylesheet" type="text/css" href="http://html.nhndesign.com/ui_library/css/default.css"> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shCore.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shBrushCss.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shBrushXml.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shBrushJScript.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/default.js"></script>
<script type="text/javascript">
var commentList;
$(document).ready(function(){
	$('#reserve_second_second').empty();
});

function selectMovie(no) {
	var movie_no = no
	var movie_url='<c:url value="/reserve/'+movie_no+'" />';
	alert(movie_no);

	$.ajax({
		url:movie_url,
		type:'GET',
		success:function(data){

			$.each(data,setCommentList);
			$('#reserve_second_second').html(commentList);
		}
	});
}

function setCommentList() {
	commentList += this['location_name'] + '<br/>'
}
</script>
</head>
<body>
	<div id="reserve_content" >
		<div class="reserve_first_first" align="center">영화</div>
		<div class="reserve_first_second" align="center">극장</div>
		<div class="reserve_first_third" align="center">날짜</div>
		<div class="reserve_first_forth" align="center">시간</div>
		<div class="reserve_second_first">
		<select name="movie" size="11" multiple>
			<c:forEach items="${movieList}" var="movieVO">
			<option value="${movieVO.movie_no}" onmousedown="javascript:selectMovie(${movieVO.movie_no});">${movieVO.movie_title}</option>
			</c:forEach>
		</select>
		</div>
		<div class="reserve_second_second" id="reserve_second_second">
			<c:forEach items="${locationList}" var="locationVO">
				${locationVO.location_name}<br/>
			</c:forEach>
		</div>
		<div class="reserve_second_third" align="center">
			<div class="reserve_year">${year}</div>
		<div class="reserve_month"><h1 class="reserve_month_font">${month}월</h1></div>
			<c:forEach items="${calList}" var="cal">
				${cal}<br/>
			</c:forEach>
		</div>
		<div class="reserve_second_forth"></div>
		
	</div>
<hr>
<div id="code_origin" class="code_tmpl">
<!-- UI Object -->
<div class="progress">
	<strong class="tit">진행상태</strong>
	<ol>
	<li class="on"><span>영화선택</span></li>
	<li><span>극장선택</span></li>
	<li><span>날짜</span></li>
	<li><span>시간</span></li>
	<li><span onclick="javascript:location.href='/moebius/reserve/seat'">자리선택</span></li>
	</ol>	
</div>
<!-- //UI Object -->
</div>
</body>
</html>