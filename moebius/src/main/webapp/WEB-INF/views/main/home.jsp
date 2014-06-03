<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.2.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/login.js"/> "></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#btnRegist').bind('click',function(){
		location.href='/moebius/user/regist';
	});
});
</script>
<title>Main</title>
<c:set var="id" value="${sessionScope.user_id}"/>
</head>
<body>
	<div id="first">
		<div id="first_first">
			<iframe src="/moebius/main/plan" width="800px" height="300px" frameborder="0" ></iframe>
		</div>
	
		<div id="first_second">
			<c:choose>
				<c:when test="${id==null}">
				<form action="user/login" method="post">
						<table class="login">
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
									<input type="submit" value="로그인" id="btnLoginOk"/>
									<input type="button" value="회원가입" id="btnRegist"/>
								<div><a href="/moebius/user/searchid">ID</a> / <a href="/moebius/user/searchpwd">PW찾기</a></div>
								</td>
							</tr>
						</table>
					</form>
					</c:when>
					<c:otherwise>
						<table class="userInfo">
							<tr>
								<td colspan="2" align="left">${sessionScope.user_name}<br/></td>
								<td align="right"><input type="button" value="로그아웃" onclick="javascript:location.href='user/logout';"/><br/></td>
							</tr>
							<tr>
								<td class="smallfont">예매내역<br/></td>
								<td class="smallfont">
									나의 포인트<br/>
									<c:if test="${sessionScope.user_id != null }">
									${point}
									</c:if>
								</td>
								<td class="smallfont">무비 캘랜더(준비중)<br/></td>
							</tr>
							<tr>
								<td class="smallfont">상영시간표<br/></td>
								<td class="smallfont">극장찾기<br/></td>
								<td class="smallfont">관람권등록(준비중)</td>
							</tr>
						
						</table>
				</c:otherwise>
			</c:choose>	
		</div>
	</div>
	
	<div id="second" align="center">
		<iframe src="/moebius/main/rank" width="1200px" height="300px" frameborder="0"></iframe>
		

	</div>
	
	<div id="third">
		<div id="third_first" align="center"><a href="http://program.interest.me/ocn/quizofgod4" target="newwin"><img src="<c:url value="/resources/img/ocn.JPG"/>" class="ad_img"/></a></div>
		<div id="third_second"><iframe src="/moebius/main/notice" width="400px" height="200px" frameborder="0"></iframe> </div>
		<div id="third_third"><iframe src="/moebius/main/question" width="400px" height="200px" frameborder="0"></iframe></div>
	</div>
	
	<div class="img"><img src="<c:url value="/resources/img/mainImg.jpg"/>" class="main_img" align="middle"/></div>

</body>
</html>
