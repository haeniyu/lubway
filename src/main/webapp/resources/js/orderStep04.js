
$(document).ready(function() {
	const USABLE_TMP = $("#usablePoint").text(); 	//보유포인트
	const USABLE_POINT = parseInt(USABLE_TMP);
	var priceTmp = $("#orderTotal").text();			//결제할 금액 
	var priceTmp2 = priceTmp.replace(",","");		
	var price = parseInt(priceTmp2);				//연산이 진행되는 최종 결제 금액
	var savePrice = parseInt(priceTmp2);			//연산 전 총 금액 고정 값
	var discount = 0;								//쿠폰 적용 할인 금액
	var pointAmt = 0;								//포인트 할인 금액
	
	//홈웨이일 경우 배달비 증액 설정
	var homewayDeliveryFee = $("#whatWay").val();
	console.log(homewayDeliveryFee);
	if(homewayDeliveryFee== 'Home-Way'){
		price=price+3900;
		$("#totalPayAmtNavi").text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
	
	/* 쿠폰 사용 */	
	function coupon_func(){
		var data = $("#couponSelection").val();
		var arrTmp = data.split(",");
		var percentageTmp = arrTmp[0];
		var couponCode = arrTmp[1];
		console.log("percentageTmp : " + percentageTmp);
		console.log("couponCode : " + couponCode);
		if(percentageTmp.includes("사용가능")) percentageTmp="0";
		var percentage = parseInt(percentageTmp);
		
		discount = parseInt((percentage/100)*savePrice);	//할인 금액
		
		price = savePrice - discount - pointAmt;
		if(homewayDeliveryFee== 'Home-Way') price+=3900;
		
		$("#totalPayAmtNavi").text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#couponAmtNavi").text(discount.toString());
		$("#couponCode").val(couponCode);
		
	}//end of coupon_func()
	
	
	//포인트 모두 사용 눌렀을 경우
	$("#useAllPoint").on("click", function(){
		
		//잔여 결제금액 보다 보유 포인트 금액이 많을 경우
		if(USABLE_POINT > price) {
			$("#pointAmt").val(price.toString());
			$("#pointAmtNavi").text(price.toString());
			var point = USABLE_POINT - price;
			$("#usablePoint").text(point.toString());
			
			pointAmt = price;
			
		}else{
			$("#pointAmt").val(USABLE_TMP);
			$("#pointAmtNavi").text(USABLE_TMP);
			$("#usablePoint").text("0");
			
			pointAmt = USABLE_POINT;
			
		}

		
		//최종 결제 금액 - 포인트 사용 금액
		price = savePrice - discount - pointAmt;
		if(homewayDeliveryFee== 'Home-Way') price+=3900;
		
		$("#totalPayAmtNavi").text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		
		
	});//end of 포인트 모두 사용
	
	//포인트 사용 메서드
	function point_func(){
		
		var pointTmp = $("#pointAmt").val();	//사용하고자 하는 포인트
		
		//숫자 유효성 검사
		var regexp = /^[0-9]*$/;
		if(!regexp.test(pointTmp)){ 
			alert("숫자만 입력해 주세요.");
			pointAmt=0;
			$("#pointAmt").val("0");
			return;
		}
		
		pointAmt = parseInt(pointTmp);
		if(pointTmp.length==0) {				//초기화
			pointAmt=0;
			price = savePrice - discount - pointAmt;
			if(homewayDeliveryFee== 'Home-Way') price+=3900;
		}
		
		//입력한 포인트 금액에 대한 예외 처리
		if(pointAmt>USABLE_POINT || pointAmt>price || pointAmt>savePrice){
			alert("사용 가능한 포인트를 초과하였습니다.");
			
			if(USABLE_POINT > price){
				$("#pointAmt").val(price.toString());
				$("#pointAmtNavi").text(price.toString());
				var point = USABLE_POINT - price;
				$("#usablePoint").text(point.toString());
				$("#pointAmt").focus();
				return;
			} else {
				$("#pointAmt").val(USABLE_TMP);
				$("#pointAmtNavi").text(USABLE_TMP);
				$("#usablePoint").text("0");
				$("#pointAmt").focus();
				return;
			}
		}
		
		$("#pointAmtNavi").text(pointAmt); 		//최종 결제 시 얼마가 쓰일지 표시해 줄 포인트
		
		//최종 결제 금액 - 포인트 사용 금액
		price = savePrice - discount - pointAmt;
		if(homewayDeliveryFee== 'Home-Way') price+=3900;
		$("#totalPayAmtNavi").text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));	
		
		//보유 포인트 연산
		var usablePoint = USABLE_POINT;
		usablePoint-=pointAmt;
		$("#usablePoint").text(usablePoint.toString());
		
		//input에 값이 없으면 초기화
		if(pointTmp.length==0) {
			pointAmt=0;
			price = savePrice - discount - pointAmt;
			if(homewayDeliveryFee== 'Home-Way') price+=3900;
		}
		
	}//end of point_func
	
	
	//포인트 사용
	$("#pointAmt").on("blur", point_func);
	
	//쿠폰 사용
	$("#couponSelection").on("change", coupon_func);
	
	
});//end of document ready
