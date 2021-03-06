<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-MAIL 문의</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
</head>
<body>
<div class='snb'>
   <ul>
	   <li class='active'><a href='/moebius/board/1/1/'><span>공지사항</span></a></li>
	   <li class='active'><a href='/moebius/board/2/1/'><span>자주하는 질문</span></a></li>
	   <li class='active'><a href='/moebius/mail/email'><span>문의 사항</span></a></li>
	</ul>
</div>
<div id="content" align="center">
<form action="email" method="post">
	<table class="email">
	<caption>E-MAIL 문의</caption>
	<tr>
		<th class="email">보내는 이</th>
		<td class="email"><input type="text" name="user_email" class="mailTitle" value="${userVO.user_email }"/></td>
	</tr>
	
	<tr>
		<th class="email">문의 내용</th>
		<td class="email"><textarea rows="5" name="board_content" class="mailContent"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="보내기" id="btnOk"/>
		</td>
	</tr>
</table>
</form>
<br>
<br>
<br>
</div>
</body>
</html>