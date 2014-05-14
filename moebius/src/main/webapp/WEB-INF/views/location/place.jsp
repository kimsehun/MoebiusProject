<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- ������ ���̺� ���̱� -->
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
			// ���̹� ����
				var oPoint = new nhn.api.map.LatLng(addy, addx);
				nhn.api.map.setDefaultPoint('LatLng');
				oMap = new nhn.api.map.Map('testMap', {
					point : oPoint,  //������ ���� �߽����Դϴ�. �ռ� �����Ͽ��� oPoint �� ����մϴ�.
					zoom : 10,  //���� ������ �� �������Դϴ�. 
					enableWheelZoom : true,	//���콺 ���� �̿��� �� ��/�ƿ��� �̿��Ұ������� �����մϴ� true, false
					enableDragPan : true,	//���콺�� �巡�׸� Ȱ���� �Ұ����� �����մϴ�. true, false
					enableDblClickZoom : false, //����Ŭ������ Ȯ�� ���� true, false
					mapMode : 0,  // ���� ������ ����� ���� 0:�Ϲ����� 1:��������
					activateTrafficMap : false,	// �����Ȳ
					activateBicycleMap : false, // ������ ����
					minMaxLevel : [ 1, 14 ],  // �ִ� ��ҿ� Ȯ�밪
					size : new nhn.api.map.Size(500, 400) // ������ ����� ����
				});
				   var mapZoom = new nhn.api.map.ZoomControl(); // - �� ��Ʈ�� ���� 
			       mapZoom.setPosition({left:10, bottom:150}); // - �� ��Ʈ�� ��ġ ���� 
			       oMap.addControl(mapZoom); // - �� ��Ʈ�� �߰�. 
			       mapTypeChangeButton = new nhn.api.map.MapTypeBtn(); // - ���� Ÿ�� ��ư ���� 
			       mapTypeChangeButton.setPosition({top:10, left:680}); // - ���� Ÿ�� ��ư ��ġ ���� 
			       oMap.addControl(mapTypeChangeButton); //����Ÿ�Թ�ư
			       
			       var oSize = new nhn.api.map.Size(28, 37);
			       var oOffset = new nhn.api.map.Size(14, 37);
			       var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
			       // Draggable Marker �� ��� Icon ���ڴ� Sprite Icon�� �ȴ�.
				   // ���� Sprite Icon �� ����ϱ� ���� �⺻������ ���Ǵ� ���� �����Ѵ�.
			       // Sprite Icon �� ����ϱ� ���ؼ� ���� ������ ���۷��� �������� nhn.api.map.SpriteIcon ��ü�� �����ϸ� �ȴ�.
				       
				   var oMarker1 = new nhn.api.map.Marker(oIcon, { title : name });  //��Ŀ ���� 
				   oMarker1.setPoint(oPoint); //��Ŀ ǥ���� ��ǥ ����
				   oMap.addOverlay(oMarker1); //��Ŀ�� �������� ǥ�� 
				   var oLabel1 = new nhn.api.map.MarkerLabel(); // - ��Ŀ �� ����. 
				   oMap.addOverlay(oLabel1); // - ��Ŀ �� ������ �߰�. �⺻�� ���� ������ �ʴ� ���·� �߰���. 
				   oLabel1.setVisible(true, oMarker1); // ��Ŀ �� ���̱�
				}
			});
			
		});
	});
	
</script>
</head>
<body>
<!-- ���弱�� -->
<select name="location_no" id="location_no">
	<option value="1" selected="selected">���� ������</option>
	<option value="2">������</option>
	<option value="3">���</option>	
	<option value="4">ȫ���Ա�</option>	
</select>
<input type="button" id="btnLocation" value="Ȯ��"><br/>
<!--  <input type="submit" value="Ȯ��" onclick="mapApi()" > -->
<div id="view" style="display:none">
	<table border=1 cellpadding=0>
		<tr>
			<td colspan="2">
			<!-- ���̹� ���� -->
				<script type="text/javascript"	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=983caf927eed44efd87b9874510e036d"></script>
				<div id="testMap" style="border: 1px solid #000; width: 500px; height: 400px; margin: 20px;"></div>
			</td>
		</tr>
		<tr>
			<td>�����</td>
			<td><div id="td1">${vo.location_name}</div></td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td><div id="td2">${vo.location_addr}</div></td>
		</tr>
		<tr>
			<td>��ȭ��ȣ</td>
			<td><div id="td3">${vo.location_phone}</div></td>
		</tr>
	</table>
</div>
</body>
</html>