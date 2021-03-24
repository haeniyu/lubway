<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="${path}/resources/js/order.js"></script>
<link rel="stylesheet" href="${path}/resources/css/modal.css" />
<link rel="stylesheet" href="${path}/resources/css/choice_option.css" />
<script type="text/javascript">


/******************STEP01********************/

	function endSauce() {
		console.log("=== checkSauce ===");
		var checkCount = $("input:checkbox[name=sauce]:checked").length;
		console.log("선택된 소스 개수 : " + checkCount);
		console.log("=== checkSauce ===");
		
		if(checkCount == 0) alert("소스/시즈닝을 선택하여 주세요.");

		$("#sauceText").val();
		
	}
	
	$(document).ready(function() {
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
			$('#vegeText').text(vegeArr.length > 0 ? vegeArr.join(",") : "야채를 선택해 주세요.");
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
			$('#sauceText').text(itemArr.length > 0 ? itemArr.join(",") : "소스/시즈닝을 선택해 주세요.");
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
         } else {//체크 해제 시
            for(var i=0; i<arr.length; i++) {
               if(tempArr[0] == arr[i]) arr.splice(i, 1);
            }
            ttl -= cost;
         }
         
         $('#toppingText').text(arr.length > 0 ? arr.join(",") : "원하는 제품을 추가 선택해 주세요");
         $('#sum').text(ttl);
         
      }); //end of topping
      
      
		//미트 추가
      $("input:radio[name=meat]").click(function(){
         var temp = $(this).val();
         var tempArr = temp.split(",");
         var cost = parseInt(tempArr[1]);
         
         $('#meatText').text(tempArr[0]);
         $('#sum2').text(cost);
         
      }); //end of meat
	      
	});
</script>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="choice_option">
		<div class="step01">
			<div class="th_name_step01">
				<strong>STEP 01</strong>&nbsp;&nbsp;필수 선택 *
			</div>
			<div id="length" class="modal">
				<div class="option_display">
					<dl>
						<dt>빵 길이 선택</dt>
						<dd id="lengthText">15cm</dd>
					</dl>
				</div>
				<div class="popup_content length">
					<ul>
						<li><label class="form_circle" for="15cm">
						<input name="length" type="radio" checked="checked" id="15cm" value="15cm">
						<span class="icon"></span>
						<em>15cm</em>
						</label></li>
						<li><label class="form_circle" for="30cm">
						<input name="length" type="radio" id="30cm" value="30cm">
						<span class="icon"></span>
						<em>30cm</em>
						</label></li>
					</ul>
				</div>
			</div>
			<div class="wrap_pop">
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
							<li><label class="form_circle">
							<input name="bread" type="radio" value="${bread.name }">
							<span class="icon"></span>
							<em>${bread.name }</em>
							</label></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="wrap_pop">
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
							<li><label class="form_circle">
							<input name="cheese" type="radio" value="${cheese.name }">
							<span class="icon"></span>
							<em>${cheese.name }</em>
							</label></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="wrap_pop">
				<a class="pop" href="#cheese" rel="modal:open">치즈 선택</a>
			</div>

			<div id="vegetable" class="modal">
				<div class="option_display">
					<dl>
						<dt>야채 선택 (다중 선택)</dt>
						<dd id="vegeText">원하는 야채를 선택하여 주세요.</dd>
					</dl>
				</div>
				<div class="popup_content vegetable">
					<ul>
						<c:forEach items="${vegeList }" var="vege">
							<li><label class="form_circle">
							<input name="vegetable" type="checkbox" value="${vege.name }">
							<span class="icon"></span>
							<em>${vege.name }</em>
							</label></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="wrap_pop">
				<a class="pop" href="#vegetable" rel="modal:open">야채 선택</a>
			</div>

			<div id="sauce" class="modal">
				<div class="option_display">
					<dl>
						<dt>소스/시즈닝 선택</dt>
						<dd id="sauceText" >소스/시즈닝을 선택 해 주세요</dd>
					</dl>
				</div>
				<div class="popup_content sauce">
					<ul>
						<c:forEach items="${sauceList }" var="sauce">
							<li><label class="form_circle">
							<input name="sauce" type="checkbox" value="${sauce.name }">
							<span class="icon"></span>
							<strong>${sauce.sub }</strong><em>${sauce.name }</em>
							</label></li>
						</c:forEach>
					</ul>
					<a href="#" onclick="endSauce()">다음</a>
				</div>
			</div>
			<div class="wrap_pop">
				<a class="pop" href="#sauce" rel="modal:open">소스/시즈닝 선택</a>
			</div>

		</div>
		<div class="step01">
			<div class="th_name_step02">
				<strong>STEP 02</strong>&nbsp;&nbsp;추가 선택
			</div>
			<div id="topping" class="modal">
				<div class="option_display">
					<dl>
						<dt>추가 선택 (다중 선택 가능)</dt>
						<dd id="toppingText">원하는 추가 선택 제품을 선택하여 주세요</dd>
						<dd >+<span id="sum">0</span>원</dd>
					</dl>
				</div>
				<div class="popup_content topping">
					<ul>
						<c:forEach items="${toppingList }" var="topping">
							<li><label class="form_circle">
<<<<<<< HEAD
							<input name="topping" type="checkbox" value="${topping.name }">
							<span class="icon"></span>
							<em>${topping.name }</em><span>+<em>${topping.price }</em>&nbsp;원</span>
=======
							<input name="topping" type="checkbox" value="${topping.name }, ${topping.price}"><em>${topping.name }</em>
							<span>+<em>${topping.price }</em>&nbsp;원</span>
>>>>>>> 2a04efdddff88b6ed1145ddcc5992940516910b4
							</label></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="wrap_pop">
				<a class="pop" href="#topping" rel="modal:open">추가 선택</a>
			</div>

			<div id="meat" class="modal">
				<div class="option_display">
					<dl>
						<dt>미트 추가</dt>
						<dd id="meatText">미트 추가를 선택 해 주세요</dd>
						<dd><span id="sum2">0</span>원</dd>
					</dl>
				</div>
				<div class="popup_content meat">
					<ul>
						<c:forEach items="${meatList }" var="meat">
							<li><label class="form_circle">
<<<<<<< HEAD
							<input name="meat" type="radio" value="${meat.name }">
							<span class="icon"></span>
							<em>${meat.name }</em><span>+<em>${meat.price }</em>&nbsp;원</span>
=======
							<input name="meat" type="radio" value="${meat.name }, ${meat.price}"><em>${meat.name }</em>
							<span>+<em>${meat.price }</em>&nbsp;원</span>
>>>>>>> 2a04efdddff88b6ed1145ddcc5992940516910b4
							</label></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="wrap_pop">
				<a class="pop" href="#meat" rel="modal:open">미트 추가</a>
			</div>

		</div>
		<div class="step01">
			<div class="th_name_step03">
				<strong>STEP 03</strong>&nbsp;&nbsp;상품 선택
			</div>
			<div id="select_one" class="modal">
				<div class="one"><label>단품을 선택하셨습니다.</label></div>
			</div>
			<div class="wrap_pop">
				<a class="pop" href="#select_one" rel="modal:open">단품</a>
			</div>

			<div id="select_set" class="modal">
				<div class="option_display">
					<dl>
						<dt>세트 선택</dt>
					</dl>
				</div>
				<div class="popup_content set_menu">
					<ul>
						<li><label class="form_circle">
						<input name="select_set" type="radio" checked="checked" value="쿠키 세트">
						<span class="icon"></span>
						<em>쿠키 세트</em>
						</label></li>
						<li><label class="form_circle">
						<input name="select_set" type="radio" value="웨지 세트">
						<span class="icon"></span>
						<em>웨지 세트</em>
						</label></li>
					</ul>
				</div>
				<div class="popup_content">
					<ul>
						<li><label class="form_circle">
						<input name="select_set" type="radio" checked="checked" value="쿠키 세트">
						<span class="icon"></span>
						<em>쿠키 세트</em>
						</label></li>
					</ul>
				</div>
			</div>
			<div class="wrap_pop">
				<a class="pop" href="#select_set" rel="modal:open">세트</a>
			</div>

		</div>
	</div>
</body>
</html>