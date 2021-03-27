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
				<form id="mapFrm" name="mapFrm" action="javascript:searchStore();">
					<input id="keyword" maxlength="30" placeholder="지역 입력" type="text" value="">
					<a class="btn_search" href="#" onclick="searchStore();"></a>
				</form>
			</div>
			<!--// 검색 -->

			<!-- 검색결과 -->
			<div class="search_result_cont" id="uiReslutCont" style="display:none;">
				<p class="search_total">검색 결과 <strong id="uiResultCount">0</strong>건</p>

				<div style="overflow-y:auto; overflow-x:hidden; height:450px;">
					<div style="max-height: 421px;" tabindex="0">
						<div style="position:relative; top:0; left:0;" dir="ltr">
							<ul id="uiResultList"></ul>
						</div>
						<div style="display: none;">
							<div>
								<div style="position: absolute; min-height: 30px; top: 0px;">
									<div style="line-height: 30px;">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
					level : 2
				};

				//지도 생성
				var map = new kakao.maps.Map(container, options);
				//주소-좌표간 변환 서비스 객체를 생성
				var geocoder = new kakao.maps.services.Geocoder(); 

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
					
				function createInfo(data) {
					$("#uiReslutCont").show();
					
					// 목록 검색 결과 내역 지우기
					while(listEl.firstChild){
                        listEl.removeChild(listEl.firstChild);
                     }
					
					for(var i=0; i<data.length; i++) {
						var itemEl = getListItem(i, data[i]);
						
						fragment.appendChild(itemEl);
						listEl.appendChild(fragment);
						
					}
					//검색 결과 건수 나타내기
					document.getElementById('uiResultCount').innerHTML=data.length;
				}
					
				  // 검색결과 항목을 Element로 반환하는 함수입니다
                  function getListItem(index, obj) {

                      var el = document.createElement('li');
                      el.setAttribute("onclick", "showStoreInfoLayer(" + "'" + obj.no + "'" + ", " + "'" + obj.storename + "'" + ", " + "'" + obj.address_road + "'" + ",   " + "'" + obj.address_detail + "'" + ",   " + "'" + obj.store_tel + "'" + ", " + "'" + obj.open + "'" + ", " + "'" + obj.close + "'" + ")");
                      
                      var itemStr = '<div class="info"> <strong>' + obj.storename + '</strong>';

                      if (obj.address_road) {
                          itemStr += '    <span>' + obj.address_road + '</span>' +
                                      '   <span>' +  obj.address_detail  + '</span>';
                      } else {
                          itemStr += '    <span>' +  obj.address_road  + '</span>'; 
                      }
                        itemStr += '  <span> 연락처: ' + obj.store_tel  + '</span>'
                        itemStr += '  <span> 영업시간: ' + obj.open  + '~' + obj.close + '</span>' 
                                  '</div>';
                                  
                       var itemStr2 = '<div class="service">';
                       if(obj.fastway_usable) itemStr2 += '<span>Fast-Way</span>';
                       if(obj.homeway_usable) itemStr2 += '<span>Home-Way</span>';
                       if(obj.morning_usable) itemStr2 += '<span>아침메뉴</span>';
                       itemStr2 += '</div>';
								                                  
                      el.innerHTML = itemStr;
					  el.innerHTML += itemStr2;
                      
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
						"</div>";
						
				}
				
				//오버레이 닫기
				function closeOverlay() {
					$("#windowInfo").remove();
				}
					
			</script>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>