
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
	// 토핑 추가 선택
	function endAddSelect() {
		console.log("=== addToppingSelect ===");
		
		var topping = $("#toppingText").text();
		
		var object = $('<object id="selectTopping">' + topping + ', </object>')
		
		$("#selectTopping").remove();
		$(object).prependTo("#selectStep02");
		
		$("#closeLength").get(0).click();
	}
	
	// 미트 추가 선택
	function endAddMeatSelect() {
		console.log("=== addMeatSelect ===");
		
		var meat = $("#meatText").text();
		
		var object = $('<object id="selectMeat">' + meat + ', </object>')
		
		$("#selectMeat").remove();
		$(object).insertAfter("#selectTopping");
		
		$("#closeLength").get(0).click();
	}
	
	// 치즈 추가 선택
	function endAddCheeseSelect() {
		console.log("=== addCheeseSelect ===");
		if(!checkCheese) {
			alert("치즈를 선택해주세요.");
			$("#closeLength").get(0).click();
			return;
		}
		
		var add_cheese = $("#addCheeseText").text();
		
		var object = $('<object id="selectCheese">' + add_cheese + '</object>')
		
		$("#selectCheese").remove();
		$(object).appendTo("#selectStep02");
		
		$("#closeLength").get(0).click();
	}
	
	

	
/******************STEP01********************/
	
	$(document).ready(function() {
		
		hideDiv();
		
	/******************수량 조절 , 결제 금액 ********************/
	var qtyText = $("#ordQty").val();
	var qty = parseInt(qtyText);
	var ep = $("#eachPrice").val();
	var cost = parseInt(ep);
	var sum = cost;
	console.log(cost);
	
	$("#qtyAdd").click(function() {
		console.log("수량 더하기!!!");
		qty++;
		console.log(qty);
		var num = qty.toString();
		$("#ordQty").val(num);
		
		sum += cost;
		
		console.log(sum);
		
		var num2 = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		console.log(num2);
		$("#finalAmt").text(num2);
		
	});
	
	$("#qtySub").click(function() {
		console.log("수량 빼기!!!");
		if(qty > 1){
			qty--;
			console.log(qty);
			var num = qty.toString();
			$("#ordQty").val(num);
			
			sum-=cost;
			console.log(sum);
			
			var num2 = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			console.log(num2);
			$("#finalAmt").text(num2);
		}
	});
		
		//길이 선택에 따라 lengthText 값이 바뀌게 한다
		$("input:radio[name=length]").click(function(){
			var length = document.getElementsByName('length');
			var lengthChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
			for(var i=0; i<length.length; i++) {
			    if(length[i].checked) {
			    	lengthChoice = length[i].value;
			    }
			}
			console.log(lengthChoice);
			$("#lengthText").text(lengthChoice);
		});
		
		//빵 선택에 따라 breadText 값이 바뀌게 한다
		$("input:radio[name=bread]").click(function(){
			var bread = document.getElementsByName('bread');
			var breadChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
			console.log(breadChoice);
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
			console.log(cheeseChoice);
			for(var i=0; i<cheese.length; i++) {
			    if(cheese[i].checked) {
			    	cheeseChoice = cheese[i].value;
			    }
			}
			$("#cheeseText").text(cheeseChoice);
		});
		
		//야채선택
		var selectVegeText = "";
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
		var selectTotalText = "";
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
      	var ttl = 0;				//총 가격
      
      $("input:checkbox[name=topping]").click(function(){
         var temp = $(this).val();
         var tempArr = temp.split(",");
         var cost = parseInt(tempArr[1]);
         
         if($(this).is(":checked") == true) {//체크 시
            arr.push(tempArr[0]);
            ttl += cost;
			sum += ttl;
         } else {//체크 해제 시
            for(var i=0; i<arr.length; i++) {
               if(tempArr[0] == arr[i]) arr.splice(i, 1);
            }
            ttl -= cost;
			sum -= ttl;
         }
         
         $('#toppingText').text(arr.length > 0 ? arr.join(", ") : "원하는 제품을 추가 선택해 주세요");
         $('#sum').text("+ " + ttl + "원");

		var finalcost = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#finalAmt").text(finalcost);
         
      }); //end of topping

      
		//미트 추가
      $("input:checkbox[name=meat]").click(function(){
         var temp = $(this).val();
         var tempArr = temp.split(",");
         var cost = parseInt(tempArr[1]);

			var selectTarget = $("[name=meat]:checked");
			// 미트추가 선택갯수 벨리데이션
			if(selectTarget.length > 1) {
				alert("미트 추가는 1개만 선택가능합니다.");
				$(this).prop("checked", false);
				return;
			}
         
         if($(this).is(":checked") == true) {//체크 시
			sum += cost;
			$('#meatText').text(tempArr[0]);
        	 $('#sum2').text("+ " + cost + "원");
         } else {//체크 해제 시
			sum -= cost;
			
			$('#meatText').text("미트 추가를 선택 해 주세요");
        	 $('#sum2').text("+ " + 0 + "원");
         }

         
         
		var finalcost = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#finalAmt").text(finalcost);
      }); //end of meat
      
		//치즈 추가
      $("input:checkbox[name=add_cheese]").click(function(){
         var temp = $(this).val();
         var tempArr = temp.split(",");
         var cost = parseInt(tempArr[1]);
         
         if($(this).is(":checked") == true) {//체크 시
			sum += cost;
			$('#addCheeseText').text(tempArr[0]);
        	 $('#sum3').text("+ " + cost + "원");
         } else {//체크 해제 시
			sum -= cost;
			
			$('#addCheeseText').text("치즈 추가를 선택 해 주세요");
        	 $('#sum3').text("+ " + 0 + "원");
         }
         
		var finalcost = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#finalAmt").text(finalcost);
      }); //end of add_cheese
      
/******************STEP03********************/
		$(".wedge").hide();
		$("input:radio[name=select_set]").click(function(){
			var temp = $(this).val();
			console.log(temp);
			if(temp == "cookie") {
				$(".cookie").show();
				$(".wedge").hide();
			}else{
				$(".wedge").show();
				$(".cookie").hide();
			}
			
		});
		

	
	console.log("잘 왓니....");
	console.log(ttl);
	if(ttl > 0){
		sum += ttl;
		console.log(sum);
	}
	
	if(meatcost > 0){
		sum += meatcost;
		console.log(sum);
	}
	
	if(cheesecost > 0){
		sum += cheesecost;
		console.log(sum);
	}
		var finalcost = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		console.log(finalcost);
		$("#finalAmt").text(finalcost);
		
	
	});