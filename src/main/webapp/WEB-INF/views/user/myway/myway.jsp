<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY-WAY > 마이페이지</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/ui.mypage.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(window).load(function(){
    $(".loading").fadeOut();
});
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
									<strong>
										<em class="multiple_line">${user.name}</em>님
									</strong>
								</p>
							</div>
							<c:if test="${nuser != null || guser != null || kuser != null}">
								<a class="btn go_view infoBtn" href="/updateinfo.do">
								<span>회원 정보 변경</span></a>
							</c:if>
							<c:if test="${user != null && nuser == null && guser == null && kuser == null}">
								<a class="btn go_view infoBtn" href="/checkpwd.do">
								<span>회원 정보 변경</span></a>
							</c:if>
						</div>
						<div class="info point">
							<dl>
								<dt>멤버십 포인트</dt>
								<dd>
									<strong><em>${user.point }</em>P</strong>
								</dd>
							</dl>
							<a class="btn go_view whiteBtn" href="/point.do"><span>포인트 관리</span></a>
						</div>
					</section>
					<section class="my_info">
						<div class="info order">
							<dl>
								<dt>주문내역</dt>
								<dd>
									<strong>${countOrder}</strong>개
								</dd>
							</dl>
							<a class="btn go_view whiteBtn" href="/orderList.do"><span>주문 내역 관리</span></a>
						</div>
						<div class="info coupon">
							<dl>
								<dt>쿠폰</dt>
								<dd>
									<strong>${countCoupon}</strong>개
								</dd>
							</dl>
							<a class="btn go_view whiteBtn" href="/coupon.do"><span>쿠폰 관리</span></a>
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