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
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/jquery-ui-1.12.0.min.js"></script>
<script type="text/javascript">
function orderStart(franchiseNo) {
	$("#franchiseNo").val(franchiseNo);
	$("#orderForm").submit();
}
</script>
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
				<li class="active"><a href="#">매장찾기</a></li>
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
		
		<!-- map api area w1170 h819 -->
			<div class="map_api">
				<div style="height:820px;" id="map">
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffe7c5af8a7826856c48dec067ac9849&libraries=services"></script>
				<script>
					var markers = [];
					var listEl = document.getElementById('uiResultList');
					var fragment = document.createDocumentFragment();
			
					var container = document.getElementById('map');
					var options = {
						center : new kakao.maps.LatLng(37.56249087747179, 126.97657325145),
						level : 2
					};

					//지도 생성
					var map = new kakao.maps.Map(container, options);
					//주소-좌표간 변환 서비스 객체를 생성
					var geocoder = new kakao.maps.services.Geocoder();
					
					
					// HTML5의 geolocation으로 현위치 얻기
					if (navigator.geolocation) {
					    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
					    navigator.geolocation.getCurrentPosition(function(position) {
					        
					        var lat = position.coords.latitude, // 위도
					            lon = position.coords.longitude; // 경도
					        
					        var locPosition = new kakao.maps.LatLng(lat, lon) // geolocation으로 얻어온 좌표로 위치 설정
					            
					        // 지도 중심 위치 변경
					        map.setCenter(locPosition);
					        // 좌표 -> 주소 변환
					        geocoder.coord2RegionCode(lon, lat, getLoca);         
					        
					      });
					}//end of 현위치 얻기
					
					//좌표를 주소로 변환 후 매장 검색
					function getLoca(result, status){
						if (status === kakao.maps.services.Status.OK) {
					        for(var i = 0; i < result.length; i++) {
					            // 행정동의 region_type 값은 'H' 이므로
					            if (result[i].region_type === 'H') {
					               console.log(result[i].region_2depth_name);
					               
					               //접속한 위치의 행정동 주소 기준 '구' 추출 후 검색
					               keyword = result[i].region_2depth_name;
					               searchStoreNearHere(keyword);
					               break;
					            }
					        }
					    }    
					}
					
					// 현위치 기반 검색
					function searchStoreNearHere(keyword) {
						$.ajax({
							url : '/lubway/searchStore.do?keyword=' + keyword,
							type : 'post',
							success : function(data) {
								//검색결과가 없을 시
								if(data.length == 0) {
									// 목록 검색 결과 내역 지우기
									while(listEl.firstChild){
				                        listEl.removeChild(listEl.firstChild);
				                     }
									document.getElementById('uiResultCount').innerHTML=data.length;
								}
								//검색 결과 존재
								search(data);
							},
							error : function() {
								console.log("실패");
							}
						});
					}
					
					
					//검색 시 실행되는 함수(ajax success)
					function search(data) {
						closeOverlay();
						
						//마커 초기화
						for (var i=0; i<markers.length; i++) {
							markers[i].setMap(null);
					 	}  
						
						var arr = data;
						var geocoderCount = 0;
						var bounds = new kakao.maps.LatLngBounds();							
						
						//컨트롤러에서 전달받은 배열을 이용하여 storeInfoVO에 관한 지도 표시
						for(var i=0; i<arr.length; i++) {
							var obj = arr[i];
							
							geocoder.addressSearch(obj.address_road, function(result, status) {
								geocoderCount++;
								
								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) { 
									var markerPosition = new kakao.maps.LatLng(result[0].y,result[0].x);
									bounds.extend(markerPosition);
									
								// 결과값으로 받은 위치를 마커를 생성하고 표시합니다 
									if(geocoderCount == arr.length) createInfo(data);	//검색결과로 매장정보 설정
									var marker = new kakao.maps.Marker({ 
										map: map, 
										position: markerPosition,
									});
								
									markers.push(marker); 
									map.setBounds(bounds);
								}
							});//end of addressSearch()
						}//end of for
					}//end of function search

					// 검색
					function searchStore() {
						var keyword = $("#keyword").val().trim();
						console.log(keyword);
						
						$.ajax({
							url : '/lubway/fastway/searchStore.do?keyword=' + keyword,
							type : 'post',
							success : function(data) {
								//검색결과가 없을 시
								if(data.length == 0) {
									// 목록 검색 결과 내역 지우기
									while(listEl.hasChildNodes()){
				                        listEl.removeChild(listEl.lastChild);
				                     }
									document.getElementById('uiResultCount').innerHTML=data.length;
								}
								//검색 결과 존재
								search(data);
							},
							error : function() {
								console.log("실패");
							}
						});
					}
					
					function createInfo(data) {
						$("#uiReslutCont").show();
						
						// 목록 검색 결과 내역 지우기
						while(listEl.hasChildNodes()){
	                        listEl.removeChild(listEl.lastChild);
	                     }
						
						for(var i=0; i<data.length; i++) {
							var itemEl = getListItem(i, data[i]);	//li
							
							fragment.appendChild(itemEl);//li
							listEl.appendChild(fragment);//ul
							
						}
						//검색 결과 건수 나타내기
						document.getElementById('uiResultCount').innerHTML=data.length;
					}
					
					// 검색결과 항목을 Element로 반환하는 함수입니다
	                  function getListItem(index, obj) {

	                      var el = document.createElement('li');
	                      el.setAttribute("onclick", "showStoreInfoLayer(" + "'" + obj.no + "'" + ", " + "'" + obj.storename + "'" + ", " + "'" + obj.address_road + "'" + ",   " + "'" + obj.address_detail + "'" + ",   " + "'" + obj.store_tel + "'" + ", " + "'" + obj.open + "'" + ", " + "'" + obj.close + "'" + ")");
	                      
	                      var itemStr = '<dl> <dt><strong>' + obj.storename + '</strong><em class="on" style="cursor:pointer;">주문하기</em></dt>';
	                     
	                        itemStr += '    <dd><p>' + obj.address_road + '</p>';
	                       
	                        itemStr += '  <p>' + obj.store_tel  + '</p></dd></dl>';
	                                  
	                      el.innerHTML = itemStr;
	                      
	                      return el;
	                  }
					
					// 목록 li 클릭시 실행되는 함수
					function showStoreInfoLayer(franchiseNo, storeName, storeAddr1, storeAddr2, storeTel, openTm, closeTm) {
						closeOverlay();
						
						console.log(storeName);
						
						//해당 매장 주소로 좌표 검색 후 마커와 오버레이 표시하기
						geocoder.addressSearch(storeAddr1, function(result, status) {
							if (status === kakao.maps.services.Status.OK) { 
								var mapCooder = new kakao.maps.LatLng(result[0].y,result[0].x);
								var marker = new kakao.maps.Marker({
								    position: mapCooder
								});
								
								map.setCenter(mapCooder);
								
								//오버레이 띄우기
								var customOverlay = new kakao.maps.CustomOverlay({
								    position: mapCooder,
								    content: content,
								    map: map
								});
							}//end of if
						});//end of function
						
						//지도 확대 레벨 설정
						map.setLevel(2);	
						
						//오버레이 내용
						var content =
							"<div class='store_map_layer' id='windowInfo'>" +
							"	<div class='head'>" +
							"		<strong>" + storeName + "</strong>" +
							"		<a href='#none' class='btn_close' onclick='closeOverlay();'>닫기</a>" +
							"	</div>" +
							"	<div class='info'>" +
							"		<dl>" +
							"			<dt>주소</dt>" +
							"			<dd id='ui_storeInfoLayer_addr'>" + storeAddr1 + 
							"			</dd>" +
							"			<dt>연락처</dt>" +
							"			<dd>" + storeTel + "</dd>" +
							"			<dt>영업시간</dt>" +
							"			<dd>"+ openTm + " - " + closeTm +"</dd>" +
							"		</dl>" +
							"	</div>" +
							"	<div class='foot'>" +
							"		<a class='btn_order on' href='javascript:;' onclick='orderStart(" + franchiseNo + ")'><span>주문하기</span></a></form>" +
							"	</div>" +
							"</div>";
							
						
					}
					
					//오버레이 닫기
					function closeOverlay() {
						$("#windowInfo").remove();
						
					}
					
				</script>
				</div>
			</div>
		<!--// map api area -->
		</div>
		</div>
	</div>
</div>
<!-- 주문하기-->
<form action="/lubway/orderStep02.do" method="post" id="orderForm" style="display: none;">
	<input type="hidden" name="whatWay" value="Fast-Way">
	<input type="hidden" id="franchiseNo" name="franchiseNo" value="">
	<input type="hidden" name="changeNo" value="${changeNo}">
	<input type="hidden" name="user" value="${user.id}">
</form> 
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>