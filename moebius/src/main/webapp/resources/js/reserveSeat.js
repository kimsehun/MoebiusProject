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
			
	
		
		
		$('#send').click(function(){
			
			$.ajax({
				url:'../reserve/seat/'+seatName,
				type:'POST',
				data:{
					'user_id':user_id,
					'seatName':seatName
				},
				success:function(data) {
					if(movierLimit == 1){
						console.log(resultSeat);
						$('.resultSeat').unbind('click');						
					} else if(movierLimit == 2) {
						if(click == 2){
							console.log(resultSeat);
							$('.resultSeat').unbind('click');
						} 
					}
				}
			});
		});
	
	$('#btnReserveAction').bind('click',function(){
			//포인트 차감 후 userInfo로 이동
	});
	
});