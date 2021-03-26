<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/cart.css" />

<!-- 
<script type="text/javascript" src="/js/order/common/cart.js?v=2021032501"></script>	
 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>

    <div id="container">
		<!-- sub content s -->
		<div class="cart fast_sub" id="content">
			<!-- index -->
			<h2 class="subTitle_02">장바구니</h2>
			<div class="tab02">
				<ul>
					<li class="swiper-slide active"><a href="/lubway/basketfast.do">FAST-SUB</a></li>
					<li class="swiper-slide "><a href="/lubway/baskethome.do">HOME-SUB</a></li>
				</ul>
			</div>
			<!-- 장바구니 목록 있을때 -->
			

			<!-- 장바구니 목록 없을때 -->
			
				<!-- 장바구니없음 -->
				<div class="data_none wh_box">
					<p>장바구니가 비어있습니다.</p>
				</div>
			<!--// 장바구니없음 -->
			

			<!--// index -->
		</div>
		<!--// sub content e -->
	</div>

	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>