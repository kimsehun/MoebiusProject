﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
/**
 * 댓글
 */
 	var commentList;
 	$(document).ready(function(){
 		$.ajax({
 			url:'<c:url value="/comment/${movieVO.movie_no}" />',
 			type:'POST',
 			success:function(data){
 				alert(data);
 				$('#taComment').val('');
 				commentList='<table>';
 				$.each(data, setCommentList);
 				commentList += '</table>';
 				
 				$('#commentDisplay').html(commentList);
 			}
 		});
 		
 		$('#btnCommentOk').bind('click', function(){
			var user_id = '${sessionScope.user_id}';
			var comment_review = $('#taComment').val();
			var movie_no = ${movieVO.movie_no};
			var comment_star = $('#comment_star').val();
			var comment_url = '<c:url value="/comment/insert" />';
			$.ajax({
				url:comment_url,
				type:'POST',
				data:{
					'user_id':user_id,
					'comment_review':comment_review,
					'comment_star':comment_star,
					'movie_no':movie_no
				},
				success:function(data){
					console.log('1');
					$('#comment_star').val('');
					$('#taComment').val('');
					commentList='<table>';
					$.each(data, setCommentList);
					commentList += '</table>';
					
					$('#commentDisplay').html(commentList);
				}
			});
		});
	});
 	
 	function setCommentList() {
 		commentList += '<tr>';
 		commentList += '<td>' + this['user_id'] + '</td>';
 		commentList += '<td>' + this['comment_review'] + '</td>';
 		commentList += '<td>' + this['comment_star'] + '</td><td>';
 		commentList += '<td>' + this['comment_avgstar'] + '</td><td>';
		if (this['user_id'] == '${sessionScope.user_id}') {
			var _cno = this['comment_no'];
			commentList += '<input type="button" value="삭제" onclick="javascript:deleteComment('+_cno+');" />';
		}
		commentList += '</td></tr>';
 	}

</script>
</head>
<body>
	<input type="hidden" name="no" value="${movieVO.movie_no}">
<table>
	<tr>
		<td rowspan="4" align="center">
		<img src="download?fileName=${movieVO.movie_poster}" />
		</td>
		<th>
			${movieVO.movie_title}
		</th>
	</tr>
	<tr>
		<td>
			기본 ${movieVO.movie_genre} | ${movieVO.movie_nation} | ${movieVO.movie_runningtime} | 개봉일 : ${movieVO.movie_sdate}
		</td>
	</tr>
	<tr>
		<td>
			감독 ${movieVO.movie_directer}
		</td>
	</tr>
	<tr>
		<td>
			출연 ${movieVO.movie_actor}
		</td>
	</tr>
	<tr>
		<td>
			등급
		<c:if test="${movieVO.movie_grade == 1 }">
			15세 미만 관람불가
		</c:if>
		<c:if test="${movieVO.movie_grade == 2 }">
			청소년 관람불가
		</c:if>
		<c:if test="${movieVO.movie_grade == 3 }">
			전연령 관람가능
		</c:if>
		</td>
	</tr>
	<tr>
		<th colspan="2">줄거리</th>
	</tr>
	<tr>		
		<td colspan="2">${movieVO.movie_story}</td>
	</tr>
</table>
<br/>
	<div id="commentDisplay"></div>
	<c:if test="${sessionScope.user_id != null }">
	<table>
		<tr>
			<td colspan="2">평점<input type="number" id="comment_star" min="0" max="5" step="0.5"/></td>
		</tr>
		<tr>
			<td class="comment" name="user_id">${sessionScope.user_id}</td>
			<td class="commentcontent"><textarea rows="5" name="bcomment"
					id="taComment" style="width: 560px; height: 50px"></textarea></td>
			<td><input type="button" id="btnCommentOk" value="확인" /></td>
		</tr>
	</table>
	</c:if>
<br/>
</body>
</html>