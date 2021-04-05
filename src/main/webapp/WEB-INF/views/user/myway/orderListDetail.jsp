<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY-WAY > 주문내역</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
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
	
	var way = '${orderC.order_type}';
	if(way == '배달'){
		$(".order_number").addClass('home_sub');
		$(".order)number").removeClass('fast_sub');
	}else{
		$(".order_number").addClass('fast_sub');
		$(".order)number").removeClass('home_sub');
	}
	
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<!-- container s -->
	<div class="bg_gray" id="container">
		<input id="ordNo" name="ordNo" type="hidden" value="${orderC.no }" />
		<!-- sub content -->
		<div class="order my_order_wrap" id="content">
			<h2 class="subTitle">주문 내역 상세</h2>
			
			<!-- FAST-SUB 주문내역상세 -->
			<div class="bill_order">
				<div class="order_con">
					<div class="order_number fast_sub"> <!-- fast/home 에 따라 색 달라짐 -->
						<dl>
							<dt>주문번호 :</dt>
							<dd>${orderC.no }</dd>
						</dl>
					</div>

					<!-- fastway -->
					<c:if test="${orderC.order_type ne '배달' }">
						<section class="form_box">
							<h3>픽업 매장</h3>
							<div class="write_info_wrap">
								<div class="input_set">
									<dl class="shop info_dl">
										<dt>${orderC.store_name}</dt>
										<dd>${storeAddr }</dd>
									</dl>
								</div>
								<div class="input_set">
									<dl class="info_dl">
										<dt>방문포장/매장식사</dt>
										<dd>${orderC.order_type }</dd>
									</dl>
								</div>
								<div class="input_set">
									<dl class="info_dl">
										<dt>전화번호</dt>
										<dd>${orderC.tel }</dd>
									</dl>
								</div>
							</div>
						</section>
					</c:if>
					<!--// fastway -->
					
					<!-- homeway -->
					<c:if test="${orderC.order_type eq '배달' }">
						<section class="form_box">
							<h3>픽업 매장</h3>
							<div class="write_info_wrap">
								<div class="input_set">
									<dl class="shop info_dl">
										<dt>배달 주소</dt>
										<dd>${orderC.address}</dd>
									</dl>
								</div>
								<div class="input_set">
									<dl class="info_dl">
										<dt>주문 매장</dt>
										<dd>${orderC.store_name }</dd>
									</dl>
								</div>
								<div class="input_set">
									<dl class="info_dl">
										<dt>전화번호</dt>
										<dd>${orderC.tel}</dd>
									</dl>
								</div>
							</div>
						</section>
					</c:if>
					<!--// homeway -->

					<!-- 주문내역 -->
					<section class="form_box">
						<h3>주문내역</h3>
						<hr class="Tborder">
						<div class="board_list_wrapper">
							<div class="content">
								<!-- 1세트 (메뉴 여러개 선택시 이부분 반복됨) -->
								<c:set var="endCount" value="0" />
								<c:forEach items="${orderL }" var="order">
									<div class="history_table">
										<!-- 선택한 메뉴 -->
										<ul>
											<li>
												<div class="selectMenu">
													<div class="name" data-target="mainItem">
														<!-- 선택한 메뉴 이름 -->
														<strong>${order.menu_name }</strong>
														<p>${order.step01}</p>
													</div>
													<div class="count">
														<strong class="qty">${order.quantity }</strong>개
													</div>
													<div class="sum">
														<span>
															<strong class="price"><fmt:formatNumber value="${order.menu_price}" pattern="#,###" /></strong><em>원</em>
														</span>
														<!-- 추가 선택 메뉴 있을경우 생김 -->
														<c:if test="${order.add_topping ne null  || order.add_meat ne null || order.add_cheese ne null || order.step03 ne null}">
														<a class="arrow"></a>
														</c:if>
													</div>
												</div>
												<!-- 추가 선택 메뉴 있을경우 보임-->
												<div class="addMenu">
													<ul>
														<c:if test="${order.add_topping ne null}">
															<c:set var="count" value="${order.count }" />
															<c:forEach items="${price }" var="getPrice" varStatus="var" begin="${endCount }" end="${endCount + count}">
																<li>
																	<div class="addname">
																		<strong>${getPrice.name }</strong>
																	</div>
																	<div class="addcount"></div>
																	<div class="addsum">
																		<span>
																			<strong>${getPrice.topping_price }</strong><em>원</em>
																		</span>
																	</div>
																</li>
															</c:forEach>
															<c:set var="endCount" value="${endCount + count }" />
														</c:if>
														<!-- 미트 추가 시  -->
														<c:if test="${order.add_meat ne null}">
															<li>
																<div class="addname">
																	<strong>${order.add_meat }</strong>
																</div>
																<div class="addcount"></div>
																<div class="addsum">
																	<span>
																		<strong>1,800</strong><em>원</em>
																	</span>
																</div>
															</li>
														</c:if>
														<!-- 치즈 추가 시 -->
														<c:if test="${order.add_cheese ne null}">
															<li>
																<div class="addname">
																	<strong>${order.add_cheese }</strong>
																</div>
																<div class="addcount"></div>
																<div class="addsum">
																	<span>
																		<strong>900</strong><em>원</em>
																	</span>
																</div>
															</li>
														</c:if>
														<!-- 세트 추가했을 경우 보임 -->
														<c:if test="${order.step03 ne null}">
															<li>
																<div class="setname">
																	<strong>세트추가</strong>
																	<p>
																		${order.step03 }
																	</p>
																</div>
																<div class="setcount"></div>
																<div class="setsum">
																	<span>
																		<strong><fmt:formatNumber value="${order.set_price }" pattern="#,###" /></strong><em>원</em>
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
					</section>
					<!--// 주문내역 -->

					<!-- 주문금액 -->
					<section class="amount">
						<h3>총 주문 금액</h3>
						<dl class="order_sum">
							<dt>총 주문 금액</dt>
							<dd>
								<strong><fmt:formatNumber value="${orderC.total_price }" pattern="#,###" /></strong> 원
							</dd>
						</dl>
						<dl class="detail_sum">
							<dt>쿠폰 할인</dt>
							<dd>
								<strong><fmt:formatNumber value="${orderC.use_coupon }" pattern="#,###" /></strong>원
							</dd>
							<dt>포인트 사용</dt>
							<dd>
								<strong><fmt:formatNumber value="${orderC.use_point }" pattern="#,###" /></strong>원
							</dd>
							<c:if test="${orderC.order_type eq '배달' }">
								<dt>배달비</dt>
								<dd><strong>+3,900원</strong></dd>	
							</c:if>
						</dl>
						<dl class="payment_sum">
							<dt>최종 결제금액</dt>
							<dd>
								<strong><fmt:formatNumber value="${orderC.finalPrice }" pattern="#,###" /></strong><span>원</span>
							</dd>
						</dl>
					</section>
					<!--// 주문금액 -->

					<!-- 결제정보 -->
					<section class="payment">
						<h3>결제정보</h3>
						<dl>
							<dt>결제방법</dt>
							<dd>${orderC.payment_list }</dd>
						</dl>
						<dl>
							<dt>결제일시</dt>
							<dd>
								<span class="font_sw"><fmt:formatDate value="${orderC.order_time }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
							</dd>
						</dl>
						<dl>
							<dt>결제금액</dt>
							<dd>
								<span class="font_sw"><fmt:formatNumber value="${orderC.finalPrice }" pattern="#,###" /></span>원
							</dd>
						</dl>

					</section>
					<!--// 결제정보 -->
				</div>
				<div class="btn_area">
					<a class="btn bgc_point" href="/lubway/orderList.do" style="width: 170px;"><span>주문목록</span></a>
				</div>
			</div>
			<!--// FAST-SUB 주문내역상세 -->
		</div>
		<!--// sub content -->
	</div>
	
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>