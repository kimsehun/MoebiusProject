<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
	<link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		jQuery(function($){
			var tab = $('.tab_face');
			tab.removeClass('js_off');
			function onSelectTab(){
				var t = $(this);
				var myclass = [];
				t.parentsUntil('.tab_face:first').filter('li').each(function(){
					myclass.push( $(this).attr('class') );
				});
				myclass = myclass.join(' ');
				if (!tab.hasClass(myclass)) tab.attr('class','tab_face').addClass(myclass);
			}
			tab.find('li>a').click(onSelectTab).focus(onSelectTab);
		});
	</script>
</head>
<body>
	<div id="header" class="tab_face m1 s1">
	    <ul>
	    <li>로고</li>
	    <li class="m1"><a href="#"><span>극장</span></a>
	    </li>
	
	    <li class="m2"><a href="#"><span>영화</span></a>
	        <ul>
	        <li class="s1"><a href="#">현재상영작</a></li>
	        <li class="s2"><a href="#">개봉예정작</a></li>
	        </ul>
	    </li>
	
	    <li class="m3"><a href="#"><span>예매</span></a></li>
	    
	    <li class="m4"><a href="#"><span>고객센터</span></a>
	        <ul>
	        <li class="s1"><a href="#">공지사항</a></li>
	        <li class="s2"><a href="#">자주하는질문</a></li>
	        <li class="s3"><a href="#">문의사항</a></li>
	        </ul>
	    </li>
	
	    
	    </ul>
	    
	    
	</div>


	
	<decorator:body />
	
	
	<div id="footer" class="footer">
		<hr>
		<div class="button">GROUP : MOEBIUS </div>
		<div class="button">DEVELOPER : MW, SH, JW, YB</div>
	</div>	
</body>
</html>