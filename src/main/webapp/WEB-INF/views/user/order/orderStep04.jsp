<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<head>
<meta charset="UTF-8">
<title>주문하기 > Step04</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$('.arrow').on('click', function () {
		$(".addMenu").addClass("on").show();
		
	})
});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<div class="content">
		<!-- container s -->
		<div id="container">
			<!-- sub content -->
			<div class="order fast_sub" id="content">
				<!-- 주문하기 -->
				<div class="bill_order">
					<div class="order_title">
						<h3>Fast-Sub</h3>
						<p class="step04p">온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</p>
					</div>
					<div class="order_con">
						<!-- 결제폼 -->
						<section class="form_box">
							<!-- 픽업매장 -->
							<h2>픽업매장</h2>
						<section class="form_box">
							<!-- 픽업매장 -->
							<h2>배달정보</h2>	
							<div class="write_info_wrap stroe_order">
								<div class="input_set">
									<!-- fastway 픽업 매장 주소 -->
									<dl class="info_dl">
										<dt>종로삼일대로</dt>
										<dd>서울특별시 종로구 삼일대로 391</dd>
									</dl>
									<!-- homeway 배달 받을 주소 -->
									<dl class="info_dl">
										<dt>주소</dt>
										<dd>서울특별시 종로구 삼일대로 391</dd>
									</dl>
								</div>
								<!-- fastway 매장식사 / 픽업 여부 선택 -->
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
								<!-- homeway 주문한 매장 -->
								<div class="input_set">
									<dl class="a_order">
										<dt>배달 매장</dt>
										<dd>
											상수역
										</dd>
									</dl>
								</div>
								<!-- fast/home 공통 부분 -->
								<div class="input_set">
									<dl class="">
										<dt>전화번호</dt>
										<dd>
											<span class="form_text"> <input maxlength="11"
												name="ordHp" placeholder="전화번호를 입력하세요" type="text"
												value="01036582924" />
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
								<!-- homeway 배달시 요청사항 -->
								<div class="input_set">
									<dl class="a_order">
										<dt>배달시,요청사항</dt>
										<dd>
											<span class="form_text"> <input maxlength="50"
												name="ordMemoContent" placeholder="배달시 요청사항을 입력하세요"
												type="text" />
											</span>
										</dd>
									</dl>
								</div>
								<!-- fast/home 공통 부분 -->
								<div class="input_set">
									<dl class="a_order">
										<dt>일회용품</dt>
										<dd>
											<div class="choice_wrap">
												<label class="form_checkbox dispos"> 
													<input name="disposableFg" type="checkbox" value="Y" /> 
													<span class="icon"></span>
													<p>일회용품(스푼, 포크 등)을 사용하지 않겠습니다.</p>
												</label>
											</div>
										</dd>
									</dl>
								</div>
							</div>
							<!--// 픽업매장 -->

							<!-- 할인방법 -->
							<h2>할인 방법 선택</h2>
							<div class="write_info_wrap">
								<!-- 쿠폰 사용 -->
								<input name="voucher" type="hidden" /> <input id="voucherAmt"
									type="hidden" /> <input name="couponItemCode" type="hidden" />
								<input name="couponItemIndex" type="hidden" /> <input
									id="couponAmt" name="couponAmt" type="hidden" />
								<div class="input_set">
									<dl>
										<dt>쿠폰 사용</dt>
										<dd>
											<div class="form_select" style="width: 670px;">
												<select name="couponCode">
													<option value="">보유하신 쿠폰이 없습니다.</option>
												</select>
											</div>
											<div class="btn_input_in">
												<a class="in_form_btn" href="javascript:void(0);"
													id="couponApply"><span>쿠폰 사용</span></a>
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
												<input id="pointAmt" name="pointAmt" placeholder="사용금액 입력" type="text" value="0" />
												</span>
												<p>
													<span>보유 포인트 :</span> 
													<strong id="usablePoint" data-point="0">0</strong>
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
													<input checked="checked" id="creditcard" name="payment" type="radio" value="PAY_METHOD.CRDT" /> 
													<span class="shape">신용카드</span>
												</label> 
												<label> 
													<input id="etc" name="payment" type="radio" value="PAY_METHOD.PAYCOKAKAO" /> 
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
							<div class="history_table">
								<!-- 선택한 메뉴 -->
								<div class="name" data-target="mainItem">
									<!-- 선택한 메뉴 이름 -->
									<strong>로스트 치킨</strong>
									<p>
									<!-- 선택한 메뉴들 받는 부분 -->
										<!-- 빵길이 -->
										30cm, 
										<!-- 빵종류 -->
										파마산 오레가노(토스팅), 
										<!-- 치즈 -->
										아메리칸치즈, 
										<!-- 야채 -->
										양상추, 
										<!-- 소스 -->
										레드와인식초
									</p>
								</div>
								<div class="count">
									<strong class="qty" data-qty="1">1</strong>개
								</div>
								<div class="sum">
									<span>
										<strong class="price" data-price="22,200">22,200</strong><em>원</em>
									</span>
									<!-- 추가 선택 메뉴 있을경우 생김 -->
									<a class="arrow"></a>
								</div>
								<!-- 추가 선택 메뉴 있을경우 보임-->
								<div class="addMenu">
									<div class="addname">
										<strong>모차렐라치즈</strong>
									</div>
									<div class="addcount"></div>
									<div class="addsum">
										<span>
											<strong>1,800</strong><em>원</em>
										</span>
									</div>
									<!-- 세트 추가했을 경우 보임 -->
									<div class="setname">
										<strong>세트추가</strong>
										<p>
											초코칩 쿠키,탄산음료 16oz
										</p>
									</div>
									<div class="setcount"></div>
									<div class="setsum">
										<span>
											<strong>1,900</strong><em>원</em>
										</span>
									</div>
								</div>
							</div>
							<!--// 1세트 -->
						</div>
						
					</div>	
					<!--// 주문내역 -->

						<!-- 결제금액 -->
					<div class="amount">
						<input id="totalOrdAmt" type="hidden" value="22200" />
						<input id="ordAmt" type="hidden" value="22200" />
						<input id="delvAmt" type="hidden" value="" />
						<input name="totalPayAmt" type="hidden" value="22200" />
						
						<input id="orderType" type="hidden" value="ORD_TYPE.FAST_SUB" />
						<input id="ordSheetNo" type="hidden" value="1106733" />
						<h2>총 결제 금액</h2>
						
						<dl class="order_sum">
							<dt>총 주문 금액</dt>
							<dd>
								<strong id="orderTotal">22,200</strong>
								원
							</dd>
						</dl>
						<dl class="detail_sum">
							<dt>쿠폰 사용</dt>
							<dd><strong id="couponAmtNavi">0</strong>원</dd>
							<dt>포인트 사용 </dt>
							<dd><strong id="pointAmtNavi">0</strong>원</dd>
							
						</dl>
						<dl class="payment_sum">
							<dt>잔여 결제금액 </dt>
							<dd><strong id="totalPayAmtNavi">22,200</strong><span>원</span></dd>
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
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>