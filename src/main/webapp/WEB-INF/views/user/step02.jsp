<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAST-WAY > 매장찾기</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/jquery-ui-1.12.0.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
<!-- container s -->
<div id="container">
	<!-- sub content s -->
	<div class="order fast_sub" id="content">
		<!-- index -->
		<div class="store_map">
			<div class="order_title">
				<h3>Fast-Way</h3>
				<p>
				온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.
				</p>
			</div>
	
		<div class="tab02">
			<ul>
				<li class="active"><a href="#">샌드위치</a></li>
				<li><a href="#">매장찾기</a></li>
			</ul>
		</div>
		<div class="order_con order_map">
		
		<div class="store_search">
				<h3>매장찾기</h3>
				<fieldset>
					<legend>매장 검색</legend>
					<div class="form_search">
					<form id="mapFrm" name="mapFrm" action="javascript:searchStore();">
						<input autocomplete="off" id="keyword" maxlength="30" placeholder="지역 입력" type="text" />
						<a class="btn_search" href="#" onclick="searchStore();"></a>
					</form>
					</div>
					<div class="search_result_cont" id="uiReslutCont" style="display:none;">
						<p class="search_total">검색 결과 <strong></strong><em id="uiResultCount">0</em>건</p>
						<div style="overflow-y:auto; overflow-x:hidden; height:550px;">
							<div class="store_list">
								<ul id="uiResultList"></ul>
							</div>
						</div>
					</div>
				</fieldset>
			</div>
		</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>