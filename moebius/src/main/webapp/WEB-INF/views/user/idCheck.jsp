<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID중복체크</title>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.0.2.js"/>'></script>
<script type="text/javascript">
$('#btnidCheck').click(function() {
	
});
</script>
<link rel="stylesheet" href='<c:url value="/resources/css/board.css"/>'
	type="text/css" />
</head>
<body>
	<form action="checkId" method="post" name="checkId">
		<table>
			<caption>ID 중복 체크</caption>
			<tr>
				<th>아이디</th>
					<td>
						<input type="text" name="user_id" id="user_id" value="${userVO.user_id }"/>
						<input type="button" name="idCheck" value="ID중복체크" id="btnidCheck" />
					</td>
			</tr>
		</table>
	</form>
</body>
</html>