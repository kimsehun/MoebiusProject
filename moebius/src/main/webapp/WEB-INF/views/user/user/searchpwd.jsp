<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
alear('${msg}');
</script>
<form action="searchpwd" method="post" >
		<table>
			<caption>비밀번호 찾기</caption>
			<tr>
				<th>ID</th>
					<td>
						<input type="text" name="user_id" /><br/>
					</td>
			</tr>
			<tr>
				<th>비밀번호 찾기 질문</th>
					<td>
						<select name="user_pwd_hint" id="user_pwd_hint">
							<option value="color">좋아하는 색깔은?</option>
							<option value="school">초등학교 이름은?</option>
							<option value="name">어머니 성함은?</option>
						</select><br/>
					</td>
			</tr>
			<tr>
				<th>비밀번호 찾기 답</th>
					<td>
						<input type="text" name="user_pwd_answer" class="input_text_300" value="${userVO.user_pwd_answer }" /><br/>
						<form:errors path="user_pwd_answer" cssClass="msg_warn" /><br/>
					</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="center">
					<input type="submit" value="찾기" id="btnRegistOk" />
					</div>
				</td>
			</tr>
		</table>
</form>
</body>
</html>