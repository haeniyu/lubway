<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY-WAY > 사용가능쿠폰</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/point.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<!-- sub content s -->
	<div id="content">
		<!-- 멤버십 > 쿠폰현황 -->
		<div class="coupon_wrapper">
			<h2 class="subTitle">사용 가능 쿠폰</h2>
			<div class="tab02">
				<ul>
					<li class="active" id="mypoint"><span>${user.name }</span>님의 보유 쿠폰 현황입니다.</li>
				</ul>
			</div>
			<!-- 쿠폰이 있을 시 노출 -->
			<c:if test="${countCoupon > 0 }">
			<section class="tab_content" style="background-color:white;">
				<div class="coupon_status">

					<section class="form_box">
						<div class="write_info_wrap">
							<div class="list">
							<table id="dataTable" width="100%" cellspacing="0">
	
								<thead>
									<tr align="center">
										<th width="10%">쿠폰 코드</th>
										<th width="20%">쿠폰 이름</th>
										<th width="15%">쿠폰 사용처</th>
										<th width="15%">쿠폰 할인율</th>
										<th width="20%">쿠폰 등록일</th>
										<th width="20%">쿠폰 만기일</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${couponList}" var="coupon">
										<tr align="center">
											<td>${coupon.code }</td>
											<td>${coupon.name }</td>
											<td>${coupon.type }</td>
											<td>${coupon.discount }%</td>
											<td><fmt:formatDate value="${coupon.regdate }"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${coupon.enddate }"
													pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						</div>
					</section>
				</div>
			</section>
			</c:if>
				<!-- 쿠폰이 없을 시 노출 -->
				<c:if test="${countCoupon == 0 }">
					<div class="data_none">
						<p>사용 가능한 쿠폰이 없습니다.</p>
					</div>
				</c:if>
				<!-- 쿠폰이 없을 시 노출 -->
		</div>
		<!--// 멤버십 > 쿠폰현황 -->
	</div>
	<!--// sub content e -->
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>