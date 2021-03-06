<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화등록</title>
<link rel="stylesheet" href="<c:url value="/resources/css/movie.css" />" type="text/css" />
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">
	<table class="t_registMovie">
			<caption>영화 등록</caption>
			<tr>
				<th>제목</th>
					<td>
						<input type="text" name="movie_title" /><br/>
					</td>
			</tr>
			<tr>
				<th>감독</th>
					<td>
						<input type="text" name="movie_directer" /><br/>
					</td>
			</tr>
			<tr>
				<th>장르</th>
					<td>
						<input type="text" name="movie_genre" /><br/>
					</td>
			</tr>
			<tr>
				<th>국가</th>
					<td>
						<input type="text" name="movie_nation" /><br/>
					</td>
			</tr>
			<tr>
				<th>배우들</th>
					<td>
						<input type="text" name="movie_actor" /><br/>
					</td>
			</tr>
			<tr>
				<th>상영시간</th>
					<td>
						<input type="number" min="100" max="160"name="movie_runningtime" />분<br/>
					</td>
			</tr>
			<tr>
				<th>스토리</th>
				<td>
					<textarea rows="10" cols="30" name="movie_story"></textarea>
				</td>
			</tr>
			<tr>
				<th>파일</th>
				<td>
				 	<input type="file" name="upFile" />
				</td>
			</tr>
			<tr>
				<th>영화 동영상 주소</th>
				<td>
					<input type="text" name="movie_video">
					<div id = "video_alt">동영상을 입력할려면 유투브에서 src = " "안에 주소를 붙여 넣으세요.</div>
				</td>
			</tr>
			<tr>
				<th>영화 상영 시작일</th>
				<td>
					<input type="date" name="movie_sdate"/>
				</td>
			</tr>
			<tr>
				<th>영화 상영 종료일</th>
				<td>
					<input type="date" name="movie_edate"/>
				</td>
			</tr>
			<tr>
				<th>
					영화 등급
				</th>
				<td>
					<select name="movie_grade">
						<option value="1">15</option>
						<option value="2">19</option>
						<option value="3">전체관람</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>영화 포인트 가격</th>
				<td>
					<input type="number" min="3000" max="5000" step="500" name="movie_point"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="center">
					<input type="submit" value="등록완료" id="btnRegistOk" />
					</div>
				</td>
			</tr>
		</table>
</form>
</body>
</html>