<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Coupon</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
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
						<ul>

						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--// Mysub > 쿠폰 -->
	</div>
	<!--// sub content e -->
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>