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
/**
 * 댓글
 */
 	var commentList;
 	$(document).ready(function(){
 		 		
 		//상세보기 페이지 읽어오는 순간 ajax를 읽어서 댓글 리스트를 뿌려준다.
 		$.ajax({
 			url:'<c:url value="/comment/${movieVO.movie_no}" />',
 			type:'POST',
 			success:function(data){
 				if(data.result=="false") {
//***alert을 발생시키지 못함!!!!
 					alert('data.msg');
 				} 
 				$('#taComment').val('');
 				commentList='<table>';
 				commentList += '<tr>';
 		 		commentList += '<td>' + '아이디' + '</td>';
 		 		commentList += '<td>' + '내용' + '</td>';
 		 		commentList += '<td>' + '별점' + '</td>';
 		 		commentList += '<td>' + '삭제' + '</td></tr>';
 				$.each(data.list, setCommentList);
 				commentList += '</table>';
 				
 				$('#commentDisplay').html(commentList);
 				$('#avg').html(data.star + " / ●●●●●");
 			}
 		});
 		
 		//댓글 insert부분
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
					$('#comment_star').val('');
					$('#taComment').val('');
					commentList='<table>';
					commentList += '<tr>';
	 		 		commentList += '<td>' + '아이디' + '</td>';
	 		 		commentList += '<td>' + '내용' + '</td>';
	 		 		commentList += '<td>' + '별점' + '</td>';
	 		 		commentList += '<td>' + '삭제' + '</td></tr>';
					$.each(data.list, setCommentList);
					commentList += '</table>';
					
					$('#commentDisplay').html(commentList);
					$('#avg').html(data.star + " / ●●●●●");
				}
			});
		});
	});
 	
 	//댓글 삭제 부분
	function deleteComment(cno) {
		if (confirm(cno+'번 댓글 삭제?')) {
		$.ajax({
			url:'<c:url value="/comment/${movieVO.movie_no}/" />' + cno + '/delete',
			type:'POST',
			success:function(data){
				$('#taComment').val('');
				commentList='<table>';
				commentList += '<tr>';
 		 		commentList += '<td>' + '아이디' + '</td>';
 		 		commentList += '<td>' + '내용' + '</td>';
 		 		commentList += '<td>' + '별점' + '</td>';
 		 		commentList += '<td>' + '삭제' + '</td></tr>';
				$.each(data.list, setCommentList);
				commentList += '</table>';
				
				$('#commentDisplay').html(commentList);
				$('#avg').html(data.star + " / ●●●●●");
			}
		});
		}
	}
 	
 	//리스트 부분을 테이블 형식을 빌어 뿌려준다.
 	function setCommentList() {
 		commentList += '<tr>';
 		commentList += '<td>' + this['user_id'] + '</td>';
 		commentList += '<td>' + this['comment_review'] + '</td>';
 		commentList += '<td>' + this['comment_star'] + '</td><td>';
		if (this['user_id'] == '${sessionScope.user_id}') {
			var _cno = this['comment_no'];
			commentList += '<input type="button" value="삭제" onclick="javascript:deleteComment('+_cno+');" />';
		}
		commentList += '</td></tr>';
 	}

</script>
</head>
<body>
<table align="center">
	<tr>
		<td rowspan="4" align="center">
<!-- css style -->
		<img src="/moebius/movie/download?fileName=${movieVO.movie_poster}" style="width:300px"/>
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
영화 평점 : <div id="avg"></div><br/>	
	<c:if test="${sessionScope.user_id != null }">
	<table>
		<tr>
			<td colspan="2">별점<input type="number" id="comment_star" min="0" max="5" step="0.5"/></td>
		</tr>
		<tr>
			<td class="comment" name="user_id">${sessionScope.user_id}</td>
			<td class="commentcontent"><textarea rows="5" name="bcomment"
					id="taComment" style="width: 560px; height: 50px"></textarea></td>
			<td><input type="button" id="btnCommentOk" value="확인" /></td>
		</tr>
	</table>
	</c:if>
	<div id="commentDisplay"></div>
<br/>
</body>
</html>
