/**
 * 		좌석 jQuery
 */

$(document).ready(function() {
	var movierLimit;
	var click;
	var resultSeat = new Array();
	
	$('#movierLimit').change(function(){
		for ( i = 0 ; i < movierLimit ; i ++ ) {
			$('#' + resultSeat[i]).removeClass('seatSelected');
		}
		resultSeat = new Array();
		movierLimit = $('#movierLimit').val();
		click = 0;
	});
				
		
	$('.resultSeat').bind('click',function(){
		var seatName = $(this).text();
		
		console.log('클릭 하자마자 : ' + click);
		for ( i = 0; i < movierLimit; i++) {
			if ( click != 0 && resultSeat[i] == seatName ) {
				console.log(seatName + '리턴');
				$(this).removeClass('seatSelected');
				click--;
				return;
			} 
		}
		
		if( click == movierLimit ) {
			return;
		}
		
		var user_id = '${sessionScope.user_id}';
		
		if ( movierLimit > click ) {
			$(this).addClass('seatSelected');
			resultSeat[click] = seatName;
			click++;
		}
		
		console.log('클릭 끝날때 : ' + click);
		
		console.log(resultSeat);
	});

	$('#btnReserveOk').click(function(){
		var user_id = $('#user_id').val();
		var location_no = $('#location_no').val();
		var schedule_no = $('#schedule_no').val();
		var screen_name = $('#screen_name').val();
		var screen_no = $('#screen_no').val();
		var seat_no = $('#seat_no').val();
		var movie_no = $('#movie_no').val();
		var pCount = $('#movierLimit').val();
		console.log(movie_no);
		$.ajax({
			url:'../reserve/seatA/'+resultSeat,
			type:'POST',
			data:{
				'user_id':user_id,
				'seatName':resultSeat,
				'location_no':location_no,
				'schedule_no':schedule_no,
				'screen_name':screen_name,
				'screen_no':screen_no,
				'seat_no':seat_no,
				'movie_no':movie_no,
				'pCount':pCount
			},
			success:function(data) {
				if(data.res == 1) {
					alert(data.msg);
					history.back();
				} 
				else {
					location.href="/moebius/user/userInfo";
				}
			}
		});
	});
	
	$('#btnReserveAction').bind('click',function(){
			//포인트 차감 후 userInfo로 이동
	});
	
});