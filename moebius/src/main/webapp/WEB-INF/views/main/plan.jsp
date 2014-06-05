<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/rolling.css" />" type="text/css" />
<!-- JavaScripts-->
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.0.2.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.rolling.js'/>"></script>
<script type="text/javascript">
jQuery(function($){
    $("div.gallery_rolling").gallery_rolling();
 });
</script>
</head>
<body class="planBody">
	<table class="plan">
		<tr>
		<!--jpmain_content1.2.3 회살표로 롤링-->
			<td height="300px">
				<div class=gallery_rolling>
					<span class=arrow_prev>&lt;</span> <span class=arrow_next>&gt;</span>
					<div class=carrousel_box>
						<ul><c:forEach items="${list2}" var="movieVO">
							<li>
								<div class=img_box><a href="/moebius/movie/detail/${movieVO.movie_no}/" target="_blank"><img src="/moebius/movie/download?fileName=sm_${movieVO.movie_poster}" style="width: auto; height: 300px" /></a></div>
							</li>
						</c:forEach></ul>
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
