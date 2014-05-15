<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/reserve.css" />" type="text/css" />
<link rel="stylesheet" href="<c:url value="/resources/css/process.css" />" type="text/css" />
<link rel="stylesheet" type="text/css" href="http://html.nhndesign.com/ui_library/css/shCore.css"> 
<link rel="stylesheet" type="text/css" href="http://html.nhndesign.com/ui_library/css/shThemeDefault.css"> 
<link rel="stylesheet" type="text/css" href="http://html.nhndesign.com/ui_library/css/default.css"> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shCore.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shBrushCss.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shBrushXml.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/shBrushJScript.js"></script> 
<script type="text/javascript" src="http://html.nhndesign.com/ui_library/js/default.js"></script>

<title>Insert title here</title>
</head>
<body>
<div id="reserve_content">
	<div class="seat_top"> 인원수 설정 menu | 상영관정보(뿌려주려면 뿌려주고 말려면 말고) </div>
	<div class="seat_content">
		좌석선택	
	</div>

<hr>
<div id="code_origin" class="code_tmpl">
<!-- UI Object -->
<div class="progress">
	<strong class="tit">진행상태</strong>
	<ol>
	<li><span>영화선택</span></li>
	<li><span>극장선택</span></li>
	<li><span>날짜</span></li>
	<li><span>시간</span></li>
	<li class="on"><span>자리선택</span></li>
	</ol>	
</div>
<!-- //UI Object -->
</div>
</div>
</body>
</html>