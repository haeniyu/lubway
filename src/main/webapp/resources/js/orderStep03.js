	//주문하기 페이지로 이동
	function gotoStep04() {
		if(!checkSize || !checkBread || !checkCheese || !checkVegetable || !checkSauce){
			alert("필수 선택을 선택해주세요.");
			return;
		}
		var totalPrice = $("#finalAmt").text();
		$("#totalPrice").val(totalPrice);
		
		var step01Text = $("#selectStep01").text();
		var step02Text = $("#selectStep02").text();
		var step03Text = $("#selectStep03").text();
		$("#step01Text").val(step01Text);
		$("#step02Text").val(step02Text);
		$("#step03Text").val(step03Text);
		
		$("#orderForm").append($("#eachPrice"));	//빵 길이 추가 가격 포함
		$("#orderForm").append($("#ordQty"));		//수량
		
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
	// 토핑 추가 선택
	function endAddSelect() {
		var topping = $("#toppingText").text();
		if(topping == "원하는 제품을 추가 선택해 주세요") {
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
		$(object).insertAfter("#selectTopping");
		
		$("#closeLength").get(0).click();
	}
	
	// 치즈 추가 선택
	function endAddCheeseSelect() {
		var add_cheese = $("#addCheeseText").text();
		if(add_cheese == "치즈 추가를 선택해 주세요") {
			$("#selectCheese").remove();
			$("#closeLength").get(0).click();
			return;
		}
			
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
	var ep = $("#eachPrice").val(); //현재메뉴 단품 가격
	var cost = parseInt(ep);
	var sum = cost; //추가되는 금액
	var brdcost = 0; //빵 길이에 따른 가격 설정을 위한 변수. 기본15cm 기준 (무료)
	var ttl = 0;	//토핑의 총 가격
	var sumUntilStep1 = 0;

		
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
				console.log(sumUntilStep1);
				sumUntilStep2 = sumUntilStep1;
				console.log(sumUntilStep2);				
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
		var sumUntilStep2;	//스텝2까지의 가격 저장***
      
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

		var finalcost = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
				$(this).prop("checked", false);
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
         
		var finalcost = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
         
         if($(this).is(":checked") == true) {//체크 시
			sum += cost;
			$('#addCheeseText').text(tempArr[0]);
        	 $('#sum3').text("+ " + cost + "원");
         } else {//체크 해제 시
			sum -= cost;
			
			$('#addCheeseText').text("치즈 추가를 선택해 주세요");
        	 $('#sum3').text("+ " + 0 + "원");
         }
         
		var finalcost = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
				$("input:radio[name=cookie]").click(function(){
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
				
			}else{ //웨지 세트 선택
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
				
				if(checkset != 0){
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
				}else{
					alert("쿠키 또는 웨지/스프를 선택해주세요.");
					 $(this).prop('checked', false);
				}
			});
					
			//세트 선택 버튼 클릭 시	
			$(".choice_set_btn").click(function(){
				sum = sumUntilStep2;
				sum += setcost;
				
				var object = $('<object id="showSet">' + $("#setText").text() + '</object>');
				$("#showSet").remove();
				$(object).prependTo("#selectStep03");
				
				var num2 = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#finalAmt").text(num2);
					
				$("#closeLength").get(0).click();
				
			});
			
		});// end of radio[name=select_set] 세트 선택******
		
		
	//단품 선택
	$("#select_one").click(function(){
		sum = sumUntilStep2; //스텝2까지의 가격으로 초기화
		var num2 = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#finalAmt").text(num2);
		
		$("#showSet").remove();
			
		$("#closeLength").get(0).click();
	});// end of 단품 선택
	
	
	
	//수량 조절
	$("#qtyAdd").click(function() {
		qty++;
		console.log(qty);
		var num = qty.toString();
		$("#ordQty").val(num);
		
		var showprice = 0;
		showprice = sum * qty;
		
		console.log(sum);
		
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