<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- ������ ���̺� ���̱� -->
<script type="text/javascript">
function viewTable() {
	document.getElementById("view").style.display="block";
}
</script>
</head>
<body>
<!-- ���弱�� -->
<form action ="place" method="post">
<select id="select" name="location_name">
	<option value="1" selected="selected">���� ������</option>
	<option value="2">������</option>
	<option value="3">���</option>	
	<option value="4">ȫ���Ա�</option>	
</select>
<input type="button" value="Ȯ��" onclick="viewTable()">
<!-- <input type="submit" value="Ȯ��" onclick="return viewTable()"> -->
</form>
<div id="view" style="display:none">
	<table border=1 cellpadding=0>
		<tr>
			<td colspan="2">
		<!-- ���̹� ���� -->
			<script type="text/javascript"
					src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=983caf927eed44efd87b9874510e036d"></script>
				<div id="testMap"
					style="border: 1px solid #000; width: 500px; height: 400px; margin: 20px;"></div>
				<script type="text/javascript">
					var oPoint = new nhn.api.map.LatLng(${location_addx}, ${location_addy});
					nhn.api.map.setDefaultPoint('LatLng');
					oMap = new nhn.api.map.Map('testMap', {
						point : oPoint,
						zoom : 10,
						enableWheelZoom : true,
						enableDragPan : true,
						enableDblClickZoom : false,
						mapMode : 0,
						activateTrafficMap : false,
						activateBicycleMap : false,
						minMaxLevel : [ 1, 14 ],
						size : new nhn.api.map.Size(500, 400)
					});
				</script>
				</td>
			</tr>
		<tr>
			<td>�����</td>
			<td>${vo.location_name}</td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td>${vo.location_addr}</td>
		</tr>
		<tr>
			<td>��ȭ��ȣ</td>
			<td>${vo.location_phone}</td>
		</tr>
	</table>
</div>
</body>
</html>