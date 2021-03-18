<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Coupon</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/step01.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<!-- sub content s -->
	<div id="content">
		<!-- Mysub > 쿠폰 -->
		<div class="coupon_wrapper">
			<h2 class="subTitle">사용가능쿠폰</h2>
			<div class="coupon_content_wrap">
				<div class="coupon_area">

					<!-- 쿠폰내역 -->
					<div class="coupon_list">
					
						<!--<div class="list_top" style="display: none">
									<p>현재 보유 쿠폰 (<span th:text="${count}"></span>)</p>
									<span>최근 12개월</span>
								</div>-->
						<!--삭제-->
						<ul>

						</ul>
					</div>
					<!--// 쿠폰내역 -->

					<!-- 쿠폰 내역이 없을 경우 노출 -->
					<div class="data_none">
						<p>보유중인 쿠폰이 없습니다.</p>
					</div>
					<!--// 쿠폰 내역이 없을 경우 노출 -->
				</div>
			</div>
		</div>
		<!--// Mysub > 쿠폰 -->
	</div>
	<!--// sub content e -->
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>