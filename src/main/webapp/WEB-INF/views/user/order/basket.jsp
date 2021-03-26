<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/cart.css" />
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<!-- container s -->
	<div id="container">
		<!-- sub content s -->
		<div class="cart" id="content">
			<!-- index -->
			<h2 class="subTitle_02">장바구니</h2>
			<div class="tab02">
				<ul class="select" id="select">
					<li id="fast"><a href="#">FAST-WAY</a></li>
					<li id="home"><a href="#">HOME-SUB</a></li>
				</ul>
			</div>
			
			
			
			<!-- 장바구니 비어있을 때 -->
			<div class="data_none wh_box">
				<p>장바구니가 비어있습니다.</p>
			</div>
		</div>
		<!--// sub content e -->
	</div>

<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>