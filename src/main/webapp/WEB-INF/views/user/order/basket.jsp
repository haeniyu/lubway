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
<meta charset="UTF-8">
<title>장바구니</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//When page loads...
	$("ul.select li:first").addClass("active").show(); //Activate first tab
	$(".data_none:first").show(); //Show first tab content
	
	//On Click Event
	$("ul.select li").click(function() {
		select = $(this).attr("id");
		
		$("ul.select li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		
	});//end click function
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<!-- container s -->
	<div id="container">
		<!-- sub content s -->
		<div class="cart" id="content">
			<!-- index -->
			<h2 class="subTitle_02">장바구니</h2>
			<div class="tab02">
				<ul class="select" id="select">
					<li id="fast"><a href="#">FAST-WAY</a></li>
					<li id="home"><a href="#">HOME-WAY</a></li>
				</ul>
			</div>
			<!-- 장바구니 목록 있을 때 -->
			<div class="cart_header wh_box">
				<dl>
					<dt>픽업매장</dt>
					<dd>
						<strong>종로삼일대로점 (서울특별시 종로구 삼일대로 391 )</strong>
						<a href="javascript:void(0);" id="changeStore" data-url="/order/view/fast/near/store" data-stor="58427">
							변경
						</a>
					</dd>
				</dl>
				<div class="txt_last_14day">최근 14일 이내 담은 상품만 확인 가능합니다.</div>
				<div class="all_select">
					<label class="form_checkbox">
						<input data-target="all" type="checkbox" />
						<span class="icon"></span>
						전체선택
					</label>
					<a class="btn bgc_white" href="javascript:void(0);" id="cartItemDelete"><span>선택삭제</span></a>
				</div>
			</div>
			<ul class="cart_list">
				<li class="wh_box" data-target="row" data-cartIdx="1076657" data-side="N">
					<div class="order_info">
						<div class="menu_info">
							<label class="form_checkbox">
								<input data-target="each" type="checkbox" />
								<span class="icon"></span>
								<th:object>스테이크/치즈</th:object>
							</label>
							<p>
								
									<!-- 빵길이 -->
									<th:object>15cm, </th:object>
									<!-- 빵종류 -->
									<th:object>화이트(토스팅), </th:object>
									<!-- 치즈 -->
									<th:object>슈레드치즈, </th:object>
									<!-- 야채 -->
									
										<th:object>양상추, </th:object>
									
									
										<th:object>토마토, </th:object>
									
									
										<th:object>오이, </th:object>
									
									
										<th:object>피망, </th:object>
									
									
										<th:object>양파, </th:object>
									
									<!-- 소스 -->
									
										<th:object>스모크 바비큐, </th:object>
									
									
										<th:object>사우스 웨스트 치폴레</th:object>
									
								
							</p>
							<strong>
								<em>6,500</em>
								<span>원</span>
							</strong>
						</div>
						<img onError="this.src='/images/common/noneImage.jpg'" alt="스테이크/치즈" src="" />
					</div>
					
					
						
						<div class="total">
							<dl class="count">
								<dt>수량</dt>
								<dd>
									<input name="eachPrice" type="hidden" value="6500" />
									<a class="minus" href="javascript:void(0);">수량 빼기</a>
									<input name="qty" type="text" value="1" />
									<a class="plus" href="javascript:void(0);">수량 더하기</a>
								</dd>
							</dl>
							
							<dl class="total_sum">
								<dt>총 주문금액</dt>
								<dd>
									<strong class="eachTotalPrice">6,500</strong>
									<span>원</span>
								</dd>
							</dl>
						</div>
					
				</li>
			</ul>
			<div class="final_payment wh_box">
				<dl>
					<dt>최종 결제 금액</dt>
					<dd>
						<strong id="totalPrice">0</strong>
						<span>원</span>
					</dd>
				</dl>
				<div class="btn_area">
					<form method="post" name="orderForm">
						<input name="ordType" type="hidden" value="ORD_TYPE.FAST_SUB" />
						<input name="storCd" type="hidden" value="58427" />
						
					</form>
					<a class="btn bgc_white" href="javascript:void(0);" id="addMenu"><span>메뉴추가하기</span></a>
					<a class="btn bgc_point i_reg" href="javascript:void(0);" id="setOrder" data-cart-type="CART_TYPE.FAST_SUB"><span>주문하기</span></a>
				</div>
			</div>
		
			<!-- 장바구니 목록 비어있을 때 
			<div class="data_none wh_box">
				<p>장바구니가 비어있습니다.</p>
			</div>
		</div>-->
		<!--// sub content e -->
	</div>

<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>