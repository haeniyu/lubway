<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/cart.css" />
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<meta charset="UTF-8">
<title>LUBWAY</title>
<script type="text/javascript">
function addMenu() {
	$("#addMenuForm").submit();
}

var min = 1;
var max = "10";
var count = "";
var qty = "";
var basket = "";
var totalPrice = 0;
var cnt = 0;
var totalCnt = 0;
var selectId = "";
$(document).ready(function(){
	for(var i=1; i <= Number($("#qty"+i).attr("name")); i++){
			count = i;
			qty = $("#qty"+count).val();
			basket = $(".eachTotalPrice"+count).attr('id');
			basket = Number(basket);
			$(".eachTotalPrice"+count).text(basket);
			totalPrice += basket;
			$("#totalPrice").text(totalPrice);
	}
	
	$(".form_checkbox").off().on("click", function() {
		totalCnt = $(".form_checkbox").length;
		cnt = $("[class=menu]:checked").length;
		selectId = $(this).find("input").attr("id");
		console.log(selectId);
		if(selectId == "all") {
			if($("input:checkbox[id=all]").is(":checked") == true) $("input:checkbox").prop("checked", false);
			else $("input:checkbox").prop("checked", true);
		} else {
			if($("input:checkbox[id=all]").is(":checked") == true) $("input:checkbox[id=all]").prop("checked", false);
			else {
				if(totalCnt-1 == cnt) $("input:checkbox[id=all]").prop("checked", true);
			}
		}
	});
	
	//수량 변경
	$(".plus").click("click",function(){
		count = $(this).attr('id');
		qty = $("#qty"+count).val()*1;
		basket = $(".eachTotalPrice"+count).text();
		qty += 1;
		if(qty>max){
			alert("최대수량은 10개 입니다.");
			qty -= 1;
			return;
		}
		var add = Number(basket) / Number(qty-1);
		basket = Number(basket) + add;
		$(".eachTotalPrice"+count).text(basket);
		$("#qty"+count).val(qty);
		totalPrice += add;
		$("#totalPrice").text(totalPrice);		

	});
	
	$(".minus").click("click",function(){
		count = $(this).attr('id');
		qty = $("#qty"+count).val()*1;
		basket = $(".eachTotalPrice"+count).text();
		qty -= 1;
		if(qty<min){
			qty += 1;
			return;
		}
		var minus = Number(basket) / Number(qty+1);
		basket = Number(basket) - minus;
		$(".eachTotalPrice"+count).text(basket);
		$("#qty"+count).val(qty);
		totalPrice -= minus;
		$("#totalPrice").text(totalPrice);		

	});
});

//주문하기 페이지로 이동
function orderBasket() {
	var totalNum = "";
	if(cnt == 0) {
		alert("주문하실 메뉴를 선택해 주세요.");
		return;
	} else {
		for(var i=0; i < totalCnt-1; i++){
			console.log(i);
			console.log($("[name=menu"+i+"]").attr("id"));
			console.log($("[name=menu"+i+"]").is(":checked") == true);
			if($("[name=menu"+i+"]").is(":checked") == true) {
				if(i == totalCnt-2) {
					totalNum += $("[name=menu" + i + "]:checked").attr("id");
				} else {
					totalNum += $("[name=menu" + i + "]:checked").attr("id") + ",";
				}
			}
		}
	}
	console.log(totalNum);
	$("input[name=basketNo]").val(totalNum);
	console.log($("input[name=basketNo]").val());
	$("#orderForm").submit();
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<!-- container s -->
	<div id="container">
		<!-- sub content s -->
		<div class="cart fast_sub" id="content">
			<!-- index -->
			<h2 class="subTitle_02">장바구니</h2>
			<div class="tab02">
				<ul>
					<li class="swiper-slide "><a href="/lubway/basketfast.do">FAST-WAY</a></li>
					<li class="swiper-slide active"><a href="/lubway/baskethome.do">HOME-WAY</a></li>
				</ul>
			</div>
			<!-- 장바구니 목록 있을때 -->
			<c:if test="${basket ne null}">
			<div class="cart_header wh_box" id="cart_header">
				
					<dl>
						<dt>배달주소</dt>
						<dd>
							<strong>${user_address}</strong>
							<a href="javascript:void(0);" id="changeStore" data-url="/order/view/home/step1" data-stor="66406">
								변경
							</a>
						</dd>
					</dl>
					<div class="all_select">
						<label class="form_checkbox">
							<input id="all" type="checkbox" />
							<span class="icon"></span>
							전체선택
						</label>
						<a class="btn bgc_white" href="javascript:void(0);" id="cartItemDelete"><span>선택삭제</span></a>
					</div>
				</div>
				
				<!-- 리스트 박스  -->
				<c:set var="endCount" value="0" />
				<c:forEach items="${basket}" var="basket" varStatus="stat">
				<ul class="cart_list" id="cart_list">
					<li class="wh_box" data-target="row" data-orderableYn="Y" data-cartIdx="1076572" data-side="N">
						<div class="order_info">
							<div class="menu_info">
								<label class="form_checkbox">
									<input id="${basket.no}" type="checkbox" name="menu${stat.index}" class="menu"/>
									<span class="icon"></span>
									<object>${basket.menu_name}</object>
								</label>
								<p>
									<c:if test="${basket.menu_type ne 'side' and basket.menu_type ne 'wrap'}">
										<c:if test="${basket.menu_type eq 'sandwich'}">
											<c:if test="${basket.size eq 'false'}">
												<object>15cm, </object>
											</c:if>
											<c:if test="${basket.size eq 'true'}">
												<object>30cm, </object>
											</c:if>
											<object>${basket.bread}, </object>
										</c:if>
										<object>${basket.cheese}, </object>
										<object>${basket.vegetable}, </object>
										<object>${basket.sauce}</object>
									</c:if>
								</p>
								<strong>
									<em>${basket.single_price}</em>
									<span>원</span>
								</strong>
							</div>
							<img alt="${basket.menu_name}" src="${basket.menu_filepath}">
						</div>
						<c:if test="${basket.add_meat ne null or basket.add_topping ne null or basket.add_cheese ne null or basket.set_price ne null}">
								<dl class="detail_list">
									<c:if test="${basket.add_meat ne null}">
											<dt>
												<em>추가</em>
												<span>${basket.add_meat}</span>
											</dt>
											<dd>
												<strong>1800</strong>
												<span>원</span>
											</dd>
										</c:if>
										
										<c:if test="${basket.add_topping ne null}">
											<c:set var="count" value="${basket.count}" />
											<c:forEach items="${price}" var="getPrice" varStatus="var" begin="${endCount}" end="${endCount + count - 1}">
												<dt>
													<em>추가</em>
													<span>${getPrice.name}</span>
												</dt>
												<dd>
													<strong>${getPrice.topping_price}</strong>
													<span>원</span>
												</dd> 	
											</c:forEach>
											<c:set var="endCount" value="${endCount + count}" />
										</c:if>
										
										<c:if test="${basket.add_cheese ne null}">
											<dt>
												<em>추가</em>
												<span>${basket.add_cheese}</span>
											</dt>
											<dd>
												<strong>900</strong>
												<span>원</span>
											</dd>
										</c:if>
										
										<c:if test="${basket.set_price ne null}">										
											<dt>
												<em>추가</em>
												<span class="sideText">
													${basket.set_name} 
												</span>
											</dt>
											<dd>
												<strong>${basket.set_price}</strong>
												<span>원</span>
											</dd>
										</c:if>
									</dl>
									</c:if>
							<div class="total">
								<dl class="count">
									<dt>수량</dt>
									<dd>
										<input name="eachPrice" type="hidden" value="" />
										<a class="minus" id="${stat.count }" href="javascript:void(0);">수량 빼기</a>
										<input class="qty" id="qty${stat.count }" name="${stat.count}" type="text" value="${basket.quantity}" readonly/>
										<a class="plus" id="${stat.count }" href="javascript:void(0);">수량 더하기</a>
									</dd>
								</dl>
								
								<dl class="total_sum">
									<dt>총 주문금액</dt>
									<dd>
										<strong class="eachTotalPrice${stat.count}" id="${basket.total_price}">${basket.total_price}</strong>
										<span>원</span>
									</dd>
								</dl>
							</div>
					</li>
				</ul>
				</c:forEach>
				<div class="final_payment wh_box" id="final_payment">
					<dl>
						<dt>최종 결제 금액</dt>
						<dd>
							<strong id="totalPrice"></strong>
							<span>원</span>
						</dd>
					</dl>
					<div class="btn_area">
						<a class="btn bgc_white" href="javascript:void(0);" onclick="addMenu();" id="addMenu"><span>메뉴추가하기</span></a>
						<a class="btn bgc_point i_reg" href="javascript:void(0);" id="setOrder" onclick="orderBasket();"><span>주문하기</span></a>
					</div>
				</div>
				</c:if>

			<!-- 장바구니 목록 없을때 -->
			<c:if test="${basket eq null}">
			<div class="data_none wh_box" id="data_none">
				<p>장바구니가 비어있습니다.</p>
			</div>
			</c:if>
			<!--// index -->
		</div>
		<!--// sub content e -->
	</div>

	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
	<form action="orderStep02.do" method="post" id="addMenuForm">
		<input type="hidden" name="franchiseNo" value="${store.no}">
		<input type="hidden" name="fullAddr" value="${user_address}">
		<input type="hidden" name="whatWay" value="Home-Way">
	</form>
	<form action="orderBasket.do" method="post" id="orderForm">
		<input type="hidden" name="basketNo" value="">
	</form>
</body>
</html>