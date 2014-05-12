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
<input type="hidden" name="pg" value="${pg}" />
<div id='sidebar'>
   <ul>
	   <li class='active'><a href='/moebius/board/1/1/'><span>공지사항</span></a></li>
	   <li class='active'><a href='/moebius/board/2/1/'><span>자주하는 질문</span></a></li>
	   <li class='active'><a href='/moebius/board/3/1/'><span>문의 사항</span></a></li>
	</ul>
</div>

<div id="content" align="center">
<form action="insert" method="GET" >
<input type="hidden" id="bno" value="${bno}">
<table border="1">
	<caption>${boardInfo.bname}</caption>
	<tr>
		<td colspan="5">현재 페이지: ${pg} / 총 게시물 수 : ${totalRecord}</td>
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
	<tr>
		<td colspan="5">
			<c:choose>
				<c:when test="${startPage == 1}">
				</c:when>
				<c:otherwise>
					<a href="">[이전]</a>
				</c:otherwise>
			</c:choose>		
			
			<c:forEach var="p" begin="${startPage}" end="${endPage}" >
				<c:choose>
					<c:when test="${p == pg}">${p}</c:when>
					<c:otherwise>
						<a href="../${p}/">[${p}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:choose>
				<c:when test="${endPage == pageCount}">
					
				</c:when>
				<c:otherwise>
					<a href="">[다음]</a>
				</c:otherwise>
			</c:choose>			
		</td>
	</tr>
</table><br/>
</form>
</div>
</body>
</html>