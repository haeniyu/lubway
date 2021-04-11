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
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	$(window).load(function(){
	    $(".loading").fadeOut();
	});
	
	var selected = '${select}'
	if(selected != "") $('#ordType').val(selected);
	
	$('#ordType').on('change', function(){
		$('.loading').show();
		var select = $('#ordType').val();
		
		var form = document.createElement("form");

		form.setAttribute("method", "post");
		form.setAttribute("action", "orderListTab.do");

		var input_select = document.createElement("input");
		input_select.setAttribute("type", "hidden");
		input_select.setAttribute("name", "select");
		input_select.setAttribute("value", select);

		form.appendChild(input_select);
		document.body.appendChild(form);
		form.submit();
	});
	
});//end of document ready

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, select) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/orderListTab.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&select=" + select;
		location.href = url;
	}
	
	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, select) {
		var url = "${pageContext.request.contextPath}/orderListTab.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&select=" + select;
		location.href = url;
	}
	
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize, select) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/orderListTab.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&select=" + select;
		location.href = url;
	}
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
	<!-- container s -->
	<div class="bg_gray" id="container">
		<!-- sub content s -->
		<div id="content">
			<!-- My-sub > 주문내역 -->
			<div class="order_wrapper">
				<h2 class="subTitle" style="padding-top: 80px">최근 주문 내역</h2>
				<p class="tit_sub_copy">
					최근 6개월 이내 고객님의 주문내역입니다.<br />주문 내역을 Tab하시면 상세조회를 할 수 있습니다.
				</p>
				<!-- 주문내역 데이터 있을 시 노출 -->
				<c:if test="${countOrder > 0 }">
					<div class="order_box">
						<div class="search_order">
							<span>주문내역</span>
							<div class="form_select" style="width: 356px;">
								<input name="pageNo" type="hidden" value="1" /> 
								<select id="ordType" name="ordType">
									<option value="">전체주문</option>
									<option value="fastway">FAST-WAY</option>
									<option value="homeway">HOME-WAY</option>
								</select>
							</div>
						</div>
						<div class="order_list">
							<div class="order_listTit">
								<h3>주문내역 전체보기</h3>
							</div>
							<ul>
								<!-- 1세트 -->
								<c:forEach items="${order}" var="order">
								<li>
									<div class="order_card">
										<a href="/orderListDetail.do?no=${order.no }">
											<c:if test="${order.order_type ne '배달'}">
												<p class="order_type fast">
													FAST-WAY
												</p>
											</c:if>
											<c:if test="${order.order_type eq '배달'}">
												<p class="order_type home">
													HOME-WAY
												</p>
											</c:if>
											<div class="order_menu">
												<p>
													<span class="menu">${order.store_name }점</span>
													<span class="date"><fmt:formatDate value="${order.order_time }" pattern="yyyy-MM-dd HH:mm:ss" /></span> 
													<span class="price"><span><fmt:formatNumber value="${order.finalPrice }" pattern="#,###" /></span><em>원</em></span> 
													<span class="num">주문번호  ( <em>${order.no }</em> )</span>
													<span class="status">${order.status }</span>
												</p>
											</div>
										</a>
									</div>
								</li>
								</c:forEach>
								<!--// 1세트 -->
							</ul>
						</div>
					<!-- board 페이지 -->
					<div>
						<div class="pagination" >
						<ul class="UserPagination">
							<c:if test="${pagination.prev}">
								<a class="arr prev" href="javascript:void(0);"
									onClick="fn_prev('${pagination.page}','${pagination.range}','${pagination.rangeSize}','${select }')"></a></li>
							</c:if>
		
							<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx" >
								<c:if test="${pagination.page eq idx}">
									<li class="page-item">
										<a class="page-link active" href="#" onClick="fn_pagination('${idx}','${pagination.range}','${pagination.rangeSize}','${select }')"> ${idx} </a>
									</li>
								</c:if>
								<c:if test="${pagination.page ne idx}">
									<li class="page-item">
										<a class="page-link" href="#" onClick="fn_pagination('${idx}','${pagination.range}','${pagination.rangeSize}','${select }')"> ${idx} </a>
									</li>
								</c:if>
							</c:forEach>
		
							<c:if test="${pagination.next}">
								<li class="page-item"><a class="arr next" href="javascript:void(0);"
									onClick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}','${select }')"></a></li>
							</c:if>
						</ul>
		
						</div>
					</div>
					<!--// board 페이지 -->
					</div>
				</c:if>
				<!--// 주문내역 데이터 있을 시 노출 -->
				
				<!-- 주문내역 데이터 없을 시 노출 -->
				<c:if test="${countOrder == 0 }">
					<div class="data_none">
						<p>최근 주문 내역이 없습니다.</p>
					</div>
				</c:if>
				<!--// 주문내역 데이터 없을 시 노출 -->
			</div>
			<!--// My-sub > 주문내역 -->
		</div>
	</div>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>