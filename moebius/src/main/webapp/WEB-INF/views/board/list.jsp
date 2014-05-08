<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
</head>
<body>
<form action="insert" method="GET" >
<input type="hidden" id="bno" value="${bno}">
<table border="1">
	<caption>${boardInfo.bname}</caption>
	<tr>
		<td colspan="5">총 게시물 수 : ${result.recordCount}</td>
	</tr>
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${list}" var="boardVO" varStatus="st">
	<tr>
		<td>${boardVO.board_no}</td>
		<td><a href="${boardVO.board_no}/">${boardVO.board_title}</a></td>
		<td>${boardVO.userVO.user_name}</td>
		<td>${boardVO.board_regdate}</td>
		<td align="right">${boardVO.board_count}</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="5">
			<input type="submit" value="글쓰기" id="btnOk"/>
		</td>
	</tr>
</table><br/>
</form>
</body>
</html>