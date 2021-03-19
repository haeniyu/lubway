<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 찾기</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.subway.css" />
<script type="text/javascript">
	function searchStore() {
		var keyword = $("#keyword").val().trim();
		console.log(keyword);
		
		$.ajax({
			url : '/lubway/searchStore.do?keyword=' + keyword,
			type : 'post',
			success : function(data) {
				console.log("성공");
				searchTest(data);
				console.log("끝");
			},
			error : function() {
				console.log("실패");
			}
		});
	}
	
	function createInfo(data, xpos, ypos) {
		console.log("ㅋㅋ");
		$("#uiReslutCont").show();
		
		console.log(xpos);
		console.log(ypos);
		
		console.log(xpos[0]);
		
//		console.log(xpos.length);
//		console.log(ypos[0]);
//		for(var i=0; i<xpos.length; i++)	{
//			console.log("ㅋㅋ");
//			console.log(xxpos[i]);
//			console.log(yypos[i]);
//		console.log(xy[]);
//		document.getElementById('uiResultCount').innerHTML=data.length;
//		document.getElementById('uiResultCount').innerHTML=xy[0];
//		document.getElementById('uiResultCount').innerHTML=;
//		var ul = document.getElementById('uiResultList');
//	}
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<div id="content">
		<!-- 매장찾기 s -->
		<div class="store_search_wrapper">
			<!-- 매장찾기 레이어 s -->
<!-- 
			<div class="store_search_layer">
				<h2>매장찾기</h2>
				<div class="form_search">
					<form id="mapFrm" method="POST" name="mapFrm"
						onsubmit="return shopMap.search()">
						<input id="keyword" maxlength="30" placeholder="지역 또는 매장명 입력" type="text" value="" /> 
						<a class="btn_search" href="#" onclick="searchStore();"></a>
					</form>
				</div>

				<div class="search_result_cont" id="uiReslutCont"
					style="display: none;">
					<p class="search_total">
						검색 결과 <strong id="uiResultCount">0</strong>건
					</p>

					<div class="store_list_scroll">
						<ul id="uiResultList">
						<c:forEach items="${arr }" var="shop">
							<li>
								<span>${shop.storename }</span>							
							</li>
						</c:forEach>
						</ul>
					</div>

					<div class="pagination" id="ui_pager"></div>
				</div>
			</div>
 -->
		<div class="store_search_layer">
			<h2 id="name">매장찾기</h2>
			<!-- 검색 -->
			<div class="form_search">
				<form id="mapFrm" method="POST" name="mapFrm" onsubmit="return shopMap.search()">
					<input id="keyword" maxlength="30" placeholder="지역 또는 매장명 입력" type="text" value="">
					<a class="btn_search" href="#" onclick="searchStore();"></a>
				</form>
			</div>
			<!--// 검색 -->

			<!-- 검색결과 -->
			<div class="search_result_cont" id="uiReslutCont" style="display:none;">
				<p class="search_total">검색 결과 <strong id="uiResultCount">0</strong>건</p>

				<div class="store_list_scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar">
					<div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 421px;" tabindex="0">
						<div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
							<ul id="uiResultList"></ul>
						</div>
						<div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;">
							<div class="mCSB_draggerContainer">
								<div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;">
									<div class="mCSB_dragger_bar" style="line-height: 30px;">
									</div>
								</div>
							<div class="mCSB_draggerRail"></div>
							</div>
						</div>
					</div>
				</div>

				<!-- board 페이지 -->
				<div class="pagination" id="ui_pager"></div>
				<!--// board 페이지 -->
			</div>
			<!--// 검색결과 -->
		</div>
					
			<!-- 매장지도 s -->
			<div class="store_map" id="map">
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffe7c5af8a7826856c48dec067ac9849&libraries=services"></script>
				<script>
						var markers = [];
						var xpos = [];
						var ypos = [];
				
						var container = document.getElementById('map');
						var options = {
							center : new kakao.maps.LatLng(37.56249087747179, 126.97657325145),
							level : 3
						};
	
						var map = new kakao.maps.Map(container, options);
							
						function searchTest(data) {
							for (var i=0; i<markers.length; i++) {
								markers[i].setMap(null);
						 	}  
							console.log(data);
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder(); 
							var arr = data;
							
							// 주소로 좌표를 검색합니다 for문 안에 넣기
							/*
							<c:forEach items="${findStore}" var="info">
								var storeinfo = new Object();
								storeinfo.address_road = "${info.address_road}";
								storeinfo.storename = "${info.storename}";
								arr.push(storeinfo);
							</c:forEach>
							*/	
							
							for(var i=0; i <arr.length; i++){
								 
									var obj = arr[i];
//									console.log(obj.address_road);
//									console.log(obj.storename);
								
									geocoder.addressSearch(obj.address_road, function(result, status) { 
									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) { 
//										console.log(result[0].y);
										var markerPosition = new kakao.maps.LatLng(result[0].y,result[0].x);
										//xy.push(result[0].y);
//										xpos[i] = result[0].x;
//										console.log(xpos[i]);
										xpos.push(result[0].x);									
										ypos.push(result[0].y);
										
//										ypos[i] = result[0].y;
//										console.log(ypos[i]);
										
									// 결과값으로 받은 위치를 마커를 생성하고 표시합니다 
										var marker = new kakao.maps.Marker({ 
										map: map, 
										position: markerPosition
									});
									markers.push(marker);
									}
								});
							}
							createInfo(data, xpos, ypos);
						}
				</script>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>