<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/ui.mypage.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<!-- container s -->
	<div id="container">
		<!-- sub content s -->
		<div id="content">
			<!-- My SUB Index -->
			<div class="mysub_index">
				<h2 class="subTitle_02 font_sw">MY WAY</h2>
				<section class="member_active">
					<!-- 회원정보 -->
					<section class="my_info">
						<div class="info member">
							<div class="name_gender">
								<i class="character female"></i>
								<p class="name">
									<strong><em class="multiple_line">${user.name }</em>님</strong>
								</p>
							</div>
							<a class="btn go_view infoBtn" href="/lubway/checkpwd.do" > <span>회원 정보 변경</span></a>
						</div>
						<div class="info point">
							<dl>
								<dt>멤버십 포인트</dt>
								<dd>
									<strong><em>${user.point }</em>P</strong>
								</dd>
							</dl>
							<a class="btn go_view whiteBtn" href="/mypage/point"><span>포인트 관리</span></a>
						</div>
					</section>
					<section class="my_info">
						<div class="info order">
							<dl>
								<dt>주문내역</dt>
								<dd>
									<strong>0</strong>개
								</dd>
							</dl>
							<a class="btn go_view whiteBtn" href="/mypage/order"><span>주문 내역 관리</span></a>
						</div>
						<div class="info coupon">
							<dl>
								<dt>쿠폰</dt>
								<dd>
									<!--<strong th:text="${member.couponCount}"></strong>개-->
									<strong>0</strong>개
								</dd>
							</dl>
							<a class="btn go_view whiteBtn" href="/mypage/coupon"><span>쿠폰 관리</span></a>
						</div>
					</section>
				</section>
				<!--// 회원활동 -->
			</div>
			<!--// My SUB Index -->
		</div>
		<!--// sub content e -->
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>

</body>
</html>