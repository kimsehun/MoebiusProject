<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript">
	if($('#user_id').equals('admin')){
		alert('로그인 했음');
	}
	else {
		alert('잘못된 접근입니다.');
		location.href='../../../user/login';
	}
</script>
</head>
<body>
<input type="hidden" id="user_id" value="${user_id}">
<form action="insert" method="post">
<div class="snb">
   <ul>
	   <li class='active'><a href='/moebius/board/1/1/'><span>공지사항</span></a></li>
	   <li class='active'><a href='/moebius/board/2/1/'><span>자주하는 질문</span></a></li>
	   <li class='active'><a href='/moebius/mail/email'><span>문의 사항</span></a></li>
	</ul>
</div>
<div id="content">
<table>
	<caption>글 쓰기</caption>
	<tr>
		<th>제목</th>
		<td><input type="text" name="board_title" style="width:645px;"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="5" name="board_content" id="content" style="width:645px; height:268px" placeholder=""></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="완료" id="btnOk"/>
		</td>
	</tr>
</table>
</div>
</form>
</body>
</html>