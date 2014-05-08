<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화등록</title>
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">
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
				<th>영화 상영 시작일</th>
				<td>
					<input type="number" name="s_year" 
						min="${year - 10}" max="${year + 10}" value="${year}" />년
					<input type="number" name="s_month" min="1" max="12" value="${month}" />월
					<input type="number" name="s_day" min="1" max="30" value="${day}" />일
				</td>
			</tr>
			<tr>
				<th>영화 상영 종료일</th>
				<td>
					<input type="number" name="e_year" 
						min="${year - 10}" max="${year + 10}" value="${year}" />년
					<input type="number" name="e_month" min="1" max="12" value="${month}" />월
					<input type="number" name="e_day" min="1" max="30" value="${day+7}" />일
				</td>
			</tr>
			<tr>
				<td>
					영화 등급
				</td>
				<td>
					<select name="movie_grade">
						<option value="1">15</option>
						<option value="2">19</option>
						<option value="3">전체관람</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>영화 포인트 가격</td>
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