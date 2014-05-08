<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript">
/**
 * 	게시판 상세보기 : 댓글
 */
	$(document).ready(function(){
	
		$('#btnList').bind('click',function(){
			location.href="..";
		});
		
		$('#btnUpdate').bind('click',function(){
			location.href="update";
		});

		$('#btnDelete').bind('click',function(){
			if(confirm('정말로 삭제하시겠습니까?')){	
				location.href='delete';
			}
		});
	});

</script>
</head>
<body>
<input type="hidden" name="no" value="${boardVO.board_no}">
<input type="hidden" name="bno" value="${bno}">
<input type="hidden" name="session_user_id" value="${sessionScope.user_id}" >
<table>
	<caption>글 상세보기</caption>
	<tr>
		<th>글번호</th>
		<td class="width">${boardVO.board_no}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${boardVO.board_title}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${boardVO.userVO.user_name}(${boardVO.userVO.user_id})</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${boardVO.board_count}</td>
	</tr>
	<tr>
		<th>작성시간</th>
		<td>${boardVO.board_regdate}</td>
	</tr>
	<tr>
		<th colspan="2">내용</th>
	</tr>
	<tr>		
		<td colspan="2">${boardVO.board_content}</td>
	</tr>
</table><br/>
<div class="right">
<input type="button" value="목록" id="btnList">
<c:if test="${sessionScope.user_id == boardVO.userVO.user_id}">
	<input type="button" value="수정" id="btnUpdate" />
	<input type="button" value="삭제" id="btnDelete"/>
</c:if>
</div>
<br>
</body>
</html>