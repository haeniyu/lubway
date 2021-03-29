<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
$(function() {
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
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<!-- container s -->
	<div class="bg_gray" id="container">
		<input id="ordNo" name="ordNo" type="hidden" value="ORD20210308173004584278" />
		<!-- sub content -->
		<div class="order my_order_wrap" id="content">
			<h2 class="subTitle">주문 내역 상세</h2>
			
			<!-- FAST-SUB 주문내역상세 -->
			<div class="bill_order">
				<div class="order_con">
					<div class="order_number fast_sub"> <!-- fast/home 에 따라 색 달라짐 -->
						<dl>
							<dt>주문번호 :</dt>
							<dd>ORD20210308173004584278</dd>
						</dl>
					</div>

					<!-- 픽업매장 -->
					<section class="form_box">
						<h3>픽업 매장</h3>
						<div class="write_info_wrap">
							<div class="input_set">
								<dl class="shop info_dl">
									<dt>종로삼일대로점</dt>
									<dd>서울특별시 종로구 삼일대로 391</dd>
								</dl>
							</div>
							<div class="input_set">
								<dl class="info_dl">
									<dt>방문포장/매장식사</dt>
									<dd>매장식사</dd>
								</dl>
							</div>
							<div class="input_set">
								<dl class="info_dl">
									<dt>전화번호</dt>
									<dd>01068075447</dd>
								</dl>
							</div>
						</div>
					</section>
					<!--// 픽업매장 -->

					<!-- 주문내역 -->
					<section class="form_box">
						<h3>주문내역</h3>
						<hr class="Tborder">
						<div class="board_list_wrapper">
							<div class="content">
								<!-- 1세트 (메뉴 여러개 선택시 이부분 반복됨) -->
								<div class="history_table">
									<!-- 선택한 메뉴 -->
									<ul>
										<li>
											<div class="selectMenu">
												<div class="name" data-target="mainItem">
													<!-- 선택한 메뉴 이름 -->
													<strong>로스트 치킨</strong>
													<p>${step01Text}</p>
												</div>
												<div class="count">
													<strong class="qty">${quantity }</strong>개
												</div>
												<div class="sum">
													<span>
														<strong class="price">${totalPrice}</strong><em>원</em>
													</span>
													<!-- 추가 선택 메뉴 있을경우 생김 -->
													<a class="arrow"></a>
												</div>
											</div>
											<!-- 추가 선택 메뉴 있을경우 보임-->
											<div class="addMenu">
												<ul>
													<li>
														<div class="addname">
															<strong>모차렐라치즈</strong>
														</div>
														<div class="addcount"></div>
														<div class="addsum">
															<span>
																<strong>1,800</strong><em>원</em>
															</span>
														</div>
													</li>
													<!-- 세트 추가했을 경우 보임 -->
													<li>
														<div class="setname">
															<strong>세트추가</strong>
															<p>
																${step03Text }
															</p>
														</div>
														<div class="setcount"></div>
														<div class="setsum">
															<span>
																<strong>1,900</strong><em>원</em>
															</span>
														</div>
													</li>
												</ul>
											</div>
										</li>
									</ul>
								</div>
							<!--// 1세트 -->
							</div>
						</div>
					</section>
					<!--// 주문내역 -->

					<!-- 주문금액 -->
					<section class="amount">
						<h3>총 주문 금액</h3>
						<dl class="order_sum">
							<dt>총 주문 금액</dt>
							<dd>
								<strong>36,500</strong> 원
							</dd>
						</dl>
						<dl class="detail_sum">
							<dt>주문 제품 수</dt>
							<dd>
								<span>5</span>개
							</dd>

							<dt>써브카드 사용</dt>
							<dd>
								<strong>0</strong>원
							</dd>
							<dt>쿠폰 할인</dt>
							<dd>
								<strong>0</strong>원
							</dd>
							<dt>포인트 사용</dt>
							<dd>
								<strong>0</strong>원
							</dd>
						</dl>
						<dl class="payment_sum">
							<dt>잔여 결제금액</dt>
							<dd>
								<strong>36,500</strong><span>원</span>
							</dd>
						</dl>
						<!-- 적립예정 포인트란 제거
						<dl class="order_sum">
							<dt>포인트 적립</dt>
							<dd><strong>2,900</strong>P</dd>
						</dl>
						 -->
					</section>
					<!--// 주문금액 -->

					<!-- 결제정보 -->
					<section class="payment">
						<h3>결제정보</h3>
						<dl>
							<dt>결제방법</dt>
							<dd>페이코 &amp; 카카오</dd>
						</dl>
						<dl>
							<dt>결제일시</dt>
							<dd>
								<span class="font_sw">2021.03.08 오후 17:31:39</span>
							</dd>
						</dl>
						<dl>
							<dt>결제금액</dt>
							<dd>
								<span class="font_sw">36,500</span>원
							</dd>
						</dl>

					</section>
					<!--// 결제정보 -->
				</div>
				<div class="btn_area">
					<a class="btn bgc_point" href="/mypage/order" style="width: 170px;"><span>주문목록</span></a>
				</div>
			</div>
			<!--// FAST-SUB 주문내역상세 -->
		</div>
		<!--// sub content -->
	</div>
	
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>