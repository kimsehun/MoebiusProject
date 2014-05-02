
$(document).ready(function() {
	$('#btnCommentOk').click(function() {
		var user_id = '$(sessionScope.user_id)';
		var bcomment = $('#taComment').val();
		var bno = ${bno}
		var no = ${vo.no};
		
		$.ajax({
			url:'<c:url value="/comment/insert" />',
			type:'POST',
			data:{
				'user_id':user_id,
				'bcomment':bcomment,
				'bno': bno,
				'no':no
			},
			success:function(data) {
				alert(data + ':입력 성공');
				$('#taComment').val('');
			}
		});
	});
});