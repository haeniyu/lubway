<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	var way;
	if('${order.receive}' == "배달"){
		way = homeway;
		if(way == 'homeway'){
			$('.order_type').addClass('home');
			$('.order_type').removeClass('fast');
		}
	}
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<!-- container s -->
	<div class="bg_gray" id="container">
		<!-- sub content s -->
		<div id="content">
			<!-- My-sub > 주문내역 -->
			<div class="order_wrapper">
				<h2 class="subTitle">최근 주문 내역</h2>
				<p class="tit_sub_copy">
					최근 6개월 이내 고객님의 주문내역입니다.<br />주문 내역을 Tab하시면 상세조회를 할 수 있습니다.
				</p>
				<!-- 주문내역 데이터 있을 시 노출 -->
				<div class="order_box">
					<div class="search_order">
						<span>주문내역</span>
						<div class="form_select" style="width: 356px;">
							<form id="searchForm" method="get" name="searchForm" onsubmit="/mypage/order">
								<input name="pageNo" type="hidden" value="1" /> 
								<select id="ordType" name="ordType">
									<option value="">전체주문</option>
									<option value="ORD_TYPE.FAST_SUB">FAST-SUB</option>
									<option value="ORD_TYPE.HOME_SUB">HOME-SUB</option>
								</select>
							</form>
						</div>
					</div>
					<div class="order_list">
						<div class="order_listTit">
							<h3>주문내역 전체보기</h3>
						</div>
						<ul>
							<!-- 1세트 -->
							<li>
								<div class="order_card">
									<a href="/lubway/orderListDetail.do"> <!-- FAST-SUB 일 경우 class="fast", HOME-SUB 일 경우 class="home" 추가 -->
										<c:if test="${order.receive ne '배달'}">
											<p class="order_type">
												FAST-WAY
												<span>픽업완료</span>
											</p>
										</c:if>
										<c:if test="${order.receive eq '배달'}">
											<p class="order_type">
												HOME-WAY
												<span>배달완료</span>
											</p>
										</c:if>
										<div class="order_menu">
											<p>
												<span class="menu">스테이크/치즈15</span>
											</p>
										</div>
										<div class="order_detail">
											<span class="price"><span>36,500</span><em>원</em></span> 
											<span class="store">종로삼일대로점</span> 
											<span class="date">2021-03-08 17:30:00</span> 
											<span class="num">주문번호 ( <em>ORD20210308173004584278</em> ) </span>
										</div>
									</a>
								</div>
							</li>
							<!--// 1세트 -->
						</ul>
						<!-- board 페이지 -->
						<div>
							<div class="pagination">
								<a class="arr prev" href="javascript:void(0);"></a> 
								<a class="active" href="#">1</a> 
								<a class="arr next" href="javascript:void(0);"></a>
							</div>
						</div>
						<!--// board 페이지 -->
					</div>
				</div>
				<!--// 주문내역 데이터 있을 시 노출 -->

				<!-- 주문내역 데이터 없을 시 노출
				<div class="data_none">
					<p>최근 주문 내역이 없습니다.</p>
				</div> -->
				<!--// 주문내역 데이터 없을 시 노출 -->
			</div>
			<!--// My-sub > 주문내역 -->
		</div>
	</div>

<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>