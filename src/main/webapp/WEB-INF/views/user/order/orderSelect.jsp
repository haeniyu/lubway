<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="${path}/resources/js/order.js"></script>
<link rel="stylesheet" href="${path}/resources/css/modal.css" />
<link rel="stylesheet" href="${path}/resources/css/choice_option.css" />
<!--  -->
<script type="text/javascript">
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
		var selectTotalText = "";
		var itemArr = new Array();
		$("input:checkbox[name=sauce]").click(function() {
			var selectTarget = $("[name=sauce]:checked");

			if($(this).is(":checked") == true) {
				itemArr.push($(this).val());
			} else {
				for(var i=0; i<itemArr.length; i++) {
					if($(this).val() == itemArr[i]) itemArr.splice(i, 1);
				}
			}
			console.log(itemArr);
			// 선택 토핑
			$('#sauceText').text(itemArr.length > 0 ? itemArr.join(",") : "소스/시즈닝을 선택하여 주세요.");
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
			$('#sauceText').text(itemArr.length > 0 ? itemArr.join(",") : "소스/시즈닝을 선택하여 주세요.");
		});
		
		/******************STEP02********************/
	      /*****************토핑 추가 선택*****************/
	      var selected = "";
	      var arr = new Array();
	      $("input:checkbox[name=topping]").click(function(){
	         
	         if($(this).is(":checked") == true) {
	            arr.push($(this).val());
	         } else {
	            for(var i=0; i<arr.length; i++) {
	               if($(this).val() == arr[i]) arr.splice(i, 1);
	            }
	         }
	         
	         console.log(arr);
	         $('#toppingText').text(arr.length > 0 ? arr.join(",") : "원하는 추가 선택 제품을 선택하여 주세요");
	         
	      }); //end of topping
	      
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
						<em>15cm</em>
						</label></li>
						<li><label class="form_circle" for="30cm">
						<input name="length" type="radio" id="30cm" value="30cm">
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
						<dd id="breadText">화이트</dd>
					</dl>
				</div>
				<div class="popup_content bread">
					<ul>
						<li><label class="form_circle" for="b1">
						<input name="bread" type="radio" checked="checked" id="b1" value="화이트">
						<em>화이트</em>
						</label></li>
						<li><label class="form_circle" for="b2">
						<input name="bread" type="radio" id="b2" value="파마산 오레가노">
						<em>파마산 오레가노</em>
						</label></li>
						<li><label class="form_circle" for="b3">
						<input name="bread" type="radio" id="b3" value="위트">
						<em>위트</em>
						</label></li>
						<li><label class="form_circle" for="b4">
						<input name="bread" type="radio" id="b4" value="허니오트">
						<em>허니오트</em>
						</label></li>
						<li><label class="form_circle" for="b5">
						<input name="bread" type="radio" id="b5" value="하티">
						<em>하티</em>
						</label></li>
						<li><label class="form_circle" for="b6">
						<input name="bread" type="radio" id="b6" value="플랫브레드">
						<em>플랫브레드</em>
						</label></li>
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
						<dd id="cheeseText">아메리칸치즈</dd>
					</dl>
				</div>
				<div class="popup_content cheese">
					<ul>
						<li><label class="form_circle" for="cheese1">
						<input name="cheese" type="radio" checked="checked" id="cheese1" value="아메리칸 치즈">
						<em>아메리칸 치즈</em>
						</label></li>
						<li><label class="form_circle" for="cheese2">
						<input name="cheese" type="radio" id="cheese2" value="슈레드 치즈">
						<em>슈레드 치즈</em>
						</label></li>
						<li><label class="form_circle" for="cheese3">
						<input name="cheese" type="radio" id="cheese3" value="모차렐라 치즈">
						<em>모차렐라 치즈</em>
						</label></li>
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
						<label>생야채</label>
						<li><label class="form_circle" for="vege1">
						<input name="vegetable" type="checkbox" id="vege1" value="vege1">
						<em>양상추</em>
						</label></li>
						<li><label class="form_circle" for="vege2">
						<input name="vegetable" type="checkbox" id="vege2" value="vege2">
						<em>토마토</em>
						</label></li>
						<li><label class="form_circle" for="vege3">
						<input name="vegetable" type="checkbox" id="vege3" value="vege3">
						<em>오이</em>
						</label></li>
						<li><label class="form_circle" for="vege4">
						<input name="vegetable" type="checkbox" id="vege4" value="vege4">
						<em>피망</em>
						</label></li>
						<li><label class="form_circle" for="vege5">
						<input name="vegetable" type="checkbox" id="vege5" value="vege5">
						<em>양파</em>
						</label></li>
					</ul>
					<ul>
						<label>절임류</label>
						<li><label class="form_circle" for="vege6">
						<input name="vegetable" type="checkbox" id="vege6" value="vege6">
						<em>피클</em>
						</label></li>
						<li><label class="form_circle" for="vege7">
						<input name="vegetable" type="checkbox" id="vege7" value="vege7">
						<em>올리브</em>
						</label></li>
						<li><label class="form_circle" for="vege8">
						<input name="vegetable" type="checkbox" id="vege8" value="vege8">
						<em>할라피뇨</em>
						</label></li>
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
						<li><label class="form_circle" for="sauce1">
						<input name="sauce" type="checkbox" id="sauce1" value="머스타드">
						<strong>알싸한</strong><em>머스타드</em>
						</label></li>
						<li><label class="form_circle" for="sauce2">
						<input name="sauce" type="checkbox" id="sauce2" value="레드와인식초">
						<strong>과일향</strong><em>레드와인식초</em>
						</label></li>
						<li><label class="form_circle" for="sauce3">
						<input name="sauce" type="checkbox" id="sauce3" value="스위트 어니언">
						<strong>달콤한</strong><em>스위트 어니언</em>
						</label></li>
						<li><label class="form_circle" for="sauce4">
						<input name="sauce" type="checkbox" id="sauce4" value="허니 머스타드">
						<strong>새콤달콤한</strong><em>허니 머스타드</em>
						</label></li>
						<li><label class="form_circle" for="sauce5">
						<input name="sauce" type="checkbox" id="sauce5" value="스위트 칠리">
						<strong>매콤달콤한</strong><em>스위트 칠리</em>
						</label></li>
						<li><label class="form_circle" for="sauce6">
						<input name="sauce" type="checkbox" id="sauce6" value="스모크 바비큐">
						<strong>스모크 향</strong><em>스모크 바비큐</em>
						</label></li>
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
						<dd id="sum">+<span>0</span>원</dd>
					</dl>
				</div>
				<div class="popup_content topping">
					<ul>
						<li><label class="form_circle" for="topping1">
						<input name="topping" type="checkbox" id="topping1" value="topping1">
						<em>에그마요</em><span><em>+1,600</em>&nbsp;원</span>
						</label></li>
						<li><label class="form_circle" for="topping2">
						<input name="topping" type="checkbox" id="topping2" value="topping2">
						<em>페퍼로니</em><span><em>+900</em>&nbsp;원</span>
						</label></li>
						<li><label class="form_circle" for="topping3">
						<input name="topping" type="checkbox" id="topping3" value="topping3">
						<em>베이컨</em><span><em>+900</em>&nbsp;원</span>
						</label></li>
						<li><label class="form_circle" for="topping4">
						<input name="topping" type="checkbox" id="topping4" value="topping4">
						<em>아보카도</em><span><em>+1,300</em>&nbsp;원</span>
						</label></li>
						<li><label class="form_circle" for="topping5">
						<input name="topping" type="checkbox" id="topping5" value="topping5">
						<em>오믈렛</em><span><em>+1,200</em>&nbsp;원</span>
						</label></li>
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
						<dd id="meat">미트 추가를 선택 해 주세요</dd>
						<dd id="sum"><span>0</span>원</dd>
					</dl>
				</div>
				<div class="popup_content meat">
					<ul>
						<li><label class="form_circle" for="meat1">
						<input name="meat" type="radio" id="meat1" value="meat1">
						<em>로스트 치킨</em><span><em>+1,800</em>&nbsp;원</span>
						</label></li>
						<li><label class="form_circle" for="meat2">
						<input name="meat" type="radio" id="meat2" value="meat2">
						<em>클럽</em><span><em>+1,800</em>&nbsp;원</span>
						</label></li>
						<li><label class="form_circle" for="meat3">
						<input name="meat" type="radio" id="meat3" value="meat3">
						<em>터키</em><span><em>+1,800</em>&nbsp;원</span>
						</label></li>
						<li><label class="form_circle" for="meat4">
						<input name="meat" type="radio" id="meat4" value="meat4">
						<em>비엠티</em><span><em>+1,800</em>&nbsp;원</span>
						</label></li>
						<li><label class="form_circle" for="meat5">
						<input name="meat" type="radio" id="meat5" value="meat5">
						<em>비엘티</em><span><em>+1,800</em>&nbsp;원</span>
						</label></li>
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
						<dd id="select_set">쿠키 세트</dd>
					</dl>
				</div>
				<div class="popup_content set_menu">
					<ul>
						<li>
						<select name="select_set">
							<option value="cookie">쿠키 세트</option>
							<option value="wedge">웨지 세트</option>
						</select>
						</li>
					</ul>
				</div>
			</div>
			<c:if test="">
				<div class="popup_content cookie">
					<ul>
						<li><label class="form_circle" for="15cm">
						<input name="length" type="radio" checked="checked" id="15cm" value="15cm">
						<em>15cm</em>
						</label></li>
					</ul>
				</div>
			</c:if>
			<div class="wrap_pop">
				<a class="pop" href="#select_set" rel="modal:open">세트</a>
			</div>

		</div>
	</div>

</body>
</html>