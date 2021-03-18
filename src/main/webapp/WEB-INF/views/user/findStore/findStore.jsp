<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 찾기</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.subway.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffe7c5af8a7826856c48dec067ac9849"></script>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<div id="content">
				<!-- 매장찾기 s -->
				<div class="store_search_wrapper">
					<!-- 매장찾기 레이어 s -->
					<div class="store_search_layer">
						<h2>매장찾기</h2>
						<!-- 검색 -->
						<div class="form_search">
							<form id="mapFrm" method="POST" name="mapFrm" onsubmit="return shopMap.search()">
								<input id="keyword" maxlength="30" placeholder="지역 또는 매장명 입력" type="text" value="" />
								<a class="btn_search" href="#" onclick="shopMap.search();return false;"></a>
							</form>
						</div>
						<!--// 검색 -->

						<!-- 검색결과 -->
						<div class="search_result_cont" id="uiReslutCont" style="display:none;">
							<p class="search_total">검색 결과 <strong id="uiResultCount">0</strong>건</p>

							<div class="store_list_scroll">
								<ul id="uiResultList">
								</ul>
							</div>

							<!-- board 페이지 -->
							<div class="pagination" id="ui_pager"></div>
							<!--// board 페이지 -->
						</div>
						<!--// 검색결과 -->
					</div>
					<!--// 매장찾기 레이어 e -->

					<!-- 매장지도 s -->
					<div class="store_map" id="map">
					</div>
				</div>
			</div>

<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>