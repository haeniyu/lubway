
$(document).ready(function() {
	
	const USABLE_TMP = $("#usablePoint").text(); 	//보유포인트
	const USABLE_POINT = parseInt(USABLE_TMP);
	var priceTmp = $("#orderTotal").text();			//결제할 금액 = price(int)
	var priceTmp2 = priceTmp.replace(",","");		
	var price = parseInt(priceTmp2);				//연산이 진행되는 최종 결제 금액
	var savePrice = parseInt(priceTmp2);			//연산 전 총 금액 고정 값
	var discount = 0;								//쿠폰 적용 할인 금액
	var pointAmt = 0;								//포인트 할인 금액
	
	
	/* 쿠폰 사용 */	
	function coupon_func(){
		var percentageTmp = ($("#couponCode").val());
		if(percentageTmp.includes("사용가능")) percentageTmp="0";
		var percentage = parseInt(percentageTmp);
		
		discount = (percentage/100)*savePrice;	//할인 금액
		
		price = savePrice - discount - pointAmt;
		
		$("#totalPayAmtNavi").text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#couponAmtNavi").text(discount.toString());
		
	}//end of coupon_func()
	
	
	//포인트 모두 사용 눌렀을 경우
	$("#useAllPoint").on("click", function(){
		$("#pointAmt").val(USABLE_TMP);
		$("#pointAmtNavi").text(USABLE_TMP);
		$("#usablePoint").text("0");
		
		//최종 결제 금액 - 포인트 사용 금액
		pointAmt = USABLE_POINT;
		
		price = savePrice - discount - pointAmt;
		$("#totalPayAmtNavi").text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		
		
	});//end of 포인트 모두 사용
	
	//포인트 사용 메서드
	function point_func(){
		
		var pointTmp = $("#pointAmt").val();	//사용하고자 하는 포인트
		pointAmt = parseInt(pointTmp);
		if(pointTmp.length==0) {				//초기화
			pointAmt=0;
			price = savePrice - discount - pointAmt;
		}
		
		if(pointAmt>USABLE_POINT || pointAmt>price || pointAmt>savePrice){
			alert("사용 가능한 포인트를 초과하였습니다.");
			$("#pointAmt").val(USABLE_TMP);
			$("#pointAmtNavi").text(USABLE_TMP);
			$("#usablePoint").text("0");
			$("#pointAmt").focus();
			return;
		}
		$("#pointAmtNavi").text(pointAmt); 		//최종 결제 시 얼마가 쓰일지 표시해 줄 포인트
		
		//최종 결제 금액 - 포인트 사용 금액
		price = savePrice - discount - pointAmt;
		$("#totalPayAmtNavi").text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));	
		
		//보유 포인트 연산
		var usablePoint = USABLE_POINT;
		usablePoint-=pointAmt;
		$("#usablePoint").text(usablePoint.toString());
		
		//input에 값이 없으면 초기화
		if(pointTmp.length==0) {
			pointAmt=0;
			price = savePrice - discount - pointAmt;
		}
		
	}//end of point_func
	
	
	//포인트 사용
	$("#pointAmt").on("blur", point_func);
	
	//쿠폰 사용
	$("#couponCode").on("change", coupon_func);
	
	
});//end of document ready
