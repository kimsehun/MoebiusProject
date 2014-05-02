<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
	<link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
</head>
<body>
	<div id="header">
		<div class="top_menu">로고</div>
		<div class="top_menu">영화</div>
		<div class="top_menu">예매</div>
		<div class="top_menu"><a href="/board">고객센터</a></div>
		<div class="top_userInfo"><a href="/user/login">로그인</a></div>
		<div class="top_userInfo"><a href="/user/regist">회원가입</a></div>
	</div>
	<br>
	<hr>
	
	<decorator:body />
	
	
	<div id="footer" class="footer">
		<hr>
		<h3>GROUP : MOEBIUS DEVELOPER : MW, SH, JW, YB</h3>
	</div>	
</body>
</html>