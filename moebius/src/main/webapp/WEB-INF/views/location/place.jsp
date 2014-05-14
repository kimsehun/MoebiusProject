<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- 숨겨진 테이블 보이기 -->
<script type="text/javascript" src="/moebius/resources/js/jquery-2.0.2.js"></script>
<script type="text/javascript">
var name, addx, addy, addr, ph;
	$(document).ready(function() {
		$('#btnLocation').click(function() {
			var location_no = $('#location_no').val();
			var comment_url = '<c:url value="/location/place" />';
			$('#testMap').empty();
			$.ajax({
				url : comment_url,
				type : 'POST',
				data : {
					'location_no' : location_no
				},
				success : function(data) {
// 					alert(data.vo.location_addy);
// 					alert(data.vo.location_addx);
					name = data.vo.location_name;
					addr = data.vo.location_addr;
					addx = data.vo.location_addx;
					addy = data.vo.location_addy;
					ph = data.vo.location_phone;
					document.getElementById("view").style.display = "block";
					$('#td1').html(name);
					$('#td2').html(addr);
					$('#td3').html(ph);
			// 네이버 지도
				var oPoint = new nhn.api.map.LatLng(addy, addx);
				nhn.api.map.setDefaultPoint('LatLng');
				oMap = new nhn.api.map.Map('testMap', {
					point : oPoint,  //지도의 최초 중심점입니다. 앞서 설정하였던 oPoint 를 사용합니다.
					zoom : 10,  //최초 지도의 줌 설정값입니다. 
					enableWheelZoom : true,	//마우스 휠을 이용해 줌 인/아웃을 이용할것인지를 선택합니다 true, false
					enableDragPan : true,	//마우스로 드래그를 활성하 할것인지 선택합니다. true, false
					enableDblClickZoom : false, //더블클릭으로 확대 여부 true, false
					mapMode : 0,  // 최초 지도의 방식을 선택 0:일반지도 1:위성지도
					activateTrafficMap : false,	// 교통상황
					activateBicycleMap : false, // 자전거 지도
					minMaxLevel : [ 1, 14 ],  // 최대 축소와 확대값
					size : new nhn.api.map.Size(500, 400) // 지도의 사이즈를 설정
				});
				   var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언 
			       mapZoom.setPosition({left:10, bottom:150}); // - 줌 컨트롤 위치 지정 
			       oMap.addControl(mapZoom); // - 줌 컨트롤 추가. 
			       mapTypeChangeButton = new nhn.api.map.MapTypeBtn(); // - 지도 타입 버튼 선언 
			       mapTypeChangeButton.setPosition({top:10, left:680}); // - 지도 타입 버튼 위치 지정 
			       oMap.addControl(mapTypeChangeButton); //지도타입버튼
			       
			       var oSize = new nhn.api.map.Size(28, 37);
			       var oOffset = new nhn.api.map.Size(14, 37);
			       var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
			       // Draggable Marker 의 경우 Icon 인자는 Sprite Icon이 된다.
				   // 따라서 Sprite Icon 을 사용하기 위해 기본적으로 사용되는 값을 지정한다.
			       // Sprite Icon 을 사용하기 위해서 상세한 내용은 레퍼런스 페이지의 nhn.api.map.SpriteIcon 객체를 참조하면 된다.
				       
				   var oMarker1 = new nhn.api.map.Marker(oIcon, { title : name });  //마커 생성 
				   oMarker1.setPoint(oPoint); //마커 표시할 좌표 선택
				   oMap.addOverlay(oMarker1); //마커를 지도위에 표현 
				   var oLabel1 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
				   oMap.addOverlay(oLabel1); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
				   oLabel1.setVisible(true, oMarker1); // 마커 라벨 보이기
				}
			});
			
		});
	});
	
</script>
</head>
<body>
<!-- 극장선택 -->
<select name="location_no" id="location_no">
	<option value="1" selected="selected">구로 디지털</option>
	<option value="2">영등포</option>
	<option value="3">용산</option>	
	<option value="4">홍대입구</option>	
</select>
<input type="button" id="btnLocation" value="확인"><br/>
<!--  <input type="submit" value="확인" onclick="mapApi()" > -->
<div id="view" style="display:none">
	<table border=1 cellpadding=0>
		<tr>
			<td colspan="2">
			<!-- 네이버 지도 -->
				<script type="text/javascript"	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=983caf927eed44efd87b9874510e036d"></script>
				<div id="testMap" style="border: 1px solid #000; width: 500px; height: 400px; margin: 20px;"></div>
			</td>
		</tr>
		<tr>
			<td>극장명</td>
			<td><div id="td1">${vo.location_name}</div></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><div id="td2">${vo.location_addr}</div></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><div id="td3">${vo.location_phone}</div></td>
		</tr>
	</table>
</div>
</body>
</html>