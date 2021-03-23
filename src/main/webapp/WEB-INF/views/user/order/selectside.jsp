<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/order.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/modal.css" />
</head>
<body>
	<div class="menu_view">
		<ol class="menu_select">
			<li class="step01">
				<dl>
					<dt>
						<strong>STEP 01</strong> 필수 선택 *
					</dt>
					<dd>
						<ul>
							<li class="on">
								<div id="ex1" class="modal">
									<p>길이 선택</p>
									<a href="#" rel="modal:close"></a>
								</div>
							</li>
							<p><a href="#ex1" rel="modal:open">길이 선택</a>
							<li class="on"><a id="bread">빵 선택</a></li>
							<li class="on"><a id="cheese">치즈 선택</a></li>
							<li class="on"><a id="vegetable">야채 선택</a></li>
							<li class="on"><a id="sauce">소스/시즈닝 선택</a></li>
						</ul>
						<p>
							<!-- 빵길이 -->
							<th:object>15cm, </th:object>
							<!-- 빵종류 -->
							<th:object>위트</th:object>
							<!-- 토스팅 여부 -->
							<th:object>(토스팅), </th:object>

							<!-- 치즈 -->
							<th:object>슈레드치즈, </th:object>
							<!-- 야채 -->

							<th:object>양상추, </th:object>


							<th:object>토마토, </th:object>


							<th:object>오이, </th:object>


							<th:object>피망, </th:object>


							<th:object>양파, </th:object>

							<!-- 소스 -->

							<th:object>스위트 칠리</th:object>

						</p>
					</dd>
				</dl>
			</li>

			<li class="step02">
				<dl>
					<dt>
						<strong>STEP 02</strong> 추가 선택
					</dt>
					<dd>
						<div>
							<ul>
								<li><a id="extra">추가 선택</a></li>
								<li><a id="doubleUp">미트 추가</a></li>
							</ul>
							<div></div>
						</div>
					</dd>
				</dl>
			</li>
			<li class="step03">

				<dl>
					<dt>
						<strong>STEP 03</strong> 상품 선택
					</dt>
					<dd>
						<div>
							<ul>

								<li class="on"><a href="javascript:void(0);">단품</a></li>

								<li><a id="set">세트</a></li>


							</ul>
							<div></div>
						</div>
					</dd>
				</dl>

			</li>

		</ol>
		<div class="menu_total">
			<input name="eachPrice" type="hidden" value="6500" />
			<dl class="count">
				<dt>수량</dt>
				<dd>
					<a class="minus" href="javascript:;" id="qtySub">수량 빼기</a> <input
						id="ordQty" onfocus="this.blur();" type="text" value="1" /> <a
						class="plus" href="javascript:;" id="qtyAdd">수량 더하기</a>
				</dd>
			</dl>
			<dl class="total_won">
				<dt>최종 결제 금액</dt>
				<dd>
					<strong id="finalAmt">6,500</strong> <span>원</span>
				</dd>
			</dl>
		</div>


		<div class="btn_area">
			<button class="btn bgc_white btn_cart" id="cartBtn" type="button">
				<span>장바구니</span>
			</button>
			<button class="btn i_reg btn_order bgc_point" id="billBtn"
				type="button">
				<span>주문하기</span>
			</button>
		</div>
	</div>
	
</body>
</html>