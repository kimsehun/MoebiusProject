<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnRegist').bind('click',function(){
			location.href='/moebius/user/regist';
		});
		
		$('#btnLoginOk').bind('click',function(){
			if($('#user_id').val() == ''){
				alert('아이디를 입력하세요');
				$('#user_id').focus();
				return false;
			}
			if($('#user_pwd').val() == ''){
				alert('비밀번호를 입력하세요');
				$('#user_pwd').focus();
				return false;
			}
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
<form action="reserveLogin" method="post">
<table class="tableCenter">
	<caption>로그인</caption>
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
			<div><a href="/moebius/user/searchid">ID</a>/<a href="/moebius/user/searchpwd">PW찾기</a></div>
		</td>
	</tr>
	
</table>
</form>
</body>
</html>