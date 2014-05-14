<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/login.js"/> "></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<title>Main</title>
<%
	String id = (String)session.getAttribute("user_id");
%>
</head>
<body>
<div id="first">
<!-- <table align="center" width="1200" height="700"> -->
<div id="first_first">상영예정작</div>
<div id="first_second">
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
		<%//로그인 상태일떄
		} else {
		%>
		<table>
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
	</form>
</div>
</div>
<div id="second">
<!-- 	<td height = "200"colspan="3" bgcolor="gray" align="center"> -->
<iframe src="/moebius/main/rank" width="1000px" height="230px" frameborder="0"></iframe>
</div>
<!-- 	<td height = "200"> -->
	<div id="third">
		<div id="third_first">광고</div>
		<div id="third_second"><iframe src="/moebius/main/notice" width="400px" height="200px" frameborder="0"></iframe> </div>
		<div id="third_third"><iframe src="/moebius/main/question" width="400px" height="200px" frameborder="0"></iframe></div>
	</div>
	<div><img src="<c:url value="/resources/img/image1.jpg"/>" class="main_img"/></div>
	
</body>
</html>
