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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/jquery-ui-1.12.0.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<div id="content">
		<!-- 매장찾기 s -->
		<div class="store_search_wrapper">
		<!-- 매장찾기 레이어 s -->
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

				<div class="store_list_scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar" style="overflow-y:auto; overflow-x:hidden; height:450px;">
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
		</div>
					
			<!-- 매장지도 s -->
			<div class="store_map" id="map">
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffe7c5af8a7826856c48dec067ac9849&libraries=services"></script>
				<script>
						var markers = [];
						var listEl = document.getElementById('uiResultList');
						var fragment = document.createDocumentFragment();
				
						var container = document.getElementById('map');
						var options = {
							center : new kakao.maps.LatLng(37.56249087747179, 126.97657325145),
							level : 3
						};

						var map = new kakao.maps.Map(container, options);
	
						function searchTest(data) {
							var xpos = [];
							var ypos = [];
							for (var i=0; i<markers.length; i++) {
								markers[i].setMap(null);
						 	}  
							console.log(data);
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder(); 
							var arr = data;
							var geocoderCount = 0;
							var bounds = new kakao.maps.LatLngBounds();							
							
							for(var i=0; i<arr.length; i++) {							 
								var obj = arr[i];
								
								geocoder.addressSearch(obj.address_road, function(result, status) {
									geocoderCount++;
									
									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) { 
										var markerPosition = new kakao.maps.LatLng(result[0].y,result[0].x);
										bounds.extend(markerPosition);

										xpos.push(result[0].x);									
										ypos.push(result[0].y);

									// 결과값으로 받은 위치를 마커를 생성하고 표시합니다 
										var marker = new kakao.maps.Marker({ 
											map: map, 
											position: markerPosition
										});
										markers.push(marker);
//										console.log(geocoderCount, arr.length);
										if(geocoderCount == arr.length) createInfo(data, xpos, ypos);
										map.setBounds(bounds);
									}
								});
								}
							}

						function searchStore() {
							var keyword = $("#keyword").val().trim();
							console.log(keyword);
							
							$.ajax({
								url : '/lubway/searchStore.do?keyword=' + keyword,
								type : 'post',
								success : function(data) {
									searchTest(data);
								},
								error : function() {
									console.log("실패");
								}
							});
						}
						
						function createInfo(data, xpos, ypos) {
							$("#uiReslutCont").show();
							
							for(var i=0; i<data.length; i++) {
								console.log(data[i]);
								var itemEl = getListItem(i, data[i], xpos, ypos);
								
								fragment.appendChild(itemEl);
								listEl.appendChild(fragment);
								
							}
							
							document.getElementById('uiResultCount').innerHTML=data.length;
							//var ul = document.getElementById('uiResultList');
						}
						
						('120', '강남구청역', '서울특별시 강남구 선릉로 653', '', '025450806', '0800', '2300', '37.5148927', '127.0418835', '주말 08:00~22:00')
						// 검색결과 항목을 Element로 반환하는 함수입니다
						function getListItem(index, obj, xpos, ypos) {

						    var el = document.createElement('li');
						    el.setAttribute("onclick", "showStoreInfoLayer(" + "'" + obj.no + "'" + ", " + "'" + obj.storename + "'" + ", " + "'" + obj.address_road + "'" + ",	" + "'" + obj.address_detail + "'" + ",	" + "'" + obj.store_tel + "'" + ", " + "'" + obj.open + "'" + ", " + "'" + obj.close + "'" + ",	" + "'" + xpos[0] + "'" + ", " + "'" + ypos[0] + "'" + ")");
						    
						    var itemStr = '<div class="info"> <strong>' + obj.storename + '</strong></div>';

						    if (obj.address_road) {
						        itemStr += '    <span>' + obj.address_road + '</span>' +
						                    '   <span>' +  obj.address_detail  + '</span>';
						    } else {
						        itemStr += '    <span>' +  obj.address_road  + '</span>'; 
						    }
						                 
						      itemStr += '  <span> 연락처: ' + obj.store_tel  + '</span>' +
						                '</div>';           

						    el.innerHTML = itemStr;

						    return el;
						}
						
						function showStoreInfoLayer(franchiseNo, storeName, storeAddr1, storeAddr2, storeTel, openTm, closeTm, lat, lng) {

							console.log("나 여기있소");
							
							console.log(lat);
							console.log(lng);
							
							/*
							function setCenter() {
							    // 이동할 위도 경도 위치를 생성합니다 
							    var moveLatLon = new kakao.maps.LatLng(lat, lng);
							    
							    // 지도 중심을 이동 시킵니다
							    map.setCenter(moveLatLon);
							}
							
							setCenter(lat, lng);

							*/
							
							/*
							//  마커
							var marker = new kakao.maps.Marker({ 
								map : kakao.maps,
								position : mapCooder
							});
							*/
						}
/*							
							var marker = new kakao.maps.Marker({
							    position: mapCooder,
							    map: naverMap.map,
								title: ""
							});
*/						
				</script>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>