<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/login.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/login.js"/> "></script>
<title>Main</title>
<%
	String id = (String)session.getAttribute("user_id");
%>
</head>
<body>
<table align="center" width="1300" height="700">
<tr>
	<td >상영예정작</td>
	<td>광고1</td>
	<td width="300">
	<%//로그아웃 상태일때
	if(id==null) {
	%>
	<form action="user/login" method="post">
			<table class="login">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="user_id" id="user_id" autofocus="autofocus"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="user_pwd" id="user_pwd"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="로그인" id="btnLoginOk"/>
						<input type="button" value="회원가입" id="btnRegist"/>
					<div>ID/PW찾기</div>
					</td>
				</tr>
		  </table>
	</form>
	<%//로그인 상태일떄
	} else {
	%>
	<table border="1"  align="center">
		<tr>
			<td colspan="2" align="left">${sessionScope.user_name}<br/></td>
			<td align="right"><input type="button" value="로그아웃" onclick="javascript:location.href='user/logout';"/><br/></td>
		</tr>
		<tr>
			<td class="smallfont">예매내역<br/></td>
			<td class="smallfont">나의 포인트<br/></td>
			<td class="smallfont">무비 캘랜더(준비중)<br/></td>
		</tr>
		<tr>
			<td class="smallfont">상영시간표<br/></td>
			<td class="smallfont">극장찾기<br/></td>
			<td class="smallfont">관람권등록(준비중)</td>
		</tr>
	
	</table>
	
	<%} %>
	</td>
</tr>
<tr>
	<td height = "200"colspan="3" bgcolor="gray" align="center">
	<table cellspacing="50">
		<tr>
		<c:forEach items="${rankinglist}" var="movieVO" varStatus="st">
		<c:choose>
			<c:when test="${st.index < 5 }">
					<td>
						${st.index +1}
						<img src="/moebius/movie/download?fileName=sm_${movieVO.movie_poster}"  id="btninsert"/>
						<p><a href ="#">예매</a> / <a href="/moebius/movie/detail/${movieVO.movie_no}/">상세보기</a> </p>
					</td>
				</c:when>
			</c:choose>
		</c:forEach>
		</tr>
	</table>
	</td>
</tr>
<tr>
	<td height = "200">광고2</td>
	<td>공지사항</td>
	<td>자주찾는질문</td>
</tr>
<tr>
	<td align="center" colspan="3"><img width="750" height="150" src="<c:url value="/resources/img/image1.jpg"/>"/></td>
</tr>
</table>
</body>
</html>