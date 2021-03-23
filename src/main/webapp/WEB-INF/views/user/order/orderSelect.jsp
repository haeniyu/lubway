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
</head>
<body>
	<div class="choice_option">
		<div class="step01">
			<div class="th_name_step01">
				<strong>STEP 01</strong>&nbsp;&nbsp;필수 선택 *
			</div>
			<div id="length" class="modal">
				<p>길이 선택</p>
				<a href="#" rel="modal:close"></a>
			</div>
			<div class="wrap_pop"><a class="pop" href="#length" rel="modal:open">길이 선택</a></div>
			<div id="bread" class="modal">
				<p>빵 선택</p>
				<a href="#" rel="modal:close"></a>
			</div>
			<div class="wrap_pop"><a class="pop" href="#bread" rel="modal:open">빵 선택</a></div>
			
			<div id="cheese" class="modal">
				<p>치즈 선택</p>
				<a href="#" rel="modal:close"></a>
			</div>
			<div class="wrap_pop"><a class="pop" href="#cheese" rel="modal:open">치즈 선택</a></div>
			
			<div id="vegetable" class="modal">
				<p>야채 선택</p>
				<a href="#" rel="modal:close"></a>
			</div>
			<div class="wrap_pop"><a class="pop" href="#vegetable" rel="modal:open">야채 선택</a></div>
			
			<div id="sauce" class="modal">
				<p>소스/시즈닝 선택</p>
				<a href="#" rel="modal:close"></a>
			</div>
			<div class="wrap_pop"><a class="pop" href="#sauce" rel="modal:open">소스/시즈닝 선택</a></div>
			
		</div>
		<div class="step01">
			<div class="th_name_step02">
				<strong>STEP 02</strong>&nbsp;&nbsp;추가 선택
			</div>
			<div id="add" class="modal">
				<p>추가 선택</p>
				<a href="#" rel="modal:close"></a>
			</div>
			<div class="wrap_pop"><a class="pop" href="#add" rel="modal:open">추가 선택</a></div>
			
			<div id="meat" class="modal">
				<p>미트 추가</p>
				<a href="#" rel="modal:close"></a>
			</div>
			<div class="wrap_pop"><a class="pop" href="#meat" rel="modal:open">미트 추가</a></div>
			
		</div>
		<div class="step01">
			<div class="th_name_step03">
				<strong>STEP 03</strong>&nbsp;&nbsp;상품 선택
			</div>
			<div id="add" class="modal">
				<p>단품</p>
				<a href="#" rel="modal:close"></a>
			</div>
			<div class="wrap_pop"><a class="pop" href="#add" rel="modal:open">단품</a></div>
			
			<div id="meat" class="modal">
				<p>세트</p>
				<a href="#" rel="modal:close"></a>
			</div>
			<div class="wrap_pop"><a class="pop" href="#meat" rel="modal:open">세트</a></div>
			
		</div>
	</div>
	<div id="length" class="modal">
		<div class="option_display">
			<dl>
				<dt>빵 길이 선택</dt>
				<dd id="breadLength">15cm</dd>
			</dl>
		</div>
		<div class="popup_content bread_leng">
			<input id="breadLengthMeta" readonly="" type="hidden" value="">
			<ul>
				<li><label class="form_circle" for="15SUB"> <input
						name="breadType" type="radio" checked="checked" id="15SUB"
						value="15SUB"> <span class="icon"></span> <em>15cm</em>

				</label></li>
				<li><label class="form_circle" for="30SUB"> <input
						name="breadType" soldout="N" id="30SUB" value="30SUB"> <span
						class="icon"></span> <em>30cm</em>
				</label></li>
			</ul>
		</div>
	</div>
</body>
</html>