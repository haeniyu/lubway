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
	
});
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
					<li class="swiper-slide "><a href="/lubway/basketfast.do">FAST-SUB</a></li>
					<li class="swiper-slide active"><a href="/lubway/baskethome.do">HOME-SUB</a></li>
				</ul>
			</div>
			<!-- 장바구니 목록 있을때 -->
			
				<div class="cart_header wh_box">
				
					<dl>
						<dt>배달주소</dt>
						<dd>
							<strong>서울 마포구 양화로 45 1호</strong>
							<a href="javascript:void(0);" id="changeStore" data-url="/order/view/home/step1" data-stor="66406">
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
					<li class="wh_box" data-target="row" data-orderableYn="Y" data-cartIdx="1076572" data-side="N">
						<div class="order_info">
							<div class="menu_info">
								<label class="form_checkbox">
									<input data-target="each" type="checkbox" />
									<span class="icon"></span>
									<th:object>D로스트 치킨 아보카도 (15cm)</th:object>
								</label>
								<p>
										<!-- 빵길이 -->
										<th:object>15cm, </th:object>
										<!-- 빵종류 -->
										<th:object>하티(토스팅), </th:object>
										<!-- 치즈 -->
										<th:object>치즈 제외, </th:object>
										<!-- 야채 -->
											<th:object>토마토, </th:object>
										<!-- 소스 -->
											<th:object>스위트 칠리</th:object>
								</p>
								<strong>
									<em>7,200</em>
									<span>원</span>
								</strong>
							</div>
							<!-- 
							<img onError="this.src=''" alt="D로스트 치킨 아보카도 (15cm)" src="" />
							 -->
						</div>
							<dl class="detail_list">
									<dt>
										<em>추가</em>
										<span>오믈렛</span>
									</dt>
									<dd>
										<strong>1,200</strong>
										<span>원</span>
									</dd>
									<dt>
										<em>추가</em>
										<span class="sideText">
													더블 초코칩 쿠키/스프라이트 / 
										</span>
									</dt>
									<dd>
										<strong>2,200</strong>
										<span>원</span>
									</dd>
							</dl>
							<div class="total">
								<dl class="count">
									<dt>수량</dt>
									<dd>
										<input name="eachPrice" type="hidden" value="10600" />
										<a class="minus" href="javascript:void(0);">수량 빼기</a>
										<input name="qty" type="text" value="1" />
										<a class="plus" href="javascript:void(0);">수량 더하기</a>
									</dd>
								</dl>
								
								<dl class="total_sum">
									<dt>총 주문금액</dt>
									<dd>
										<strong class="eachTotalPrice">10,600</strong>
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
							<strong id="totalPrice">00</strong>
							<span>원</span>
						</dd>
					</dl>
					<div class="btn_area">
						<form method="post" name="orderForm">
							<input name="ordType" type="hidden" value="ORD_TYPE.HOME_SUB" />
							<input name="storCd" type="hidden" value="66406" />
							
								<input name="receiverZipcd" type="hidden" value="04036" />
								<input name="receiverAddr" type="hidden" value="서울 마포구 양화로 45" />
								<input name="receiverAddrDtl" type="hidden" value="1호" />
							
						</form>
						<a class="btn bgc_white" href="javascript:void(0);" id="addMenu"><span>메뉴추가하기</span></a>
						<a class="btn bgc_point i_reg" href="javascript:void(0);" id="setOrder" data-cart-type="CART_TYPE.HOME_SUB"><span>주문하기</span></a>
					</div>
				</div>
			

			<!-- 장바구니 목록 없을때 -->
			<div class="data_none wh_box">
				<p>장바구니가 비어있습니다.</p>
			</div>

			<!--// index -->
		</div>
		<!--// sub content e -->
	</div>

<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>