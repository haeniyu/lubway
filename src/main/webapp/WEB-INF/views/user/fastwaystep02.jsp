<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fastway/Step02</title>

</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<div id="container">
		<!-- sub content s -->
		<div class="order fast_sub" id="content">
			<!-- index -->
			<div class="store_map">
				<div class="order_title">
					<h3>Fast-Way</h3>
					<p>온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</p>
				</div>
				<div class="tab02">
					<ul>
						<li class="active"><a href="javascript:;" name="itemMenu"
							data-category-code="ITEM_SANDWICH">샌드위치</a></li>
						<li><a href="javascript:void(0);" name="itemMenu"
							data-category-code="ITEM_SALAD">찹샐러드</a></li>
						<li><a href="javascript:;" name="itemMenu"
							data-category-code="ITEM_UNIT">랩ㆍ기타</a></li>
						<li><a href="javascript:;" name="itemMenu"
							data-category-code="ITEM_SIDEDRINK">사이드ㆍ음료</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>

</body>
</html>