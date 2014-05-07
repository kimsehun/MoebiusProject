<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="movieInsert" method="post">
	<table>
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
				<td colspan="2">
					<textarea rows="10" cols="10" name="movie_story"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					파일 : <input type="file" name="movie_poster" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					영화 상영 시작일
					<input type="number" name="year" 
						min="${year - 10}" max="${year + 10}" value="${year}" />년
					<input type="number" name="month" min="1" max="12" value="${month}" />월
					<input type="number" name="day" min="1" max="30" value="${day}" />일
				</td>
			</tr>
			<tr>
				<td colspan="2">
					영화 상영 종료일
					<input type="number" name="year" 
						min="${year - 10}" max="${year + 10}" value="${year}" />년
					<input type="number" name="month" min="1" max="12" value="${month}" />월
					<input type="number" name="day" min="1" max="30" value="${day+7}" />일
				</td>
			</tr>
			<tr>
				<td colspan="2">
					영화 등급 : <input type="number" name="movie_grade"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					영화 포인트 가격 : <input type="number" name="movie_point"/>
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