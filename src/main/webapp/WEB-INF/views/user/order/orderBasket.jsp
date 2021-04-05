<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="${path}/resources/js/orderStep04.js?v=2"></script>
<head>
<meta charset="UTF-8">
<title>주문하기 > Step04</title>
<script type="text/javascript">
$(window).load(function(){
    $(".loading").fadeOut();
});

$(function() {
	$("#totalPayAmtNavi").text($("#totalPayAmtNavi").text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
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
	
	$('.history_table .selectMenu').on('click', function () {
		var spd = 0.5,
			eft = Power3.easeOut
		if ($(this).parent('li').hasClass('on')) {
			$(this).parent('li').removeClass('on');
			TweenLite.to($(this).next('.addMenu'), spd, { ease: eft, height: 0 })
		} else {
			$(this).parent('li').addClass('on');
			var h = $(this).next('.addMenu').find('ul').innerHeight();
			TweenLite.to($(this).next('.addMenu'), spd, { ease: eft, height: h })
		}
	})
});
var pay = "PAY_METHOD.CASH";
var pickUp = "방문포장";
$(function() {
	$("input:radio[name=payment]").click(function(){
		var temp = $(this).val();
		console.log("temp:" + temp);
		pay = temp;
	})
	$("input:radio[name=paveFg]").click(function(){
	var pick = $(this).val();
	console.log(pick);
	if(pick == "Y"){
		pickUp = "방문포장"
	}
	if(pick == "N"){
		pickUp = "매장식사"
	}
	console.log(pickUp);
})
	$("#startOrder").click(function (){
		
		if($("#paymentAgree").is(":checked") == false) {
			alert("구매조건 및 결제동의를 해주세요."); 
			return;
		}
		
		var phoneNum = $('#phoneNum').val().trim();
		var checkNum = /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;

		if (phoneNum == null || phoneNum == '') {
			alert("핸드폰 번호를 입력해주세요.");
			$("#phoneNum").focus();
			check = false;
			return false;
		}
		if (!checkNum.test(phoneNum)) {
			alert("핸드폰 번호가 올바르지 않습니다.");
			$("#phoneNum").focus();
			check = false;
			return false;
		}
		
		var lastcost = $('#totalPayAmtNavi').text();
		console.log(lastcost);
		if(pay == "PAY_METHOD.PAYCOKAKAO"){
			IMP.init('imp80143812');
			IMP.request_pay({
			    pg : 'kakaopay',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : 'LUBWAY 결제 시스템',
			    amount : lastcost,
			    buyer_email : '${user.id}',
			    buyer_name : '${user.name}',
			    buyer_tel : '${user.tel}'
			}, function(rsp) {
			    if ( rsp.success ) {
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
			    		type: 'POST',
			    		dataType: 'json',
			    		data: {
				    		imp_uid : rsp.imp_uid
				    		//기타 필요한 데이터가 있으면 추가 전달
			    		}
			    	}).done(function(data) {
			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			    		if ( everythings_fine ) {
			    			var msg = '결제가 완료되었습니다.';
			    			msg += '\n고유ID : ' + rsp.imp_uid;
			    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			    			msg += '\결제 금액 : ' + rsp.paid_amount;
			    			msg += '카드 승인번호 : ' + rsp.apply_num;
			    			
			    			alert(msg);
			    		} else {
			    			//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			    		}
			    	});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        
			        alert(msg);
			    }
			});
		}else if(pay == "PAY_METHOD.CASH"){
			
			gotoOrderList();
		}
	});	
}); //end of pay function

function gotoOrderList() {
	$('.loading').show();
	
	var totalPrice = $("#orderTotal").text();//총 가격
	$("#totalPrice").val(totalPrice);
	
	var coupon = $("#couponAmtNavi").text();
	$("#coupon").val(coupon);
	
	var point = $("#pointAmtNavi").text();
	$("#point").val(point);
	
	var request = $("#ordMemoContent").val();
	$("#request").val(request);
	
	// 결제 수단
	var payment = pay;
	var payment_status;
	
	if(payment == "PAY_METHOD.CASH"){
		payment = "현금";
		payment_status = false;
		
	}else if(payment == "PAY_METHOD.PAYCOKAKAO"){
		payment = "카카오페이";
		payment_status = true;
	}else{
		payment = "신용카드";
		payment_status = true;
	}
	$("#payment").val(payment);
	$("#payment_status").val(payment_status);
	
	// 수령 방법
	var way = '${whatWay}';
	var temp = "";
	
	if(way == "Home-Way"){
		temp = "배달";
		$("#order_type").val(temp);
	}else{
		$("#order_type").val(pickUp);
		console.log("픽업 선택 : " + pickUp);
	}
	
	var menu_type = $("#menuType").val();
	$("#menu_type").val(menu_type);
	
	var tel = $("#phoneNum").val();
	$("#tel").val(tel);
	
	var addr = $("#addr").text();
	$("#fullAddr").val(addr);
	
	var restPrice = $('#totalPayAmtNavi').text()
	$("#restPrice").val(restPrice);
	
	$("#orderForm").submit();
	
}
window.history.forward(0);
</script>
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
	<div class="content">
		<!-- container s -->
		<div id="container">
			<!-- sub content -->
			<div class="order" id="content">
				<!-- 주문하기 -->
				<div class="bill_order">
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
					<div class="order_con">
						<!-- 결제폼 -->
						<section class="form_box">
							<!-- 픽업매장 -->
							<c:if test="${whatWay eq 'Fast-Way' }">
								<h2>픽업매장</h2>
							</c:if>
						<section class="form_box">
							<!-- 배달매장 -->
							<c:if test="${whatWay eq 'Home-Way' }">
								<h2>배달정보</h2>	
							</c:if>
							<div class="write_info_wrap stroe_order">
								<div class="input_set">
									<!-- fastway 픽업 매장 주소 -->
									<c:if test="${whatWay eq 'Fast-Way' }">
										<dl class="info_dl">
											<dt>${store.storename}</dt>
											<dd>${store.address_road }</dd>
										</dl>
									</c:if>
									<!-- homeway 배달 받을 주소 -->
									<c:if test="${whatWay eq 'Home-Way' }">
										<dl class="info_dl">
											<dt>주소</dt>
											<dd id="addr">${user_address }</dd>
										</dl>
									</c:if>
								</div>
								<!-- fastway 매장식사 / 픽업 여부 선택 -->
								<c:if test="${whatWay eq 'Fast-Way' }">
									<div class="input_set">
										<dl class="a_order">
											<dt>방문포장/매장식사</dt>
											<dd>
												<div class="choice_wrap">
													<!-- radio -->
													<label class="form_circle" for="r2"> <input
														checked="checked" id="r2" name="paveFg" type="radio"
														value="Y" /> <span class="icon"></span> <em>방문포장</em>
													</label> <label class="form_circle" for="r1"> <input id="r1"
														name="paveFg" type="radio" value="N" /> <span class="icon"></span>
														<em>매장식사</em>
													</label>
													<!--// radio -->
												</div>
											</dd>
										</dl>
									</div>
								</c:if>
								<!-- homeway 주문한 매장 -->
								<c:if test="${whatWay eq 'Home-Way' }">
									<div class="input_set">
										<dl class="a_order">
											<dt>배달 매장</dt>
											<dd>
												${store.storename }
											</dd>
										</dl>
									</div>
								</c:if>
								<!-- fast/home 공통 부분 -->
								<div class="input_set">
									<dl class="">
										<dt>전화번호</dt>
										<dd>
											<span class="form_text"> 
												<input maxlength="11" id="phoneNum" placeholder="전화번호를 입력하세요" type="text" value="${user.tel }" />
											</span>
										</dd>
									</dl>
								</div>
								<div class="input_set">
									<dl class="">
										<dt>주문시, 요청사항</dt>
										<dd>
											<span class="form_text"> <input maxlength="50"
												name="ordMemoContent" placeholder="주문시 요청사항을 입력하세요"
												type="text" />
											</span>
										</dd>
									</dl>
								</div>
							</div>
							<!--// 매장 정보 및 배달정보 -->

							<!-- 할인방법 -->
							<h2 style="margin-top:70px">할인 방법 선택</h2>
							<div class="write_info_wrap">
								<!-- 쿠폰 사용 -->
								<div class="input_set">
									<dl>
										<dt>쿠폰 사용</dt>
										<dd>
											<div class="form_select" style="width: 670px;">
												<select name="couponSelection" id="couponSelection">
													<option>사용가능 쿠폰 ${countCoupon}장</option>
														<c:forEach items="${couponList }" var="coupon">
															<option value="${coupon.discount },${coupon.code}">${coupon.name } ${coupon.discount }%( <fmt:formatDate value="${coupon.regdate }"
														pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${coupon.enddate }"
														pattern="yyyy-MM-dd" /> )
														</option>
														</c:forEach>
												</select>
											</div> 
											<div class="btn_input_in">
												<a class="in_form_btn" href="javascript:void(0);" id="couponApply"><span>쿠폰 사용</span></a>
											</div>
										</dd>
									</dl>
								</div>
								<!-- 포인트 사용 -->
								<div class="input_set">
									<dl>
										<dt>포인트 사용</dt>
										<dd>
											<div class="use_point">
												<span class="form_text bdr_text"> 
												<input id="pointAmt" name="pointAmt" placeholder="사용금액 입력" type="text" value="" />
												</span>
												<p>
													<span>보유 포인트 :</span> 
													<strong id="usablePoint">${user.point }</strong>
												</p>
											</div>
											<div class="btn_input_in">
												<a class="in_form_btn" href="javascript:void(0);" id="useAllPoint">
												<span>모두 사용</span>
												</a>
											</div>
										</dd>
									</dl>
									<p class="counsel_copy">프로모션 상품은 타 할인 행사 및 쿠폰으로 중복 할인되지 않습니다.</p>
								</div>
							</div>
							<!--// 할인방법 -->

							<!-- 결제수단 -->
							<h2>결제 수단 선택</h2>
							<div class="write_info_wrap">
								<div class="input_set">
									<dl>
										<dt>신용카드 결제</dt>
										<dd>
											<div class="form_radio square">
												<label> 
													<input checked="checked" id="cash" name="payment" type="radio" value="PAY_METHOD.CASH" /> 
													<span class="shape">현금</span>
												</label> 
												<label> 
													<input id="creditcard" name="payment" type="radio" value="PAY_METHOD.CRDT" /> 
													<span class="shape">신용카드</span>
												</label> 
												<label> 
													<input id="kakao" name="payment" type="radio" value="PAY_METHOD.PAYCOKAKAO"/> 
													<span class="shape">
														<i class="pay_logo"><img alt="카카오페이" src="https://lubway.s3.ap-northeast-2.amazonaws.com/icon_kakaopay.png" /></i>
													</span>
												</label>
											</div>
										</dd>
									</dl>
								</div>
							</div>
							<!--// 결제수단 -->
						</section>
						</section>
						<!--// 결제폼 -->

						<!-- 주문내역 -->
						<div class="board_list_wrapper">
							<h2>주문내역</h2>
							<hr class="Tborder">
							<div class="content">
								<!-- 1세트 (메뉴 여러개 선택시 이부분 반복됨) -->
								<c:set var="endCount" value="0" />
								<c:forEach items="${basket}" var="basket" varStatus="stat">
								<div class="history_table">
									<!-- 선택한 메뉴 -->
									<ul>
										<li>
											<div class="selectMenu">
												<div class="name" data-target="mainItem">
													<!-- 선택한 메뉴 이름 -->
													<strong>${basket.menu_name }</strong>
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
													</div>
												<div class="count" >
													<strong class="qty">${basket.quantity }</strong>개
												</div>
												<div class="sum" >
													<span> <strong class="price${stat.count }">${basket.total_price}</strong><em>원</em>
													</span>
													<!-- 추가 선택 메뉴 있을경우 생김 -->
													<c:if test="${basket.add_meat ne null or basket.add_cheese ne null or basket.add_topping ne null or basket.set_name ne null}">
													<a class="arrow"></a>
													</c:if>
												</div>
												
											</div> <!-- 추가 선택 메뉴 있을경우 보임-->
											<div class="addMenu">
												<ul>
													<c:if test="${basket.add_topping ne null}">
														<c:set var="count" value="${basket.count}" />
														<c:forEach items="${price}" var="getPrice" varStatus="var" begin="${endCount}" end="${endCount + count - 1}">
															<li>
																<div class="addname">
																	<strong>${getPrice.name }</strong>
																</div>
																<div class="addcount"></div>
																<div class="addsum">
																	<span> <strong>${getPrice.topping_price }</strong><em>원</em>
																	</span>
																</div>
															</li>
														</c:forEach>
														<c:set var="endCount" value="${endCount + count}" />
													</c:if>
													<!-- 미트 추가 시  -->
													<c:if test="${basket.add_meat.length() gt 0 }">
														<li>
															<div class="addname">
																<strong>${basket.add_meat }</strong>
															</div>
															<div class="addcount"></div>
															<div class="addsum">
																<span> <strong>1,800</strong><em>원</em>
																</span>
															</div>
														</li>
													</c:if>
													<!-- 치즈 추가 시 -->
													<c:if test="${basket.add_cheese.length() gt 0 }">
														<li>
															<div class="addname">
																<strong>${basket.add_cheese }</strong>
															</div>
															<div class="addcount"></div>
															<div class="addsum">
																<span> <strong>900</strong><em>원</em>
																</span>
															</div>
														</li>
													</c:if>

													<!-- 세트 추가 시 -->
													<c:if test="${basket.set_name.length() gt 0 }">
														<li>
															<div class="setname">
																<strong>세트추가</strong>
																<p>${basket.set_name }</p>
															</div>
															<div class="setcount"></div>
															<div class="setsum">
																<span> <strong>${basket.set_price }</strong><em>원</em>
																</span>
															</div>
														</li>
													</c:if>
												</ul>
											</div>
										</li>
									</ul>
								</div>
								</c:forEach>
								<!--// 1세트 -->
							</div>
						</div>
						<!--// 주문내역 -->

						<!-- 결제금액 -->
					<div class="amount">
						<h2>총 결제 금액</h2>
						
						<dl class="order_sum">
							<dt>총 주문 금액</dt>
							<dd>
								<strong id="orderTotal">${ttl }</strong>
								원
							</dd>
						</dl>
						<dl class="detail_sum">
							<dt>쿠폰 사용</dt>
							<dd><strong id="couponAmtNavi">0</strong>원</dd>
							<dt>포인트 사용 </dt>
							<dd><strong id="pointAmtNavi">0</strong>원</dd>
							<c:if test="${whatWay eq 'Home-Way' }">
								<dt>배달비</dt>
								<dd><strong>+3,900원</strong></dd>	
							</c:if>
						</dl>
						<dl class="payment_sum">
							<dt>잔여 결제금액 </dt>
							<dd><strong id="totalPayAmtNavi">${ttl}</strong><span>원</span></dd>
						</dl>
						<div class="payment_agree">
							<dl>
								<dt>
									<label class="form_checkbox">
										<input id="paymentAgree" type="checkbox" value="Y" />
										<span class="icon"></span><strong>구매조건 및 결제진행 동의</strong>
									</label>
								</dt>
								<dd>
									<ul>
										<li class="counsel_copy">주문할 메뉴와 가격, 매장정보를 명확히 확인하였으며 결제 진행에 동의합니다.</li>
										<li class="counsel_copy">제조시간은 매장상황에 따라 상이할 수 있습니다.</li>
										<li class="counsel_copy on">주문 후 제조가 시작되면 주문을 취소할 수 없습니다.</li>
									</ul>
								</dd>
							</dl>
						</div>
						<div class="btn_area">
							<a class="btn bgc_point i_reg" href="javascript:void(0);" id="startOrder"><span>결제하기</span></a>
						</div>
					</div>
					<!--// 결제금액 -->
					</div>
				</div>
				<!--// 주문하기 -->
			</div>
			<!--// sub content -->
		</div>
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
<!-- 주문 완료 결제 페이지 이동 -->
<form action="orderStep05Basket.do" method="post" id="orderForm" style="display: none;">
	<input type="hidden" id="totalPrice" name="totalPrice" value="">
	<input type="hidden" id="coupon" name="coupon" value="">
	<input type="hidden" id="point" name="point" value="">
	<input type="hidden" id="request" name="request" value="">
	<input type="hidden" id="order_type" name="order_type" value="">
	<input type="hidden" id="payment" name="payment" value="">
	<input type="hidden" id="payment_status" name="payment_status" value="">
	<input type="hidden" id="basketNo" name="basketNo" value="${basketNo }">
	<input type="hidden" id="tel" name="tel" value="">
	<input type="hidden" id="storeName" name="storeName" value="${store.storename }">
	<input type="hidden" id="fullAddr" name="fullAddr" value="">
	<input type="hidden" id="restPrice" name="restPrice" value="">
	<input type="hidden" id="couponCode" name="couponCode" value="">
	<input type="hidden" id="whatWay" name="whatWay" value="${whatWay }">
</form> 
</body>
</html>