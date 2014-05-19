<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
</head>
<body>
<div class="snb">
   <ul>
	   <li class='active'><a href='/moebius/board/1/1/'><span>공지사항</span></a></li>
	   <li class='active'><a href='/moebius/board/2/1/'><span>자주하는 질문</span></a></li>
	   <li class='active'><a href='/moebius/mail/email'><span>문의 사항</span></a></li>
	</ul>
</div>
<div id="content">
<form action="update" method="post">
<table>
	<caption>글 수정</caption>
	<tr>
		<th>제목</th>
		<td><input type="text" name="board_title" style="width:645px;" value="${boardVO.board_title}"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="5" name="board_content" placeholder="" class="textarea">${boardVO.board_content}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정"/>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>