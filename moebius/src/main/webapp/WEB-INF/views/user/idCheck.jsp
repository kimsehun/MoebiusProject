<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID중복체크</title>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.0.2.js"/>'></script>
<script type="text/javascript">
$('#btnidCheck').click(function() {
	alert('asdf');
	 
});
</script>
<link rel="stylesheet" href='<c:url value="/resources/css/board.css"/>'
	type="text/css" />
</head>
<body>
	<form:form action="idCheck" method="post" name="idCheck" commandName="userVO" id="frmcheckId">
		<table>
			<caption>ID 중복 체크</caption>
			<tr>
				<th>아이디</th>
					<td>${userVO.user_id }
						<input type="text" name="user_id" id="user_id" value="${userVO.user_id }"/>
						<input type="submit" name="idCheck" value="ID중복체크" id="btnidCheck" />
					</td>
			</tr>
		</table>
	</form:form>
</body>
</html>