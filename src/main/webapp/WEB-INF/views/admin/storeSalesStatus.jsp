<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/salesStatus.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, store_name, order_type, payment_list, start, end) {
		console.log("이전 버튼 클릭");
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		$.ajax({
			url : '/lubway/searchStat.mdo',
			type : 'post',
			data : {
				page : page,
				range : range,
				store_name : store_name,
				order_type : order_type,
				payment_list : payment_list,
				start : start,
				end : end
			},
			async : false,
			success : function(data) {
				console.log("페이징 ajax 통신 성공");
				searchCreateTable(data[1], data[2]);
			},
			error : function(data, status, opt) {
				alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+opt);
			}
		});
		
   }

   //페이지 번호 클릭
   function fn_pagination(page, range, rangeSize, store_name, order_type, payment_list, start, end) {
		console.log("페이지 번호 클릭");

		$.ajax({
			url : '/lubway/searchStat.mdo',
			type : 'post',
			data : {
				page : page,
				range : range,				
				store_name : store_name,
				order_type : order_type,
				payment_list : payment_list,
				start : start,
				end : end
			},
			async : false,
			success : function(data) {
				console.log("페이징 ajax 통신 성공");
				searchCreateTable(data[1], data[2]);
			},
			error : function(data, status, opt) {
				alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+opt);
			}
		});

	}
   
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize, store_name, order_type, payment_list, start, end) {
		console.log("다음 버튼 클릭");

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
      
		$.ajax({
			url : '/lubway/searchStat.mdo',
			type : 'post',
			data : {
				page : page,
				range : range,
				store_name : store_name,
				order_type : order_type,
				payment_list : payment_list,
				start : start,
				end : end
			},
			async : false,
			success : function(data) {
				console.log("페이징 ajax 통신 성공");
				searchCreateTable(data[1], data[2]);
			},
			error : function(data, status, opt) {
				alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+opt);
			}
		});
      
	}

   //Area Chart
   google.charts.load('current', {'packages':['corechart']});
   google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['Month', '총 매출', '실 수익', '쿠폰 사용량', '포인트 사용량'],
			<c:forEach items="${stat}" var="result">
				['${result.formatDate}', ${result.total}, ${result.real_total}, ${result.coupon}, ${result.point}],
			</c:forEach>
		]);
		
		var options = {
			title: '총 매출 현황',
			hAxis: {title: 'LUBWAY - 총 매출 현황',  titleTextStyle: {color: '#333'}},
			vAxis: {minValue: 0}
		};
	
		var chart = new google.visualization.AreaChart(document.getElementById('AreaChart'));
			chart.draw(data, options);
	}
	
	//검색 Area Chart - Ajax
	function searchDrawChart(searchData) {
		console.log(searchData);
		
		console.log(searchData[0]);
	
		var data = new google.visualization.arrayToDataTable([]);
		   
		data.addColumn("string", "Month");
		data.addColumn("number", "총 매출");
		data.addColumn("number", "실 수익");
		data.addColumn("number", "쿠폰 사용량");
		data.addColumn("number", "포인트 사용량");
		
		var dataRow = [];
		
		for(var i=0; i<searchData.length; i++) {
			console.log(searchData[i]);
			console.log(searchData[i].formatDate, searchData[i].total);
			dataRow = [searchData[i].formatDate, searchData[i].total, searchData[i].real_total, searchData[i].coupon, searchData[i].point];
			data.addRow(dataRow);
		}
	
		var options = {
			title: searchData[0].formatDate + " - " + searchData[searchData.length-1].formatDate,
			hAxis: {title: 'LUBWAY - 총 매출 현황',  titleTextStyle: {color: '#333'}},
			vAxis: {minValue: 0}
		};
	
		var chart = new google.visualization.AreaChart(document.getElementById('AreaChart'));
		chart.draw(data, options);
	}
	
	//Column Chart
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawMultSeries);
	
	function drawMultSeries() {
		var data = new google.visualization.DataTable();
		
		data.addColumn('string', 'Month');
		data.addColumn('number', 'Fast-Way');
		data.addColumn('number', 'Home-Way');
		
		data.addRows([
			<c:forEach items="${stat}" var="result">
				['${result.formatDate}', ${result.fast}, ${result.home}],
			</c:forEach>
	      ]);
		
		var options = {
			title: 'Fast-Way / Home-Way 주문 비율',
			hAxis: {
				title: '주문방식 비율',
				titleTextStyle: {color: '#333'}
			},
		};
		var chart = new google.visualization.ColumnChart(document.getElementById('ColumnChart'));
		chart.draw(data, options);
	}
	
	//검색 Column Chart - Ajax
	function searchDrawMultSeries(searchData) {
		var data = new google.visualization.DataTable();
		
		data.addColumn('string', 'Month');
		data.addColumn('number', 'Fast-Way');
		data.addColumn('number', 'Home-Way');
		
		var dataRow = [];
		
		for(var i=0; i<searchData.length; i++) {
			dataRow = [searchData[i].formatDate, searchData[i].fast, searchData[i].home];
			data.addRow(dataRow);
		}
		
		var options = {
			title: 'Fast-Way / Home-Way 주문 비율',
			hAxis: {
				title: '주문방식 비율',
				titleTextStyle: {color: '#333'}
			},
		};
		var chart = new google.visualization.ColumnChart(document.getElementById('ColumnChart'));
		chart.draw(data, options);
	}
	
	//주문내역 검색 결과 - Ajax
	function searchCreateTable(searchData, searchPage) {
		var elem = "";
		var elem2 = "";
		var idx = searchPage[0].startPage;
		
		console.log(searchPage[0].page);
		console.log(searchPage[0].startPage);
		console.log(searchPage[0].endPage);
		
		console.log("이거 어케하냐");
		console.log(searchData);
		console.log(searchPage[0]);
		
		$("#cnt").text(searchPage[0].listCnt);
		
		$("#searchTable").empty();
		for(var i=0; i<searchData.length; i++) {
			elem += '<tr><td>';
			elem += searchData[i].request;
			elem += '</td><td>';
			elem += searchData[i].store_name;
			elem += '</td><td>';
			elem += searchData[i].order_type;
			elem += '</td><td>';
			elem += searchData[i].payment_list;
			elem += '</td><td>￦';
			elem += searchData[i].menu_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			elem += '원</td></tr>';
			document.getElementById("searchTable").innerHTML = elem;
		}
		
		$("#page").empty();
		if(searchPage[0].prev) {
			elem2 += '<li class="page-item">';
			elem2 += '<a class="page-link" href="#" onClick=';
			elem2 += '"fn_prev(';
			elem2 += idx + "," + searchPage[0].range + "," + searchPage[0].rangeSize + ",";
			if(searchPage[0].store_name == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].store_name + "',";
			if(searchPage[0].order_type == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].order_type + "',"; 
			if(searchPage[0].payment_list == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].payment_list + "',";
			elem2 += "'" + searchPage[0].start + "','" + searchPage[0].end + "'";
			elem2 += ')">';
			elem2 += 'Prev</a></li>';
			document.getElementById("page").innerHTML = elem2;
		}
		
		for(var i=searchPage[0].startPage; i<=searchPage[0].endPage; i++) {
			console.log("으어어");
			if(searchPage[0].page == idx) elem2 += '<li class="page-item active">';
			else elem2 += '<li class="page-item">';
			elem2 += '<a class="page-link" href="#" onClick=';
			elem2 += '"fn_pagination(';
			elem2 += idx + "," + searchPage[0].range + "," + searchPage[0].rangeSize + ",";
			if(searchPage[0].store_name == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].store_name + "',";
			if(searchPage[0].order_type == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].order_type + "',"; 
			if(searchPage[0].payment_list == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].payment_list + "',";
			elem2 += "'" + searchPage[0].start + "','" + searchPage[0].end + "'";
			elem2 += ')">';
			elem2 += idx + '</a></li>';
			idx++;
			document.getElementById("page").innerHTML = elem2;
		}
		
		if(searchPage[0].next) {
			elem2 += '<li class="page-item">';
			elem2 += '<a class="page-link" href="#" onClick=';
			elem2 += '"fn_next(';
			elem2 += idx + "," + searchPage[0].range + "," + searchPage[0].rangeSize + ",";
			if(searchPage[0].store_name == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].store_name + "',";
			if(searchPage[0].order_type == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].order_type + "',"; 
			if(searchPage[0].payment_list == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].payment_list + "',";
			elem2 += "'" + searchPage[0].start + "','" + searchPage[0].end + "'";
			elem2 += ')">';
			elem2 += 'Next</a></li>';
			document.getElementById("page").innerHTML = elem2;
		}
	}
		
	//검색 function
	function searchStat() {
		
		var start = $("input[name=start]").val();
		var end = $("input[name=end]").val();
		var store_name = $("#store").val();
		var order_type = $("#order").val();
		var payment_list = $("#pay").val();
			
		$.ajax({
			url : '/lubway/searchStat.mdo',
			type : 'post',
			data : {
				start : start,
				end : end,
				store_name : store_name,
				order_type : order_type,
				payment_list : payment_list
			},
			async : false,
			success : function(data) {
				console.log("ajax 통신 성공");
				console.log(data);
				if(data[0].length == 0) {
					alert("해당 조건의 검색 결과가 없습니다.");
					return;
				}
				searchDrawChart(data[0]);
				searchDrawMultSeries(data[0]);
				searchCreateTable(data[1], data[2]);
			},
			error : function(data, status, opt) {
				alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+opt);
			}
		});
	}
	
	function SaveAsExcel(){
		var start = $("input[name=start]").val();
		var end = $("input[name=end]").val();
		var store_name = $("#store").val();
		var order_type = $("#order").val();
		var payment_list = $("#pay").val();
		
		location.href="/lubway/excelDownload.mdo?start="+start+"&end="+end+"&store_name="+store_name+"&order_type="+order_type+"&payment_list="+payment_list;

	}
	
	function SaveAsPdf(){
		var start = $("input[name=start]").val();
		var end = $("input[name=end]").val();
		var store_name = $("#store").val();
		var order_type = $("#order").val();
		var payment_list = $("#pay").val();
		
		location.href="/lubway/pdfDownload.mdo?start="+start+"&end="+end+"&store_name="+store_name+"&order_type="+order_type+"&payment_list="+payment_list;

	}
</script>
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<!-- Begin Page Content -->
   	<div class="container-fluid">
   		<!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">매장별 매출 현황</h1>
        <p class="mb-4"></p>
        <div class="card shadow mb-4">
        	<div class="card-header py-3 justify-content-between">
            	<h6 class="m-0 font-weight-bold text-warning" style="display:inline;">Sales Status By Store</h6>
            	<a class="btn btn-sm btn-success" onclick="SaveAsExcel();" style="float:right;margin-left:5px;">
					<i class="fas fa-download fa-sm text-white-50"></i> Excel
				</a>&nbsp;&nbsp;&nbsp;
            	<a class="btn btn-sm btn-danger" onclick="SaveAsPdf();" style="float:right;">
					<i class="fas fa-download fa-sm text-white-50"></i> PDF
				</a>
            </div>
            <div class="card-body">
               	<div class="chart chart1" id="AreaChart" style="width:47%; height: 300px;"></div>
               	<div class="chart chart2" id="ColumnChart" style="width:47%; height: 300px;"></div>
				<!-- 기간, 지역, 매장 선택 및 검색 시작 -->
				<div class="searchDate">
					<!-- 날짜 선택 -->
					<strong>날짜 선택 : </strong>
					<input type="date" name="start" class="selectDate start" style="margin-left: 5px;">
					<strong> - </strong>
					<input type="date" name="end" class="selectDate end">
				</div>
				<div class="searchStore">
					<strong>매장 선택 : </strong>
					<!-- 매장명 선택 -->
					<select class="btn btn-primary dropdown-toggle" style="margin: 5px 0 10px 5px" id="store">
						<option>매장명 선택</option>
						<option>광화문</option>
						<option>경복궁</option>
						<option>독립문</option>
						<option>안국</option>
						<option>종로</option>
						<option>종로5가</option>
						<option>북촌</option>
						<option>동묘앞역</option>
						<option>동대문역</option>
						<option>대학로</option>
						<option>성대</option>
					</select>
					<!-- 수령 방식 선택 -->
					<select class="btn btn-primary dropdown-toggle"	style="margin: 5px 0 10px 0" id="order">
						<option>수령 방식 선택</option>
						<option>방문포장</option>
						<option>매장식사</option>
						<option>배달</option>
					</select>
					<!-- 결제 방식 선택 -->
					<select class="btn btn-primary dropdown-toggle" style="margin: 5px 0 10px 0" id="pay">
						<option>결제 방식 선택</option>
						<option>현금</option>
						<option>카카오페이</option>
					</select>
					<input style="margin: 5px 5px 10px 0; padding: 5px" class="btn btn-warning btn-icon-split" type="submit" onclick="searchStat()" value="search" />
				</div>
				<span class="num">총 <strong id="cnt">${listCnt}</strong> 건</span>
				<!-- 기간, 지역, 매장 선택 및 검색  종료 -->
				
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th style="width: 8%">주문 날짜</th>
                                <th style="width: 12%">매장명</th>
                                <th style="width: 10%">수령 방식</th>
                                <th style="width: 10%">결제 방식</th>
                                <th style="width: 15%">결제 금액</th>
                            </tr>
                        </thead>
                        <tbody id="searchTable">
                        <!-- 매장별로 띄워주세욤 -->
							<c:forEach items="${orderList}" var="result">
								 <tr>
									<td>${result.request}</td>
									<td>${result.store_name}</td>
									<td>${result.order_type}</td>
									<td>${result.payment_list}</td>
									<td><fmt:formatNumber type="currency" value="${result.menu_price}"/>원</td>
								 </tr>
							</c:forEach>
                        </tbody>
                    </table>
                </div>
				<!-- 페이지 네비게이션 (페이지 알고리즘 관련) 출력 -->
				<div align="center">
					<ul class="pagination" id="page">
					
						<c:if test="${pagination.prev}">
							<li class="page-item">
								<a class="page-link" href="#" onClick="fn_prev('${pagination.page}','${pagination.range}', '${pagination.rangeSize}', '${pagination.store_name}', '${pagination.order_type}', '${pagination.payment_list}', '${pagination.start}', '${pagination.end}')">Prev</a>
							</li>
						</c:if>
						
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
							<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
								<a class="page-link" href="#" onClick="fn_pagination('${idx}','${pagination.range}', '${pagination.rangeSize}', '${pagination.store_name}', '${pagination.order_type}', '${pagination.payment_list}', '${pagination.start}', '${pagination.end}')"> ${idx}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pagination.next}">
							<li class="page-item">
								<a class="page-link" href="#" onClick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}', '${pagination.store_name}', '${pagination.order_type}', '${pagination.payment_list}', '${pagination.start}', '${pagination.end}')">Next</a>
							</li>
						</c:if>
						
					</ul>
				</div>
        	</div>
    	</div>
	</div>
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>