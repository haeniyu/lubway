function point_func(){
	var pointTmp = $("#pointAmt").val();	//사용하고자 하는 포인트
	var pointAmt = parseInt(pointTmp);
	console.log(pointTmp);
	
	var usableTmp = $("#text").text(); //보유포인트
	var usablePoint = parseInt(usableTmp);
	
	if(pointAmt>usablePoint){
		alert("사용 가능한 포인트를 초과하였습니다.");
		$("#pointAmt").focus();
		return;
	}	
	
	usablePoint -= pointAmt;
	$("#text").text(usablePoint.toString());
		
	$("#pointAmtNavi").text(pointAmt); 		//최종 결제 시 표시해 줄 포인트 
	
	var ttlTmp = $("#orderTotal").text();
	ttlTmp.replace(",","");
	var orderTotal = parseInt(ttlTmp);
	//orderTotal -= pointAmt;
	$("#pointAmtNavi").text(orderTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));	//최종 결제 금액 - 포인트 사용 금액
}


	
	

$(document).ready(function() {
	
	//포인트 모두 사용 눌렀을 경우
	$("#useAllPoint").on("click", function(){
		var point = $("#usablePoint").text();
		$("#pointAmt").val(point);
		$("#usablePoint").text("0");
		console.log(point);
	});
	
	//포인트 사용
	$("#pointAmt").on("keyup", point_func);
	
});//end of document ready