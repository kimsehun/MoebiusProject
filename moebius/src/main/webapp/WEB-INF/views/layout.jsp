<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<c:set var="id" value="${sessionScope.user_id}"/>
<c:set var="name" value="${sessionScope.user_name }"/>
<decorator:head></decorator:head>
<!-- site mesh 처리할때 menu_jquery.js하고 main.css안에 내포된 png파일의 그림 오류 해결할것!! -->
<link rel="stylesheet" href="<c:url value="/resources/css/layout.css" />" type="text/css" />
	<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
	<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
</head>
<body>

    <div id="logo">
		<img src='<c:url value="/resources/img/logo.png"/>'>
    </div>
	<div id='header'>
	   <ul>
		   <li class='active'><a href='/moebius'><span>Home</span></a></li>
		   <li class='active'><a href='/moebius/reserve'><span>예매</span></a></li>
		   <li class='has-sub'><a href='/moebius/movie/ranking'><span>영화</span></a>
		      <ul>
		         <li><a href='/moebius/movie/ranking'><span>현재상영작</span></a></li>
		         <li><a href='/moebius/movie/plan'><span>상영예정작</span></a></li>
		      </ul>
		   </li>
		   
		   <li class='last'><a href='/moebius/location/place'><span>극장</span></a></li>

		   
		   <c:choose>
		   
			   <c:when test="${id==null }">
			   		<li class='has-sub-right'><a href='/moebius/board/1/1/'><span>고객센터</span></a>
				      <ul>
				         <li><a href='/moebius/board/1/1/'><span>공지사항</span></a></li>
				         <li><a href='/moebius/board/2/1/'><span>질문</span></a></li>
				         <li class='last'><a href='/moebius/mail/email'><span>문의사항</span></a></li>
				      </ul>
				   </li>
				   <li class='right'><a href='/moebius/user/login'><span>로그인</span></a></li>
	
				   <li class='right'><a href='/moebius/user/regist'><span>회원가입</span></a></li>
			   </c:when>
			   
			   <c:when test="${id == 'admin'}">	
				   <li class='right'><a href='/moebius/user/logout'><span>${name}님 로그아웃</span></a></li>
				   <li class='has-sub-right'><a href='#'><span>관리자 페이지</span></a>
				  	 <ul>
				         <li><a href='/moebius/movie/insert'><span>영화 등록</span><br></a></li>
				         <li><a href='/moebius/screen/insert'><span>상영관 등록</span><br></a></li>
				         <li><a href='/moebius/movie/delete'><span>영화 삭제</span><br></a></li>
				      </ul>
				   </li>
				   <li class='has-sub-right'><a href='/moebius/board/1/1/'><span>고객센터</span></a>
				      <ul>
				         <li><a href='/moebius/board/1/1/'><span>공지사항</span></a></li>
				         <li><a href='/moebius/board/2/1/'><span>질문</span></a></li>
				         <li class='last'><a href='/moebius/mail/email'><span>문의사항</span></a></li>
				      </ul>
				   </li>
		 	  </c:when>
		 	  
		      <c:otherwise>
			   <li class='right'><a href='/moebius/user/logout'><span>${name}님 로그아웃</span></a></li>
			   <li class='has-sub-right'><a href='/moebius/user/userInfo'><span>유저정보</span></a>
			  	 <ul>
			         <li><a href='/moebius/user/update'><span>정보수정</span><br></a></li>
			         <li><a href='/moebius/user/delete'><span>정보삭제</span><br></a></li>
			         <li><a href='/moebius/user/userInfo'><span>예매정보</span></a></li>
			      </ul>
			   </li>
			   <li class='has-sub-right'><a href='/moebius/board/1/1/'><span>고객센터</span></a>
				      <ul>
				         <li><a href='/moebius/board/1/1/'><span>공지사항</span></a></li>
				         <li><a href='/moebius/board/2/1/'><span>질문</span></a></li>
				         <li class='last'><a href='/moebius/mail/email'><span>문의사항</span></a></li>
				      </ul>
				</li>
		     </c:otherwise>
		   </c:choose>
		</ul>
	</div>
	<div id="wrap">
	<decorator:body />
	
	<!-- Footer -->
	<div id="footer">
	    <p class="info">
	        대표이사 : 김민우   |    사업자등록번호 : 111-11-11111   |   통신판매업신고번호 구로
			개인정보관리 책임자 : 송유빈     
		</p>
		 <p class="info">
		 	  대표이메일 moebius@moebius.com
			고객센터   1111-1111   ARS 예매  1111-1112
		</p>
	    <address>
	        <em>GROUP : MOEBIUS</em>
	        <a href="#" target="_blank">DEVELOPER : MW, SH, JW, YB</a>
	        <span>All Rights Reserved.</span>
	    </address>
	</div>
</div>
</body>
</html>