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
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
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
			commentList += '<select name="location" size="11" class="wrapper-dropdown">';
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
			$('#screen_no').val(data.screen_no);
			commentList += '<div class="reserve_year">'+data.year+'</div>';
			commentList += '<div class="reserve_month"><h1 class="reserve_month_font">'+data.month+'월</h1></div>';
			commentList += '<select name="day" size="11" class="wrapper-dropdown-date">';
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
			commentList += '<select name="day" size="11" class="wrapper-dropdown">';
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
			commentList += '<select name="movie" size="11" class="wrapper-dropdown">';
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
			$('#screen_no').val(data.screen_no);
			commentList += '<div class="reserve_year">'+data.year+'</div>';
			commentList += '<div class="reserve_month"><h1 class="reserve_month_font">'+data.month+'월</h1></div>';
			commentList += '<select name="day" size="11" class="wrapper-dropdown">';
			$.each(data.calList, setCommentDateList); 
			commentList += '</select>';
			$('.reserve_second_third').html(commentList);
		}
	});
}

function setCommentMovieList() {
	commentList += '<option class = "movie_option" value='+this['movie_no']+' onmousedown="selectMovieDate('+this['movie_no']+');">'+this['movie_title']+'</option>';
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
		<select name="movie" size="11" class="wrapper-dropdown">
			<c:forEach items="${rankingList}" var="movieVO">
				<c:choose>
					<c:when test="${movie_no == movieVO.movie_no}">
						<option value="${movieVO.movie_no}" onmousedown="javascript:selectMovie(${movieVO.movie_no});" selected>${movieVO.movie_title}</option>
					</c:when>
					<c:otherwise>
						<option value="${movieVO.movie_no}" onmousedown="javascript:selectMovie(${movieVO.movie_no});">${movieVO.movie_title}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
		</div>
		<div class="reserve_second_second" id="reserve_second_second">
		<select name="location" size="11" class="wrapper-dropdown">
			<c:forEach items="${locationList}" var="locationVO">
				<c:choose>
				<c:when test="${movie_no == 0}">
					<option value="${locationVO.location_no}" onmousedown="javascript:selectLocationMovie(${locationVO.location_no});">${locationVO.location_name}</option>
				</c:when>
				<c:otherwise>
					<option value="${locationVO.location_no}" onmousedown="javascript:selectLocation(${locationVO.location_no});">${locationVO.location_name}</option>
				</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
		</div>

		<div class="reserve_second_third" id="reserve_second_third" align="center">
			<div class="reserve_year" >${year}</div>
				<div class="reserve_month"><h1 class="reserve_month_font">${month}월</h1></div>
			<select name="day" size="11" class="wrapper-dropdown-date">
				<c:forEach items="${calList}" var="cal">
				<option value="${cal}" >${cal}</option>
				</c:forEach>
			</select>
		</div>
		<div class="reserve_second_forth"></div>
		<form action = "reserve/seat" method="GET">
			<input type="hidden" id="location_no" name="location_no" value=""/>
			<input type="hidden" id="movie_no" name="movie_no" value="${movie_no}"/>
			<input type="hidden" id="screen_no" name="screen_no" value="" />
			<input type="hidden" id="year" name="year" value=""/>
			<input type="hidden" id="month" name="month" value=""/>
			<input type="hidden" id="day" name="day" value=""/>
			<input type="hidden" id="schedule_no" name="schedule_no" value=""/>
			<input type="submit" value="자리선택" class="btnSeat"/>
			
		</form>
	</div>
<hr>

</body>
</html>
