<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기 > Step03</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- 
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min. js"></script>
 -->
<script src="${path}/resources/js/order.js"></script>
<script src="${path}/resources/js/orderStep03.js"></script>
<link rel="stylesheet" href="${path}/resources/css/modal.css" />
<link rel="stylesheet" href="${path}/resources/css/choice_option.css" />
<link rel="stylesheet" href="${path}/resources/css/menu.css?v=2">
<link rel="stylesheet" href="${path}/resources/css/ui.popup.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(window).load(function(){
    $(".loading").fadeOut();
});

//메뉴에 따른 선택 항목 노출 설정
var min = 1;
var max = 10;

function hideDiv() {
	var protocol = '${hideNum}';
	console.log("hideNum : " + protocol);
	switch(protocol){
	case "4" :
		console.log("4번입니다~");
		$("#breadSize").hide();
		$("#breadType").hide();
		break;
	case "3" :
		console.log("3번입니다~");
		$(".required").hide();
		$(".extra").hide();
		$("#strong").text("STEP 01");
		break;
	case "2" :
		console.log("2번입니다~");
		$(".list_wrapper").hide();
		break;
	case "1" :
		console.log("1번입니다~");
		$("#component_chart").hide();
		$(".list_wrapper").hide();
		$(".cal").hide();
		break;
	}
}

$(document).ready(function() {
	
	// fast/home 배경 구분
	var way = '${whatWay}';
	console.log("whatWay : " + way);
	
	if(way == 'Fast-Way'){
		$('.order').addClass('fast_sub');
		$('.order').removeClass('home_sub');
	} else if(way == 'Home-Way'){
		$('.order').addClass('home_sub');
		$('.order').removeClass('fast_sub');
	}
});

</script>
<script type="text/javascript">
var count = 0;
//장바구니 페이지로 이동
function gotoBasket() {
	var order_type = $("input:hidden[name=whatWay]").val();
	var check = true;
	
	$.ajax({
        url : '/checkNum.do',
        type : 'post',
        data : {
           whatWay : order_type
        },
        async : false,
        success : function(data) {
           console.log("ajax 통신 성공");
           console.log(data);
           if(data == 10){
        	   check = false;
        	   alert("장바구니에 담을수 있는 최대 수량은 10개 입니다.");
        	   $('.loading').hide();
           }
        },
        error : function(data) {
           alert("error");
        }
     });
	
	if(check == false){
		return;
	}
	
	if(count == 1) return;
	if($("#code").val().includes("SDW")){
		if(!checkSize || !checkBread || !checkCheese || !checkVegetable || !checkSauce){
			alert("필수 선택을 선택해주세요.");
			return;
		}	
	}
	
	if($("#code").val().includes("SLD")){
		if(!checkCheese || !checkVegetable || !checkSauce){
			alert("필수 선택을 선택해주세요.");
			return;
		}	
	}	
	
	if($("#code").val().includes("SLD")){
		if(!checkCheese || !checkVegetable || !checkSauce){
			alert("필수 선택을 선택해주세요.");
			return;
		}	
	}
	
	var totalPrice = $("#finalAmt").text();//총 가격
	$("#totalPrice").val(totalPrice);
	
	var step01Text = $("#selectStep01").text();//필수선택 텍스트
	var step02Text = $("#selectStep02").text();//추가선택 텍스트
	var step03Text = $("#selectStep03").text();//세트선택 텍스트
	$("#step01Text").val(step01Text);
	$("#step02Text").val(step02Text);
	$("#step03Text").val(step03Text);
	
	var selectVegetable = $("#selectVegetable").text();
	console.log(selectVegetable);
	$("#vegetableList").val(selectVegetable); 

	var selectSauce = $("#selectSauce").text();
	console.log(selectSauce);
	$("#sauceList").val(selectSauce); 
	
	var selectCheese = $("#selectCheese").text();
	console.log(selectCheese);
	$("#cheeseList").val(selectCheese);
	
	var quantity = $("#ordQty").val(); //수량
	$("#quantity").val(quantity);
	var eachCost = $("#eachPrice").val(); //빵 길이 추가 가격 포함
	$("#eachCost").val(eachCost);
	
	var toppingAdd = $("#toppingText").text();//토핑추가
	if(toppingAdd == "원하는 제품을 추가 선택해 주세요") toppingAdd = null;
	$("#toppingAdd").val(toppingAdd);
	
	var meatAdd = $("#meatText").text();//미트추가
	if(meatAdd == "미트 추가를 선택해 주세요") meatAdd = null;
	$("#meatAdd").val(meatAdd); 
	
	var cheeseAdd = $("#addCheeseText").text();//치즈추가
	if(cheeseAdd == "치즈 추가를 선택해 주세요") cheeseAdd = null;
	$("#cheeseAdd").val(cheeseAdd);
	
	if(count == 0){
		$("#orderForm").attr("action", "basket.do");
		
		var selectSauce = $("#selectSauce").text();
		console.log(selectSauce);
		$("#sauceList").val(selectSauce); 
		count++;
		$("#orderForm").submit();		
	}
}//end gotoBasket()

//주문하기 페이지로 이동
function gotoStep04() {
	if($("#code").val().includes("SDW")){
		if(!checkSize || !checkBread || !checkCheese || !checkVegetable || !checkSauce){
			alert("필수 선택을 선택해주세요.");
			return;
		}	
	}
	
	if($("#code").val().includes("SLD")){
		if(!checkCheese || !checkVegetable || !checkSauce){
			alert("필수 선택을 선택해주세요.");
			return;
		}	
	}
	count++;
	
	var totalPrice = $("#finalAmt").text();//총 가격
	$("#totalPrice").val(totalPrice);
	
	var step01Text = $("#selectStep01").text();//필수선택 텍스트
	var step02Text = $("#selectStep02").text();//추가선택 텍스트
	var step03Text = $("#selectStep03").text();//세트선택 텍스트
	$("#step01Text").val(step01Text);
	$("#step02Text").val(step02Text);
	$("#step03Text").val(step03Text);
	
	var quantity = $("#ordQty").val(); //수량
	$("#quantity").val(quantity);
	var eachCost = $("#eachPrice").val(); //빵 길이 추가 가격 포함
	$("#eachCost").val(eachCost);
	
	var toppingAdd = $("#toppingText").text();//토핑추가
	$("#toppingAdd").val(toppingAdd);
	
	var meatAdd = $("#meatText").text();//미트추가
	$("#meatAdd").val(meatAdd); 
	
	var cheeseAdd = $("#addCheeseText").text();//치즈추가
	$("#cheeseAdd").val(cheeseAdd);
	
	$("#orderForm").submit();
	
}

// 필수 선택 항목 선택 여부
var checkSize = false;
var checkBread = false;
var checkCheese = false;
var checkVegetable = false;
var checkSauce = false;

// ========= 필수 선택 항목 기능 처리 =========
	
// 사이즈 선택
function endSize() {
	var size = $("#lengthText").text();
	var object = $('<object id="selectSize">' + size + ', </object>')

	$("#selectSize").remove();
	$(object).prependTo("#selectStep01");
	
	checkSize = true;
	
	$("#closeLength").get(0).click();
}

// 빵 선택
function endBread() {
	if(!checkSize) {
		alert("사이즈를 선택해주세요.");
		$("#closeLength").get(0).click();
		return;
	}
	
	var bread = $("#breadText").text();
	if(bread == "빵을 선택해 주세요") {
		alert("빵은 필수 선택입니다.");
		return;
	}
	var object = $('<object id="selectBread">' + bread + ', </object>')

	$("#selectBread").remove();
	$(object).insertAfter("#selectSize");
	
	checkBread = true;
	
	$("#closeLength").get(0).click();
}

// 치즈 선택
function endCheese() {
	if(!checkBread) {
		alert("빵을 선택해주세요.");
		$("#closeLength").get(0).click();
		return;
	}
	
	var cheese = $("#cheeseText").text();
	if(cheese == "치즈를 선택해 주세요") {
		cheese = "치즈 제외";
	}
	var object = $('<object id="selectCheese">' + cheese + ', </object>')

	$("#selectCheese").remove();
	$(object).insertAfter("#selectBread");
	
	checkCheese = true;
	
	$("#closeLength").get(0).click();
}

// 야채 선택
function endVegetable() {
	if(!checkCheese) {
		alert("치즈를 선택해주세요.");
		$("#closeLength").get(0).click();
		return;
	}
	
	var vegetable = $("#vegeText").text();
	if(vegetable.split(",").length == 8) {
		vegetable = "야채 모두 선택";
	} else if(vegetable == "야채를 선택해 주세요.") {
		vegetable = "야채 제외";
	}
	var object = $('<object id="selectVegetable">' + vegetable + ', </object>')

	$("#selectVegetable").remove();
	$(object).insertAfter("#selectCheese");
	
	checkVegetable = true;
	
	$("#closeLength").get(0).click();
}

// 소스 선택
function endSauce() {
	if(!checkVegetable) {
		alert("야채를 선택해주세요.");
		$("#closeLength").get(0).click();
		return;
	}
	
	var sauce = $("#sauceText").text();
	if(sauce == "소스/시즈닝을 선택해 주세요.") {
		sauce = "소스 제외";
	}
	var object = $('<object id="selectSauce">' + sauce + '</object>')

	checkSauce = true;
	
	$("#selectSauce").remove();
	$(object).appendTo("#selectStep01");
	
	$("#closeLength").get(0).click();
}

// 샐러드 선택 항목 기능 처리
// 치즈 선택
function saladOnly() {
	var cheese = $("#cheeseText").text();
	if(cheese == "치즈를 선택해 주세요") {
		cheese = "치즈 제외";
	}
	var object = $('<object id="selectCheese">' + cheese + ', </object>')

	$("#selectCheese").remove();
	$(object).prependTo("#selectStep01");
	
	checkCheese = true;
	
	$("#closeLength").get(0).click();
}



// ========= 추가 선택 항목 기능 처리 =========
var toppingFlag = false;	//토핑 추가 했는지 확인
// 토핑 추가 선택
function endAddSelect() {
	toppingFlag = true;
	var topping = $("#toppingText").text();
	if(topping == "원하는 제품을 추가 선택해 주세요") {
		toppingFlag = false;
		$("#selectTopping").remove();
		$("#closeLength").get(0).click();
		return;
	}
	
	var object = $('<object id="selectTopping">' + topping + ', </object>')
	
	$("#selectTopping").remove();
	$(object).prependTo("#selectStep02");
	
	$("#closeLength").get(0).click();
}

// 미트 추가 선택
function endAddMeatSelect() {
	var meat = $("#meatText").text();
	if(meat == "미트 추가를 선택해 주세요") {
		$("#selectMeat").remove();
		$("#closeLength").get(0).click();
		return;
	}
	
	var object = $('<object id="selectMeat">' + meat + ', </object>')
	
	$("#selectMeat").remove();
	if(toppingFlag) $(object).insertAfter("#selectTopping");	//토핑추가 했으면 뒤에 붙이고
	else $(object).prependTo("#selectStep02");	//안했으면 처음에 넣어라
		
	$("#closeLength").get(0).click();
}

// 치즈 추가 선택
function endAddCheeseSelect() {
	var add_cheese = $("#addCheeseText").text();
	if(add_cheese == "치즈 추가를 선택해 주세요") {
		$("#selectAddCheese").remove();
		$("#closeLength").get(0).click();
		return;
	}
		
	var object = $('<object id="selectAddCheese">' + add_cheese + '</object>')
	
	$("#selectAddCheese").remove();
	$(object).appendTo("#selectStep02");
	
	$("#closeLength").get(0).click();
}


/******************STEP01********************/

$(document).ready(function() {

	hideDiv();
	
/******************수량 조절 , 결제 금액 ********************/
var qtyText = $("#ordQty").val();
var qty = parseInt(qtyText);
var ep = $("#eachPrice").val(); //현재메뉴 단품 가격
var cost = parseInt(ep);
var sum = cost; //추가되는 금액
var brdcost = 0; //빵 길이에 따른 가격 설정을 위한 변수. 기본15cm 기준 (무료)
var ttl = 0;	//토핑의 총 가격
var sumUntilStep1 = 0;

var sumUntilStep1 = ep;
console.log("step1 가격 (시작) :" + sumUntilStep1);
	
	//길이 선택 시 모든 사항이 초기화 되고 빵 가격이 적용된다.
	$("input:radio[name=length]").click(function(){
		
		clearAll();
		
		var length = document.getElementsByName('length');
		var lengthChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
		for(var i=0; i<length.length; i++) {
		    if(length[i].checked) {
		    	lengthChoice = length[i].value;
		    }

			if(lengthChoice == "30cm"){
				var brd = document.getElementById('price30').value;
				brdcost = parseInt(brd);
			}else{
				brdcost = 0;
			}
			sum = cost + brdcost;		//15cm기준 가격 + 빵길이 추가가격		
			sumUntilStep1 = sum;		// Step1 필수선택까지의 가격 정보 저장
			sumUntilStep2 = sumUntilStep1;
			$("#eachPrice").val(sumUntilStep1);
			
			var num2 = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#finalAmt").text(num2);
		}
		console.log(lengthChoice);
		$("#lengthText").text(lengthChoice);
	});
	
	
	//빵 선택에 따라 breadText 값이 바뀌게 한다
	$("input:radio[name=bread]").click(function(){
		var bread = document.getElementsByName('bread');
		var breadChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
		for(var i=0; i<bread.length; i++) {
		    if(bread[i].checked) {
		    	breadChoice = bread[i].value;
		    }
		}
		$("#breadText").text(breadChoice);
	});
	
	//치즈 선택에 따라 cheeseText 값이 바뀌게 한다
	$("input:radio[name=cheese]").click(function(){
		var cheese = document.getElementsByName('cheese');
		var cheeseChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
		for(var i=0; i<cheese.length; i++) {
		    if(cheese[i].checked) {
		    	cheeseChoice = cheese[i].value;
		    }
		}
		$("#cheeseText").text(cheeseChoice);
	});
	
	//야채선택
	var vegeArr = new Array();
	$("input:checkbox[name=vegetable]").click(function() {
		var selectTarget = $("[name=vegetable]:checked");

		if($(this).is(":checked") == true) {
			vegeArr.push($(this).val());
		} else {
			for(var i=0; i<vegeArr.length; i++) {
				if($(this).val() == vegeArr[i]) vegeArr.splice(i, 1);
			}
		}
		console.log(vegeArr);
		// 선택 토핑
		$('#vegeText').text(vegeArr.length > 0 ? vegeArr.join(", ") : "야채를 선택해 주세요.");
	});
	
	//소스 선택
	var itemArr = new Array();
	$("input:checkbox[name=sauce]").click(function() {
		var selectTarget = $("[name=sauce]:checked");

		console.log("선택 소스 개수 : " + selectTarget.length);
		
		// 소스 선택갯수 벨리데이션
		if(selectTarget.length > 3) {
			alert("소스/시즈닝은 3개까지 선택가능합니다.");
			$(this).prop("checked", false);
			return;
		}
		
		if($(this).is(":checked") == true) {
			itemArr.push($(this).val());
		} else {
			for(var i=0; i<itemArr.length; i++) {
				if($(this).val() == itemArr[i]) itemArr.splice(i, 1);
			}
		}
		
		console.log(itemArr);
					
		// 선택 토핑
		$('#sauceText').text(itemArr.length > 0 ? itemArr.join(", ") : "소스/시즈닝을 선택해 주세요.");
	});
	
	
/******************STEP02********************/
	
	//토핑 추가 선택
  	var arr = new Array();		//선택된 토핑을 담을 배열
	var sumUntilStep2 = sumUntilStep1;	//스텝2까지의 가격 저장***
	console.log("step2 가격 :" + sumUntilStep2);
  
	$("input:checkbox[name=topping]").click(function(){
     var temp = $(this).val();
     var tempArr = temp.split(",");
     var topcost = parseInt(tempArr[1]);
     
     if($(this).is(":checked") == true) {//체크 시
        arr.push(tempArr[0]);
        ttl += topcost;
		sum += topcost;
     } else {//체크 해제 시
        for(var i=0; i<arr.length; i++) {
           if(tempArr[0] == arr[i]) {
				arr.splice(i, 1);
				ttl -= topcost;
				sum -= topcost;
			}
        }
     }
     
     $('#toppingText').text(arr.length > 0 ? arr.join(", ") : "원하는 제품을 추가 선택해 주세요");
     $('#sum').text("+ " + ttl + "원");

     var result = sum * qty;
     
	var finalcost = result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$("#finalAmt").text(finalcost);
     
	sumUntilStep2 = sum;
  }); //end of topping

  
	//미트 추가
  $("input:checkbox[name=meat]").click(function(){
     var temp = $(this).val();
     var tempArr = temp.split(",");
     var metcost = parseInt(tempArr[1]);

		var selectTarget = $("[name=meat]:checked");
		// 미트추가 선택갯수 벨리데이션
		if(selectTarget.length > 1) {
			alert("미트 추가는 1개만 선택가능합니다.");
			$("input:checkbox[name=meat]").attr("checked", false);
			return;
		}
     
     if($(this).is(":checked") == true) {//체크 시
		sum += metcost;
		$('#meatText').text(tempArr[0]);
    	 $('#sum2').text("+ " + metcost + "원");
     } else {//체크 해제 시
		sum -= metcost;
		
		$('#meatText').text("미트 추가를 선택해 주세요");
    	 $('#sum2').text("+ " + 0 + "원");
     }
     
     var result = sum * qty;
     
	var finalcost = result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$("#finalAmt").text(finalcost);
	
	sumUntilStep2 = sum;
	console.log("미트 추가 sumUntilStep2 : " , sumUntilStep2);
  	}); //end of meat
  

	//치즈 추가
  $("input:checkbox[name=add_cheese]").click(function(){
	if(!checkCheese) {
		alert("치즈를 선택해주세요.");
		$("#closeLength").get(0).click();
		return;
	}
     var temp = $(this).val();
     var tempArr = temp.split(",");
     var cost = parseInt(tempArr[1]);

	var selectTarget = $("[name=add_cheese]:checked");
		// 치즈 추가 선택갯수 벨리데이션
		if(selectTarget.length > 1) {
			alert("치즈 추가는 1개만 선택가능합니다.");
			$("input:checkbox[name=add_cheese]").prop("checked", false);
			return;
		}
     
     if($(this).is(":checked") == true) {//체크 시
		sum += cost;
		$('#addCheeseText').text(tempArr[0]);
    	 $('#sum3').text("+ " + cost + "원");
     } else {//체크 해제 시
		sum -= cost;
		
		$('#addCheeseText').text("치즈 추가를 선택해 주세요");
    	$('#sum3').text("+ " + 0 + "원");
     }
     
    var result = sum * qty;
     
	var finalcost = result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$("#finalAmt").text(finalcost);
 
	sumUntilStep2 = sum;
	console.log("치즈 추가 sumUntilStep2 : " , sumUntilStep2);
	}); //end of add_cheese

  
/******************STEP03********************/
	$(".wedge").hide();
	var setcost = 0; //세트 추가 가격
	var checkset = 0; // 0 - 체크안함, 1 - 쿠키세트, 2 - 웨지세트
	var drinkCost = 0;	//16oz 기준 기본 음료 코스트 (무료)
	$("input:radio[name=select_set]").click(function(){
		
		sum = sumUntilStep2; //스텝2까지의 가격으로 초기화
		var temp = $(this).val();
     	var tempArr = temp.split(",");
     	var cost = parseInt(tempArr[1]);

		if(tempArr[0] == "cookie") { //쿠키 세트 선택
			if(setcost > 0){
				sum -= setcost;
				setcost = 0;
			}
			
			if(checkset > 0){
				checkset = 0;
				$("input:radio[name='drink']").removeAttr("checked");
				$("input:radio[name='wedge']").removeAttr("checked");
			}
			
			$(".cookie").show();
			$(".wedge").hide();
			
			$('#setText').text("");
			var object = $('<object id="subselect">쿠키 세트, </object>');
			$("#subselect").remove();
			$(object).prependTo("#setText");
			
			$('#sum4').text("+ " + cost + "원");
			
			//쿠키 선택에 따라 setText 값이 추가되게 한다
			$("input:radio[name=cookie]").click(function() {
				var cookie = document.getElementsByName('cookie');
				var cookieChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
				console.log(cookieChoice);
				for(var i=0; i<cookie.length; i++) {
					   if(cookie[i].checked) {
					   	cookieChoice = cookie[i].value;
					   }
				}
				
				var object2 = $('<object id="selection">' + cookieChoice + ', </object>');
				$("#selection").remove();
				$(object2).insertAfter("#subselect");
				checkset = 1;
			});
			
			setcost = cost;
			
		} else { //웨지 세트 선택
			if(setcost > 0){
				sum -= setcost;
				setcost = 0;
			}
			
			if(checkset > 0){
				checkset = 0;
				$("input:radio[name='drink']").removeAttr("checked");
				$("input:radio[name='cookie']").removeAttr("checked");
			}
			
			$(".wedge").show();
			$(".cookie").hide();
			
			$('#setText').text("");
			var object = $('<object id="subselect">웨지/스프 세트, </object>');
			$("#subselect").remove();
			$(object).prependTo("#setText");
			
			$('#sum4').text("+ " + cost + "원");
			
			//웨지/스프 선택에 따라 setText 값이 추가되게 한다
			$("input:radio[name=wedge]").click(function(){
				var wedge = document.getElementsByName('wedge');
				var wedgeChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
				console.log(wedgeChoice);
				for(var i=0; i<wedge.length; i++) {
					   if(wedge[i].checked) {
					   	wedgeChoice = wedge[i].value;
					   }
				}
				
				var object2 = $('<object id="selection">' + wedgeChoice + ', </object>');
				$("#selection").remove();
				$(object2).insertAfter("#subselect");
				checkset = 2;
			});
			
			setcost = cost;
		}//end of else
	
	
		//다 끝나고 음료 선택!!!
		$("input:radio[name=drink]").click(function(){
			var drink = document.getElementsByName('drink');
			var drinkChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
			drinkCost = 0; //클릭할 때마다 우선 음료값 기본으로 초기화 (전역변수로 선언해 둠)
			
			if(checkset != 0) {
				for(var i=0; i<drink.length; i++) {
					if(drink[i].checked) {
				   	drinkChoice = drink[i].value;
					console.log(drinkChoice);
						if(drinkChoice == "탄산음료 22oz"){
							 drinkCost = 200;
						}
					
					}//end of if
				}// end of for
				setcost = cost+drinkCost;
				
				var objectend = $('<object id="selectdrink">' + drinkChoice + '</object>');
				$("#selectdrink").remove();
				$(objectend).appendTo("#setText");
				
				$('#sum4').text("+ " + setcost + "원");
			} else {
				alert("쿠키 또는 웨지/스프를 선택해주세요.");
				 $(this).prop('checked', false);
			}
		});
				
		//세트 선택 버튼 클릭 시	
		$(".choice_set_btn").click(function(){
			sum = Number(sumUntilStep2);
			sum += setcost;
			$("#setAdd").val(setcost);
			
			var object = $('<object id="showSet">' + $("#setText").text() + '</object>');
			$("#showSet").remove();
			$(object).prependTo("#selectStep03");
			num2 = sum * qty;
			var num2 = num2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#finalAmt").text(num2);
				
			$("#closeLength").get(0).click();
			
		});
		
	});// end of radio[name=select_set] 세트 선택******
	
	
//단품 선택
$("#select_one").click(function(){
	sum = sumUntilStep2; //스텝2까지의 가격으로 초기화
	console.log("현재 수량");
	num2 = sum * qty;
	var num2 = num2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$("#finalAmt").text(num2);
	
	$("#showSet").remove();
	
	$("#closeLength").get(0).click();
});// end of 단품 선택



//수량 조절
$("#qtyAdd").click(function() {
	if(qty == 11) {
		qty -= 2;
	}
	qty++;
	var num = qty.toString();
	$("#ordQty").val(num);
	if(num>max){
		num -= 1;
		alert("최대 10개까지만 됩니다.")
		$("#ordQty").val(num);
		return;
	}
	var showprice = 0;
	showprice = sum * qty;
	var num2 = showprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$("#finalAmt").text(num2);
});//end of 수량더하기

$("#qtySub").click(function() {
	if(qty > 1){
		qty--;
		console.log(qty);
		var num = qty.toString();
		$("#ordQty").val(num);
		
		
		
		var showprice = 0;
		showprice = sum * qty;
		
		console.log(sum);
		
		var num2 = showprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#finalAmt").text(num2);
	}
});//end of 수량빼기

//모든 것을 처음 상태로 되돌리는 메서드
function clearAll(){
	cost = parseInt(ep);
	sum = cost; 
	ttl = 0;
	drinkCost = 0;
	setcost = 0;
	
	$("#toppingText").text("원하는 제품을 추가 선택해 주세요");
	$("#sum").text("+ 0원");
	$("#meatText").text("미트 추가를 선택해 주세요");
	$("#sum2").text("+ 0원");
	$("#addCheeseText").text("치즈 추가를 선택해 주세요");
	$("#sum3").text("+ 0원");
	$("#setText").text("");
	$("#sum4").text("+ 0원");
	$("#ordQty").val("1");
	
	$("input:checkbox[name=topping]").prop("checked", false);
	$("input:checkbox[name=meat]").prop("checked", false);
	$("input:checkbox[name=add_cheese]").prop("checked", false);
	$("#selectStep02").text("");
	
	$("input:radio[name=select_set]").removeAttr("checked");
	$("input:radio[name=cookie]").removeAttr("checked");
	$("input:radio[name=wedge]").removeAttr("checked");
	$("input:radio[name=drink]").removeAttr("checked");
	
}

});//end of document.ready
</script>
<!-- 
<script src="${path}/resources/js/orderStep03.js"></script>
 -->
 <style type="text/css">
.loading{
	width: 100%;
	height: 100%;
	position: fixed;
	z-index: 1000;
	background-image : url("https://lubway.s3.ap-northeast-2.amazonaws.com/KakaoTalk_20210405_101739419.gif");
	background-repeat: no-repeat;
	background-position: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
<div class="loading"></div>
	<div id="content" class="order" style="padding-top: 175px">
		<div class="order_title">
			<c:if test="${whatWay eq 'Fast-Way' }">
				<h3>Fast-Way</h3>
				<p>온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</p>
			</c:if>
			<c:if test="${whatWay eq 'Home-Way' }">
				<h3>Home-Way</h3>
				<p>온라인 주문 시 배달되는 서비스입니다.</p>
			</c:if>
		</div>
		<!-- 메뉴소개 s -->
		<div class="menu_view_wrapper" style="padding-left: 180px; padding-top:0px;">
			<!-- 메뉴 content -->
			<div class="menu_content"
				style="width: 85%; background-color: white;">
				<!-- 메뉴 header -->
				<div class="hd">
					<div class="category"></div>
					<h2 class="title_name">${menu.name }</h2>
					<p class="eng">${menu.engname }</p>
					<p class="cal">${nutrient.cal }Kcal</p>
				</div>
				<!--// 메뉴 header -->

				<!-- 메뉴정보 -->
				<div class="menu_info">
					<div class="menu_img">
						<img src="${menu.filePath }" />
					</div>
					<p class="summary">${menu.content }</p>
				</div>
				<!--// 메뉴정보 -->

				<!-- 영양성분표 -->
				<div class="component_chart" id="component_chart" style="background-color:white">
					<div class="content" style="width: 85%;">
						<h3>영양성분표</h3>
						<!-- 로스트 치킨 베이컨 -->
						<div class="board_list_wrapper">
							<table>
								<thead>
									<TR>
										<th scope="col">중량(g)</th>
										<th scope="col">열량(kcal)</th>
										<th scope="col">당류(g)</th>
										<th scope="col">단백질(g)</th>
										<th scope="col">포화지방(g)</th>
										<th scope="col">나트륨(mg)</th>

									</TR>
								</thead>
								<tbody>
									<TR>
										<td>${nutrient.ttl }</td>
										<td>${nutrient.cal }</td>
										<td>${nutrient.sug }</td>
										<td>${nutrient.pro}</td>
										<td>${nutrient.fat}</td>
										<td>${nutrient.sod}</td>

									</TR>
								</tbody>
							</table>
						</div>
						<ul class="notice">
							<li>※ 기본야채 5종(양상추, 토마토, 양파, 피망, 오이) 및 제품에 따른 미트류 포함, 치즈 및 소스
								제외, 15cm 위트 브레드 기준</li>
							<li>※ 괄호 안 %는 1일 영양소 기준치에 대한 비율</li>
						</ul>

						<div class="btns_wrapper">
							<a id="popup" class="btn bgc_black size1" style="width: 110px;"
								href="#popup_wrap" rel="modal:open"> <span>원산지 정보</span>
							</a>
						</div>
					</div>
				</div>

				<!-- 상세 선택 메뉴 -->
				<div class="list_wrapper" style="background-color:white">
					<div class="content">
						<div class="choice_option">
							<div class="step01 required">
								<div class="th_name_step01">
									<strong>STEP 01</strong>&nbsp;&nbsp;필수 선택 *
								</div>
								<div id="length" class="modal">
									<div class="option_display">
										<dl>
											<dt>빵 길이 선택</dt>
											<dd id="lengthText"></dd>
										</dl>
									</div>
									<div class="popup_content length">
										<ul>
											<li><label class="form_circle" for="15cm"> <input
													name="length" type="radio" id="15cm"
													value="15cm"> <span class="icon"></span> <em>15cm</em>
											</label></li>
											<li><label class="form_circle" for="30cm">
											<c:if test="${hideNum eq 5 }">
												<input type="hidden" value="${menu.price30 }" id="price30">
											</c:if>
											<input name="length" type="radio" id="30cm" value="30cm">
											<span class="icon"></span> <em>30cm</em>
											</label></li>
											<label style="color:#FF8300">빵 길이 선택 변경시 모든 추가 선택이 초기화 됩니다.</label>
										</ul>
										<input class="choice_btn" type="button" value="선택"
											onclick="endSize();">
									</div>
								</div>
								<div class="wrap_pop" id="breadSize">
									<a class="pop" href="#length" rel="modal:open">길이 선택</a>
								</div>

								<div id="bread" class="modal">
									<div class="option_display">
										<dl>
											<dt>빵 선택</dt>
											<dd id="breadText">빵을 선택해 주세요</dd>
										</dl>
									</div>
									<div class="popup_content bread">
										<ul>
											<c:forEach items="${breadList}" var="bread">
												<li><label class="form_circle"> <input
														name="bread" type="radio" value="${bread.name }">
														<span class="icon"></span> <em>${bread.name }</em>
												</label></li>
											</c:forEach>
										</ul>
										<input class="choice_btn" type="button" value="선택"
											onclick="endBread();">
									</div>
								</div>
								<div class="wrap_pop" id="breadType">
									<a class="pop" href="#bread" rel="modal:open">빵 선택</a>
								</div>

								<div id="cheese" class="modal">
									<div class="option_display">
										<dl>
											<dt>치즈 선택</dt>
											<dd id="cheeseText">치즈를 선택해 주세요</dd>
										</dl>
									</div>
									<div class="popup_content cheese">
										<ul>
											<c:forEach items="${cheeseList }" var="cheese">
												<li><label class="form_circle"> <input
														name="cheese" type="radio" value="${cheese.name }">
														<span class="icon"></span> <em>${cheese.name }</em>
												</label></li>
											</c:forEach>
										</ul>
										<c:if test="${hideNum eq 4 }">
											<input class="choice_btn" type="button" value="선택"
												onclick="saladOnly();">
										</c:if>
										<c:if test="${hideNum ne 4 }">
											<input class="choice_btn" type="button" value="선택"
												onclick="endCheese();">
										</c:if>
									</div>
								</div>
								<div class="wrap_pop">
									<a class="pop" href="#cheese" rel="modal:open">치즈 선택</a>
								</div>

								<div id="vegetable" class="modal">
									<div class="option_display">
										<dl>
											<dt>야채 선택 (다중 선택)</dt>
											<dd id="vegeText">야채를 선택해 주세요.</dd>
										</dl>
									</div>
									<div class="popup_content vegetable">
										<ul>
											<c:forEach items="${vegeList }" var="vege">
												<li><label class="form_circle"> <input
														name="vegetable" type="checkbox" value="${vege.name }">
														<span class="icon"></span> <em>${vege.name }</em>
												</label></li>
											</c:forEach>
											<li><label class="form_circle"> <input
														name="vegetable" type="checkbox" value="야채 모두 선택" onclick='selectAll(this)'>
														<span class="icon"></span> <em>야채 모두 선택</em>
												</label></li>
										</ul>
										<input class="choice_btn" type="button" value="선택"
											onclick="endVegetable();">
									</div>
								</div>
								<div class="wrap_pop">
									<a class="pop" href="#vegetable" rel="modal:open">야채 선택</a>
								</div>

								<div id="sauce" class="modal">
									<div class="option_display">
										<dl>
											<dt>소스/시즈닝 선택</dt>
											<dd id="sauceText">소스/시즈닝을 선택해 주세요.</dd>
										</dl>
									</div>
									<div class="popup_content sauce">
										<ul>
											<c:forEach items="${sauceList }" var="sauce">
												<li><label class="form_circle"> <input
														name="sauce" type="checkbox" value="${sauce.name }">
														<span class="icon"></span> <strong>${sauce.sub }</strong><em>${sauce.name }</em>
												</label></li>
											</c:forEach>
										</ul>
										<input class="choice_btn" type="button" value="선택"
											onclick="endSauce();">
									</div>
								</div>
								<div class="wrap_pop">
									<a class="pop" href="#sauce" rel="modal:open">소스/시즈닝 선택</a>
								</div>
								<p id="selectStep01"></p>
							</div>
							<!-- end of step01 -->

							<!----------------------------------- 02 추가선택 영역 ----------------------------------------->
							<div class="step01 extra">
								<div class="th_name_step02">
									<strong>STEP 02</strong>&nbsp;&nbsp;추가 선택
								</div>
								<div id="topping" class="modal">
									<div class="option_display">
										<dl>
											<dt>추가 선택 (다중 선택 가능)</dt>
											<dd id="toppingText">원하는 제품을 추가 선택해 주세요</dd>
											<dd>
												<span id="sum">+ 0원</span>
											</dd>
										</dl>
									</div>
									<div class="popup_content topping">
										<ul>
											<c:forEach items="${toppingList }" var="topping">
												<li><label class="form_circle"> <input
														name="topping" type="checkbox"
														value="${topping.name }, ${topping.topping_price}"> <span
														class="icon"></span><em>${topping.name }</em> <span>+<em><fmt:formatNumber
																	value="${topping.topping_price }" pattern="#,###" /></em>&nbsp;원
													</span>
												</label></li>
											</c:forEach>
										</ul>
										<input class="choice_btn" type="button" value="선택"
											onclick="endAddSelect();">
									</div>
								</div>
								<div class="wrap_pop">
									<a class="pop" href="#topping" rel="modal:open">추가 선택</a>
								</div>

								<div id="meat" class="modal">
									<div class="option_display">
										<dl>
											<dt>미트 추가</dt>
											<dd id="meatText">미트 추가를 선택해 주세요</dd>
											<dd>
												<span id="sum2">+ 0원</span>
											</dd>
										</dl>
									</div>
									<div class="popup_content meat">
										<ul>
											<c:forEach items="${meatList }" var="meat">
												<li><label class="form_circle"> <input
														name="meat" type="checkbox"
														value="${meat.name }, ${meat.meat_price}"> <span
														class="icon"></span><em>${meat.name }</em> <span>+<em><fmt:formatNumber
																	value="${meat.meat_price }" pattern="#,###" /></em>&nbsp;원
													</span>
												</label></li>
											</c:forEach>
										</ul>
										<input class="choice_btn" type="button" value="선택"
											onclick="endAddMeatSelect();">
									</div>
								</div>
								<div class="wrap_pop">
									<a class="pop" href="#meat" rel="modal:open">미트 추가</a>
								</div>

								<div id="add_cheese" class="modal">
									<div class="option_display">
										<dl>
											<dt>치즈 추가</dt>
											<dd id="addCheeseText">치즈 추가를 선택해 주세요</dd>
											<dd>
												<span id="sum3">+ 0원</span>
											</dd>
										</dl>
									</div>
									<div class="popup_content add_cheese">
										<ul>
											<c:forEach items="${cheeseList }" var="chee">
												<li><label class="form_circle">
												<input name="add_cheese" type="checkbox" value="${chee.name }, ${chee.cheese_price}">
												<span class="icon"> </span>
												<em>${chee.name }</em>
												<span>+<em><fmt:formatNumber value="${chee.cheese_price }" pattern="#,###" /></em>&nbsp;원
													</span>
												</label></li>
											</c:forEach>
										</ul>
										<input class="choice_btn" type="button" value="선택"
											onclick="endAddCheeseSelect();">
									</div>
								</div>
								<div class="wrap_pop">
									<a class="pop" href="#add_cheese" rel="modal:open">치즈 추가</a>
								</div>
								<p id="selectStep02"></p>
							</div>
							<!-- end of step02 -->

							<!----------------------------------- 03 세트선택 영역 ----------------------------------------->
							<div class="step01">
								<div class="th_name_step03">
									<strong id="strong">STEP 03</strong>&nbsp;&nbsp;상품 선택
								</div>
								<div id="select_one" class="modal">
									<div class="one">
										<label>단품을 선택하셨습니다.</label>
									</div>
								</div>
								<div class="wrap_pop">
									<a class="pop" href="#select_one" rel="modal:open">단품</a>
								</div>

								<div id="select_set" class="modal">
									<div class="option_display">
										<dl>
											<dt>세트 선택</dt>
											<dd id="setText"></dd>
											<dd>
												<span id="sum4">+ 0원</span>
											</dd>
										</dl>
									</div>
									<div class="popup_content set_menu">
										<ul>
											<li><label class="form_circle"> <input
													name="select_set" type="radio"
													value="cookie, 1900"> <span class="icon"></span>
												<em>쿠키 세트</em><span> +<em><fmt:formatNumber value="1900" pattern="#,###" /></em>&nbsp;원
													</span>
											</label></li>
											<li><label class="form_circle"> <input
													name="select_set" type="radio" value="wedge, 2400"> <span
													class="icon"></span> <em>웨지/스프 세트</em><span> +<em><fmt:formatNumber value="2400" pattern="#,###" /></em>&nbsp;원
													</span>
											</label></li>
										</ul>
									</div>
									<div class="popup_content cookie">
										<ul>
											<c:forEach items="${cookieList }" var="coo">
												<li><label class="form_circle"> <input
														name="cookie" type="radio" value="${coo.name }"> <span
														class="icon"></span> <em>${coo.name }</em>
												</label></li>
											</c:forEach>
										</ul>
									</div>
									<div class="popup_content wedge">
										<ul>
											<c:forEach items="${wedgeList }" var="wedge">
												<li><label class="form_circle"> <input
														name="wedge" type="radio" value="${wedge.name }">
														<span class="icon"></span> <em>${wedge.name }</em>
												</label></li>
											</c:forEach>
										</ul>
									</div>
									<div class="popup_content drink">
										<ul>
											<li><label class="form_circle"> <input
													name="drink" type="radio"
													value="탄산음료 16oz"> <span class="icon"></span> <em>탄산음료
														16oz</em>
											</label></li>
											<li><label class="form_circle"> <input
													name="drink" type="radio" value="탄산음료 22oz"> <span
													class="icon"></span> <em>탄산음료 22oz</em><span> +<em><fmt:formatNumber value="200" pattern="#,###" /></em>&nbsp;원
													</span>
											</label></li>
										</ul>
										<input class="choice_set_btn" type="button" value="선택">
									</div>
								</div>
								<div class="wrap_pop">
									<a class="pop" href="#select_set" rel="modal:open">세트</a>
								</div>
								<p id="selectStep03"></p>
							</div>
							<!-- end of step03 -->
							
							
						</div>
					</div>
				</div>
				<!-- 수량 및 결제 금액  -->
				<div class="menu_total" style="background-color:white">
					<dl class="count">
						<dt>수량</dt>
						<dd>
							<a class="minus" href="javascript:;" id="qtySub">수량 빼기</a>
							<input id="ordQty" onfocus="this.blur();" type="text" value="1" />
							<a class="plus" href="javascript:;" id="qtyAdd">수량 더하기</a>
						</dd>
					</dl>
					<dl class="total_won">
						<dt>최종 결제 금액</dt>
						<dd>
							<input id="eachPrice" type="hidden" value="${menu.price }" />
							<strong id="finalAmt"> <fmt:formatNumber value="${menu.price }" pattern="#,###" /> </strong>
							<span>원</span>
						</dd>
					</dl>
				</div>
			</div>
			<!--// 메뉴 content -->
			<!-- 목록보기 -->
			<div style="width: 85%; background-color:white">
				<div class="order_btn">
					<a class="car" href="javascript:;" onclick="gotoBasket();">장바구니</a>
					<a class="bill" href="javascript:;" onclick="gotoStep04();">주문하기</a>
				</div>
			</div>
			<div class="btns_list_wrapper" style="width: 85%; background-color:white;">
				<div class="btn_list">
					<a href="#" onclick="history.go(-1); return false;">목록보기</a>
				</div>
			</div>
		</div>
		<!--// 메뉴소개 e -->
	</div>

	<!-- 원산지 표시 Modal -->
	<div id="popup_wrap" style="display: none;">
		<h1 class="title">원산지정보</h1>
		<div class="popup_content"
			style="overflow-y: auto; overflow-x: hidden; height: 630px;">
			<div class="country_origin_wrapper">
				<div>
					<div id="mCSB_1" tabindex="0" style="max-height: none;">
						<div id="mCSB_1_container" class="mCSB_container"
							style="position: relative; top: 0px; left: 0px;" dir="ltr">
							<ul>
								<li>
									<div class="icon">
										<img alt="쇠고기"
											src="https://lubway.s3.ap-northeast-2.amazonaws.com/icon_country_origin01.png"
											class="mCS_img_loaded"> <span>쇠고기</span>
									</div>
									<div class="info">
										<dl>
											<dt>로스트 비프, 미트볼</dt>
											<dd>: 호주산</dd>
											<dt>스테이크</dt>
											<dd>: 미국산</dd>
										</dl>
									</div>
								</li>
								<li>
									<div class="icon">
										<img alt="돼지고기"
											src="https://lubway.s3.ap-northeast-2.amazonaws.com/icon_country_origin02.png"
											class="mCS_img_loaded"> <span>돼지고기</span>
									</div>
									<div class="info">
										<dl>
											<dt>베이컨, 살라미, 페퍼로니, 풀드 포크 바비큐</dt>
											<dd>: 미국산</dd>
											<dt>베이컨 비츠</dt>
											<dd>: 미국산</dd>
											<dt>햄</dt>
											<dd>: 국내산 돈육,수입후지(네덜란드)</dd>
										</dl>
									</div>
								</li>
								<li>
									<div class="icon">
										<img alt="닭고기"
											src="https://lubway.s3.ap-northeast-2.amazonaws.com/icon_country_origin03.png"
											class="mCS_img_loaded"> <span>닭고기</span>
									</div>
									<div class="info">
										<dl>
											<dt>치킨 브레스트, 치킨 스트립, 로티세리 바비큐 치킨</dt>
											<dd>: 미국산</dd>
										</dl>
									</div>
								</li>
								<li>
									<div class="icon">
										<img alt="칠면조고기"
											src="https://lubway.s3.ap-northeast-2.amazonaws.com/icon_country_origin04.png"
											class="mCS_img_loaded"> <span>칠면조고기</span>
									</div>
									<div class="info">
										<dl>
											<dt>터키 브레스트</dt>
											<dd>: 터키가슴살(칠레,미국)</dd>
										</dl>
									</div>
								</li>
								<li>
									<div class="icon">
										<img alt="참치"
											src="https://lubway.s3.ap-northeast-2.amazonaws.com/icon_country_origin06.png"
											class="mCS_img_loaded"> <span>참치</span>
									</div>
									<div class="info">
										<dl>
											<dt>참치</dt>
											<dd>: 태국산</dd>
										</dl>
									</div>
								</li>
							</ul>
						</div>
						<div style="display: block;">
							<div class="mCSB_draggerContainer">
								<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
									style="position: absolute; min-height: 30px; height: 429px; top: 0px; display: block; max-height: 536px;">
									<div class="mCSB_dragger_bar" style="line-height: 30px;">
									</div>
								</div>
								<div class="mCSB_draggerRail"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<a id="closeLength" rel="modal:close"></a>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
<!-- 주문 확인 결제 페이지 이동 -->
<form action="orderStep04.do" method="post" id="orderForm" style="display: none;">
	<input type="hidden" id="code" name="code" value="${code}">
	<input type="hidden" name="whatWay" value="${whatWay}">
	<input type="hidden" id="franchiseNo" name="franchiseNo" value="${franchiseNo}">
	<input type="hidden" id="totalPrice" name="totalPrice" value="">
	<input type="hidden" id="step01Text" name="step01Text" value="">
	<input type="hidden" id="step02Text" name="step02Text" value="">
	<input type="hidden" id="step03Text" name="step03Text" value="">
	<input type="hidden" id="cheeseList" name="basicCheese" value="">
	<input type="hidden" id="vegetableList" name="vegetable" value="">
	<input type="hidden" id="sauceList" name="sauce" value="">
	<input type="hidden" id="quantity" name="quantity" value="">
	<input type="hidden" id="eachCost" name="eachCost" value="">
	<input type="hidden" id="menuName" name="menuName" value="${menu.name}">
	<input type="hidden" id="toppingAdd" name="toppingAdd" value="">
	<input type="hidden" id="meatAdd" name="meatAdd" value="">
	<input type="hidden" id="cheeseAdd" name="cheeseAdd" value="">
	<input type="hidden" id="setAdd" name="setAdd" value="">
	<input type="hidden" id="menu_type" name="menu_type" value="${select}">
	<input type="hidden" id="fullAddr" name="fullAddr" value="${fullAddr}">
</form> 
</body>
</html>