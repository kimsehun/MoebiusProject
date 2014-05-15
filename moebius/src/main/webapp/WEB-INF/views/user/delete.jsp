<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#btnDeleteUser').bind('click',function(){
		if(confirm('정말로 삭제하시겠습니까?')){	
			document.deleteCheck.submit();
		}
	});
});
</script>
</head>
<body>
<div class="snb">
   <ul>
	   <li class='active'><a href='/moebius/user/update'><span>회원정보수정</span></a></li>
	   <li class='active'><a href='/moebius/user/delete'><span>회원탈퇴</span></a></li>
	   <li class='active'><a href='#'><span>예매정보</span></a></li>
	</ul>
</div>
<div id="content">
	<form action="delete" method="post" name="deleteCheck">
	<table>
		<caption>회원탈퇴</caption>
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
				<input type="button" value="확인" id="btnDeleteUser"/>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>