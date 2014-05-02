<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet" href='<c:url value="/resources/css/main.css"/>'type="text/css" />
	<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
	<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
	<script type='text/javascript' src='menu_jquery.js'></script>
</head>
<body>
	<div id='header'>
	   <ul>
		   <li class='active'><a href='/moebius'><span>Home</span></a></li>
		   <li class='has-sub'><a href='#'><span>영화</span></a>
		      <ul>
		         <li><a href='#'><span>현재상영작</span></a></li>
		         <li><a href='#'><span>상영예정작</span></a></li>
		      </ul>
		   </li>
		   <li class='last'><a href='#'><span>극장</span></a></li>
		   <li class='has-sub'><a href='#'><span>고객센터</span></a>
		      <ul>
		         <li><a href='#'><span>공지사항</span></a></li>
		         <li><a href='#'><span>자주하는질문</span></a></li>
		         <li class='last'><a href='#'><span>문의사항</span></a></li>
		      </ul>
		   </li>
		   
		   <div class="top_userInfo"> 
	    	<a href="user/regist"> 회원가입</a>
	    	<a href="user/login"> 로그인</a>
	    </div>
	    
		</ul>
	</div>

	<decorator:body />
	
	
	<div id="footer" class="footer">
		<hr>
		<h3>GROUP : MOEBIUS DEVELOPER : MW, SH, JW, YB</h3>
	</div>	
</body>
</html>