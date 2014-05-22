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
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shCore.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shBrushCss.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shBrushXml.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shBrushJScript.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/default.js"></script>
<script type="text/javascript">
var commentList;
function selectMovie(no) {
	var movie_no = no
	var movie_url='<c:url value="/reserve/movie/'+movie_no+'" />';
	$.ajax({
		url:movie_url,
		type:'POST',
		success:function(data){
			commentList = '';
			$('#movie_no').val(movie_no);
			commentList += '<select name="location" size="11">';
			$.each(data,setCommentLocationList);
			commentList += '</select>';
			$('#reserve_second_second').html(commentList);
		}
	});
}
function selectLocation(no) {
	var location_no = no;
	var movie_no = $('#movie_no').val();
	var location_url='<c:url value="/reserve/location/'+location_no+'" />';
	$.ajax({
		url:location_url,
		type:'POST',
		data:{
			'movie_no':movie_no
		},
		success:function(data){
			commentList = '';
			$('#location_no').val(location_no);
			commentList += '<div class="reserve_year">'+data.year+'</div>';
			commentList += '<div class="reserve_month"><h1 class="reserve_month_font">'+data.month+'월</h1></div>';
			commentList += '<select name="day" size="11">';
			$.each(data.calList, setCommentDateList); 
			commentList += '</select>';
			$('.reserve_second_third').html(commentList);
		}
	});
}

function selectSchedule(day) {
	var movie_no = $('#movie_no').val();
	var location_no = $('#location_no').val();
	var day = day;
	var year = $('.reserve_year').text();
	var month = $('.reserve_month').text();
	var schedule_url='<c:url value="/reserve/schedule/'+day+'" />';
	$.ajax({
		url:schedule_url,
		type:'POST',
		data:{
			'movie_no':movie_no,
			'location_no':location_no,
			'year':year,
			'month':month
		},
		success:function(data){
			commentList = '';
			$('#year').val(year);
			$('#month').val(month);
			$('#day').val(day);
			commentList += '<select name="day" size="11">';
			$.each(data, setCommentScheduleList); 
			commentList += '</select>';
			$('.reserve_second_forth').html(commentList);
		}
	});
}

function selectLocationMovie(no) {
	var location_no = no
	var location_url='<c:url value="/reserve/locationMovie/'+location_no+'" />';
	$.ajax({
		url:location_url,
		type:'POST',
		success:function(data){
			commentList = "";
			$('#location_no').val(location_no);
			commentList += '<select name="movie" size="11">';
			$.each(data, setCommentMovieList);
			commentList += '</select>';
			$('.reserve_second_first').html(commentList);
		}
	});
}

function selectMovieDate(no) {
	var movie_no = no;
	var location_no = $('#location_no').val();
	var movie_url='<c:url value="/reserve/location/'+location_no+'" />';
	$.ajax({
		url:movie_url,
		type:'POST',
		data:{
			'movie_no':movie_no
		},
		success:function(data){
			commentList = '';
			$('#movie_no').val(movie_no);
			commentList += '<div class="reserve_year">'+data.year+'</div>';
			commentList += '<div class="reserve_month"><h1 class="reserve_month_font">'+data.month+'월</h1></div>';
			commentList += '<select name="day" size="11">';
			$.each(data.calList, setCommentDateList); 
			commentList += '</select>';
			$('.reserve_second_third').html(commentList);
		}
	});
}

function setCommentMovieList() {
	commentList += '<option value='+this['movie_no']+' onmousedown="selectMovieDate('+this['movie_no']+');">'+this['movie_title']+'</option>';
}

function selectTime(no) {
	$('#schedule_no').val(no);
}

function setCommentScheduleList() {
	commentList += '<option value='+this['schedule_no']+' onmousedown="selectTime('+this['schedule_no']+');">'+this['schedule_time']+'</option>';
}
	
function setCommentDateList() {
	commentList += '<option value='+[this]+' onmousedown="selectSchedule('+[this]+');">'+[this]+'</option>';
}

function setCommentLocationList() {
	commentList += '<option value='+this['loction_no']+' onmousedown="selectLocation('+this['location_no']+');">'+this['location_name']+'</option>';
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
		<select name="movie" size="11">
			<c:forEach items="${movieList}" var="movieVO">
			<option value="${movieVO.movie_no}" onmousedown="javascript:selectMovie(${movieVO.movie_no});">${movieVO.movie_title}</option>
			</c:forEach>
		</select>
		</div>
		<div class="reserve_second_second" id="reserve_second_second">
		<select name="location" size="11">
			<c:forEach items="${locationList}" var="locationVO">
				<option value="${locationVO.location_no}" onmousedown="javascript:selectLocationMovie(${locationVO.location_no});">${locationVO.location_name}</option>
			</c:forEach>
		</select>
		</div>

		<div class="reserve_second_third" id="reserve_second_third" align="center">
			<div class="reserve_year">${year}</div>
				<div class="reserve_month"><h1 class="reserve_month_font">${month}월</h1></div>
			<select name="day" size="11">
				<c:forEach items="${calList}" var="cal">
				<option value="${cal}" >${cal}</option>
				</c:forEach>
			</select>
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
<form action = "reserve/seat" method="GET">
<input type="hidden" id="location_no" name="location_no" value=""/>
<input type="hidden" id="movie_no" name="movie_no" value=""/>
<input type="hidden" id="year" name="year" value=""/>
<input type="hidden" id="month" name="month" value=""/>
<input type="hidden" id="day" name="day" value=""/>
<input type="hidden" id="schedule_no" name="schedule_no" value=""/>
<input type="submit" value="자리선택"/>
</form>
</body>
</html>