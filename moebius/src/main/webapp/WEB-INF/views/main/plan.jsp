<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<!-- CSS -->
<style type="text/css">
 ul {list-style-type:none;margin:0;padding:0;}
   li {margin:0;padding:0;}
   div.gallery_rolling .arrow_prev {position:relative;left:-100px;width:15px;height:35px;cursor:pointer;z-index:1;}
   div.gallery_rolling .arrow_next {position:relative;left:550px;width:15px;height:35px;cursor:pointer;z-index:1;}
   div.gallery_rolling div.carrousel_box {top:10px;overflow:hidden;width:434px;}
   div.gallery_rolling li {float:left; width:600px; height: 180px;}
</style>
<!-- JavaScripts-->
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.0.2.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.rolling.js'/>"></script>
<script type="text/javascript">
jQuery(function($){
    $("div.gallery_rolling").gallery_rolling();
 });
</script>
</head>
<body>
	<table width="500px" border="0" align="center" cellpadding="0"	cellspacing="0">
		<tr>
		<!--jpmain_content1.2.3 회살표로 롤링-->
			<td width="800" height="180">
				<div class=gallery_rolling>
					<span class=arrow_prev>&lt;</span> <span class=arrow_next>&gt;</span>
					<div class=carrousel_box>
						<ul><c:forEach items="${list2}" var="movieVO">
							<li>
								<div class=img_box><a href="/moebius/movie/detail/${movieVO.movie_no}/" target="newwin"><img src="/moebius/movie/download?fileName=${movieVO.movie_poster}" style="width: 500px; height: 180px" /></a></div>
							</li>
						</c:forEach></ul>
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
