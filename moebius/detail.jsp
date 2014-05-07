<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/board.css" />"
	type="text/css" />
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript">
/**
 * 	게시판 상세보기 : 댓글
 */

	var commentList;
	$(document).ready(function(){
		$.ajax({
			url:'<c:url value="/comment/${vo.no}" />',
			type:'POST',
			success:function(data){
				$('#taComment').val('');
				commentList='<table>';
				$.each(data, setCommentList);
				commentList += '</table>';
				
				$('#commentDisplay').html(commentList);
			}
		});

	
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
		
		$('#btnCommentOk').bind('click', function(){
			var user_id = '${sessionScope.user_id}';
			var bcomment = $('#taComment').val();
			var bno = ${bno};
			var no = ${vo.no};
			var comment_url = '<c:url value="/comment/insert" />';
			$.ajax({
				url:comment_url,
				type:'POST',
				data:{
					'user_id':user_id,
					'bcomment':bcomment,
					'bno'	 :bno,
					'no'	 :no
					
				},
				success:function(data){
					$('#taComment').val('');
					commentList='<table>';
					$.each(data, setCommentList);
					commentList += '</table>';
					
					$('#commentDisplay').html(commentList);
				}
			});
		});
	});
	
		function deleteComment(cno) {
			if (confirm(cno+'번 댓글 삭제?')) {
			$.ajax({
				url:'<c:url value="/comment/${vo.no}/" />' + cno + '/delete',
				type:'POST',
				success:function(data){
					$('#taComment').val('');
					commentList='<table>';
					$.each(data, setCommentList);
					commentList += '</table>';
					
					$('#commentDisplay').html(commentList);
				}
			});
			}
		}
		
		function getUpdateComment(cno) {
			$.ajax({
				url:'<c:url value="/comment/${vo.no}/" />' + cno + '/getUpdate',
				type:'POST',
				success:function(date) {
					$('#taComment').val(data['bcomment']);
					
				}
			});
		}
		
	function setCommentList() {
			
			commentList += '<tr>';
			commentList += '<td>'+ this['user_id']+'</td>';						
			commentList += '<td class="commentinsert"><div id="upcomm'+_cno+'">' + this['bcomment']+'</div></td>';
			commentList += '<td>' + this['regdate']+'</td><td>';
			if (this['user_id'] == '${sessionScope.user_id}') {
				var _cno = this['cno'];
				commentList += '<input type="button" value="삭제" onclick="javascript:deleteComment('+_cno+');" />';
				commentList += '<input type="button" value="수정" onclick="javascript:getUpdateComment('+_cno+');" />';
			}
			commentList += '</td></tr>';
		};

</script>
</head>
<body>
	<input type="hidden" name="no" value="${vo.no}">
	<input type="hidden" name="bno" value="${bno}">
	<input type="hidden" name="comment_url"
		value="<c:url value="/comment/insert" />">
	<input type="hidden" name="session_user_id"
		value="${sessionScope.user_id}">
	<table>
		<caption>글 상세보기</caption>
		<tr>
			<th>글번호</th>
			<td class="width">${vo.no}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.userVO.user_name}(${vo.userVO.user_id})</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.count}</td>
		</tr>
		<tr>
			<th>작성시간</th>
			<td>${vo.regdate}</td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
		</tr>
		<tr>
			<td colspan="2">${vo.content}</td>
		</tr>
	</table>
	<br />
	<div class="right">
		<input type="button" value="목록" id="btnList">
		<c:if test="${sessionScope.user_id == vo.userVO.user_id}">
			<input type="button" value="수정" id="btnUpdate">
			<input type="button" value="삭제" id="btnDelete" />
		</c:if>
	</div>
	<br>
	<div id="commentDisplay"></div>
	<table>
		<tr>
			<td class="comment">${sessionScope.user_id}</td>
			<td class="commentcontent"><textarea rows="5" name="bcomment"
					id="taComment" style="width: 560px; height: 50px"></textarea></td>
			<td><input type="button" id="btnCommentOk" value="확인" /></td>
		</tr>
	</table>
</body>
</html>