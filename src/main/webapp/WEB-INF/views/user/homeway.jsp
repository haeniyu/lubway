<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME-WAY > 매장찾기</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/modal.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.popup.css?v=1" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/TweenMax.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var sigungu = "";

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   // document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("extraAddress").value = '';
                }

                console.log(data);
                console.log(data.sigungu);
                sigungu = data.sigungu;
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipCode').value = data.zonecode;
                document.getElementById("baseAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("dtlAddr").focus();
            }
        }).open();
    }
    
    function searchInfo() {
    	console.log("=== searchInfo ===");

    	$("#basicAddr").val($("#baseAddr").val());
    	$("#detailAddr").val($("#dtlAddr").val());
    	
    	var basic = $("#basicAddr").val();
    	var detail = $("#detailAddr").val();
    	var fullAddr = basic + " " + detail;
    	
    	$("#fullAddr").val(fullAddr);
    	
    	console.log("기본 주소 : " + basic);
    	console.log("상세 주소 : " + detail);
  		console.log("전체 주소 : " + fullAddr)
    	
    	$("#addr_home").val(fullAddr);
    	
//    	console.log("sigungu : " + sigungu);
    	var splitAddr = sigungu.split(" ");
//    	console.log("splitAddr : " + splitAddr);
    	
    	var resultAddr = "";
    	if(splitAddr.length == 1) resultAddr = splitAddr[0];
    	else resultAddr = splitAddr[1];
    	
//    	console.log("resultAddr : " + resultAddr);
    	
    	$("#keyword").val(resultAddr);
    	console.log("keyword : " + $("#keyword").val());
    	
    	$("#close").get(0).click();
    	
    	searchStore();
    }

    function orderStart(data) {
    	console.log("data : " + data);
    	$("#franchiseNo").val(data);
    	$("#orderForm").submit();

    }

</script>
<script type="text/javascript">
	function modalView() {
		$("#ord_pop").get(0).click();
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
<!-- container s -->
<div id="container">
	<!-- sub content s -->
	<div class="order home_sub" id="content">
		<!-- index -->
		<div class="store_map">
			<div class="order_title">
				<h3>Home-Way</h3>
				<p style="margin-bottom: 30px;">온라인 주문 시 배달되는 서비스입니다.</p>
			</div>
		
		<div class="order_con order_map">
		<fieldset class="delivery_address">
			<legend>배달 주소 입력</legend>
			<dl>
				<dt>배달주소</dt>
				<dd>
					<input onclick="modalView();" id="addr_home" placeholder="배달 받으실 주소를 입력해 주세요" readonly="readonly" type="text" value="">
					<a href="#testModal" rel="modal:open" id="ord_pop">변경</a>					
				</dd>
			</dl>
		</fieldset>
		<div class="store_search">
				<h3 style="margin-bottom: 10px">매장찾기</h3>
				<fieldset>
					<legend>매장 검색</legend>
					<div class="form_search" style="display: none;">
						<form id="mapFrm" name="mapFrm" action="javascript:searchStore();">
							<input autocomplete="off" id="keyword" maxlength="30" placeholder="지역 입력" type="text" />
							<a class="btn_search" href="#" onclick="searchStore();"></a>
						</form>
					</div>
					<div class="search_result_cont" id="uiReslutCont" style="display:none;">
						<p class="search_total" style="padding-top: 14px; padding-bottom: 18px;">검색 결과 <strong></strong>
							<em id="uiResultCount">0</em>건
						</p>
					</div>
				</fieldset>
				<div style="overflow-y:auto; overflow-x:hidden; height:550px;">
					<div class="store_list">
						<ul id="uiResultList"></ul>
					</div>
				</div>
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

					var map = new kakao.maps.Map(container, options);

					function search(data) {
						closeOverlay();
						var xpos = [];
						var ypos = [];
						for (var i=0; i<markers.length; i++) {
							markers[i].setMap(null);
					 	}  
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
									if(geocoderCount == arr.length) createInfo(data, xpos, ypos);
									map.setBounds(bounds);
								}
							});
							
						}//end of for
					}//end of function search

					// 검색
					function searchStore() {
						var keyword = $("#keyword").val().trim();
						console.log(keyword);
						
						$.ajax({
							url : '/lubway/homeway/searchStore.do?keyword=' + keyword,
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
					
					function createInfo(data, xpos, ypos) {
						$("#uiReslutCont").show();
						
						// 목록 검색 결과 내역 지우기
						while(listEl.firstChild){
	                        listEl.removeChild(listEl.firstChild);
	                     }
						
						for(var i=0; i<data.length; i++) {
							var itemEl = getListItem(i, data[i], xpos[i], ypos[i]);
							
							fragment.appendChild(itemEl);
							listEl.appendChild(fragment);
							
						}
						//검색 결과 건수 나타내기
						document.getElementById('uiResultCount').innerHTML=data.length;
					}
					
					// 검색결과 항목을 Element로 반환하는 함수입니다
					function getListItem(index, obj, xpos, ypos) {

						var el = document.createElement('li');
						el.setAttribute("onclick", "showStoreInfoLayer(" + "'" + obj.no + "'" + ", " + "'" + obj.storename + "'" + ", " + "'" + obj.address_road + "'" + ",   " + "'" + obj.address_detail + "'" + ",   " + "'" + obj.store_tel + "'" + ", " + "'" + obj.open + "'" + ", " + "'" + obj.close + "'" + ",   " + "'" + xpos + "'" + ", " + "'" + ypos + "'" + ")");
	                      
						var itemStr = '<dl><dt><strong>' + obj.storename + '</strong><em class="on">주문하기</em></dt>';
						itemStr += '<dd class="delivery time"><p>예상 배달 소요시간</p><span>40분</span></dd>';
						itemStr += '<dd class="delivery"><p>최소 주문 금액</p><span>13,000원</span></dd>';
						itemStr += '<dd class="delivery"><p>배달비</p><span>3,900원</span></dd>';
						itemStr += '<dd><p>' + obj.address_road + '</p>';
						itemStr += '<p>' + obj.store_tel  + '</p></dd></dl>';
	                                  
						el.innerHTML = itemStr;
	                      
						return el;
					}
					
					// 목록 li 클릭시 실행되는 함수
					function showStoreInfoLayer(franchiseNo, storeName, storeAddr1, storeAddr2, storeTel, openTm, closeTm, lat, lng) {
						closeOverlay();
						
						//지도 좌표 이동
						var mapCooder = new kakao.maps.LatLng(lng, lat);
						var marker = new kakao.maps.Marker({
						    position: mapCooder
						});
						map.setCenter(mapCooder);
						
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
							"			<dt>최소주문금액</dt><dd>13,000원</dd>" +
							"			<dt>배달비</dt><dd>3,900원</dd>" +
							"		</dl>" +
							"	</div>" +
							"	<div class='foot'>" +
							"		<a class='btn_order on' onclick=javascript:orderStart(";
							content += "'" + franchiseNo + "'";
							content += "); target='blank'><span>주문하기</span></a>" +"	</div>" +"</div>";
							
						//오버레이 띄우기
						var customOverlay = new kakao.maps.CustomOverlay({
						    position: mapCooder,
						    content: content,
						    map: map
						});
					}
					
					//오버레이 닫기
					function closeOverlay() {
						$("#windowInfo").remove();
					}
					
				</script>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>
<!-- 주소 검색 Modal -->
<div id="testModal" style="display: none; border-radius:50px;">
	<div>
		<div id="popup_wrap_wh">
			<input id="zipCode" type="hidden" value="10483">
			<div class="delivery_add">
				<h1 class="title">배달 주소 등록</h1>
				<div class="popup_content">
					<div class="address_input">
						<div class="write_info_wrap">
							<a class="btn_add bgc_white small i_search addressSearchBtn" href="javascript:void(0);" onclick="execDaumPostcode()">
								<span>주소검색</span>
							</a>
							<div class="input_set">
								<dl>
									<dt>기본주소</dt>
									<dd class="addressSearchBtn">
										<span class="form_text"> <input id="baseAddr" placeholder="주소검색" readonly type="text" onclick="execDaumPostcode()"></span>
									</dd>
									<dt>상세주소</dt>
									<dd>
										<span class="form_text"> <input id="dtlAddr" placeholder="상세주소입력" type="text"></span>
									</dd>
								</dl>
							</div>
						</div>
						<p class="counsel_copy" style="display: none;">배달 받으실 주소를 입력하여 주세요.</p>
					</div>
				</div>
			</div>
			<div class="btn_area">
				<a class="btn bgc_white exit" id="close" href="javascript:void(0);" rel="modal:close" style="width:130px;"><span>취소</span></a>
				<a class="btn bgc_point" href="javascript:void(0);" onclick="searchInfo()" style="width:130px;"><span>확인</span></a>
			</div>
		</div>
	</div>
	<button class="btn_close"></button>
</div>
<!-- 주문하기 -->
<form action="orderStart.do" method="post" id="orderForm" style="display: none;">
	<input type="hidden" name="whatWay" value="Home-Way">
	<input type="hidden" id="franchiseNo" name="franchiseNo" value="">
	<input type="hidden" id="basicAddr" name="basicAddr" value="">
	<input type="hidden" id="detailAddr" name="detailAddr" value="">
	<input type="hidden" id="fullAddr" name="fullAddr" value="">
</form>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>