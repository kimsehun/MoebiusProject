<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Main</title>
</head>
<body>
<!-- 임시적으로 site mesh를 봉인했음... site mesh를 사용하면 javascipt연결이 안되서 해결방법을 알때까지 site mesh 봉인하겠음-->
	 <ul>
		   <li class='active'><a href='/moebius'><span>Home</span></a></li>
		   <li class='has-sub'><a href='#'><span>영화</span></a>
		      <ul>
		         <li><a href='#'><span>현재상영작</span></a></li>
		         <li><a href='#'><span>상영예정작</span></a></li>
		      </ul>
		   </li>
		   <li class='last'><a href='#'><span>극장</span></a></li>
		   <li class='has-sub'><a href='#'><span>고객센터</span></a>
		      <ul>
		         <li><a href='#'><span>공지사항</span></a></li>
		         <li><a href='#'><span>자주하는질문</span></a></li>
		         <li class='last'><a href='#'><span>문의사항</span></a></li>
		      </ul>
		   </li>
		   <li class='right'><a href='/moebius/user/login'><span>로그인</span></a></li>
		   <li class='right'><a href='/moebius/user/regist'><span>회원가입</span></a></li>
		</ul>
		<!-- 임시처리 end -->
</body>
</html>