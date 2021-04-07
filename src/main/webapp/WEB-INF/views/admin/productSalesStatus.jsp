<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	function fn_prev(page, range, rangeSize, menu_type, menu_name, order_type, payment_list, start, end) {
		console.log("이전 버튼 클릭");
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
	
		$.ajax({
			url : '/lubway/productSearchStat.mdo',
			type : 'post',
			data : {
				page : page,
				range : range,
				menu_type : menu_type,
				menu_name : menu_name,
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
	function fn_pagination(page, range, rangeSize, menu_type, menu_name, order_type, payment_list, start, end) {
		console.log("페이지 번호 클릭");
	
		$.ajax({
			url : '/lubway/productSearchStat.mdo',
			type : 'post',
			data : {
				page : page,
				range : range,				
				menu_type : menu_type,
				menu_name : menu_name,
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
	function fn_next(page, range, rangeSize, menu_type, menu_name, order_type, payment_list, start, end) {
		console.log("다음 버튼 클릭");
	
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
	  
		$.ajax({
			url : '/lubway/productSearchStat.mdo',
			type : 'post',
			data : {
				page : page,
				range : range,
				menu_type : menu_type,
				menu_name : menu_name,
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

	//Line Chart
	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Month');
		data.addColumn('number', 'Sandwich');
		data.addColumn('number', 'Salad');
		data.addColumn('number', 'Wrap');
		data.addColumn('number', 'Side');

		data.addRows([
			<c:forEach items="${stat}" var="result">
				['${result.formatDate}', ${result.sandwich}, ${result.salad}, ${result.wrap}, ${result.side}],
			</c:forEach>
		]);

		var options = {
			title: '메뉴별 매출 현황',
			hAxis: {title: '메뉴별 매출 현황',  titleTextStyle: {color: '#333'}},
		};
	
		var chart = new google.visualization.LineChart(document.getElementById('LineChart'));
		chart.draw(data, options);
	}
	
	//검색 Line Chart - Ajax
	function searchDrawChart(searchData) {
		console.log(searchData);
		
		console.log(searchData[0]);
	
		var data = new google.visualization.DataTable([]);
		   
		data.addColumn("string", "Month");
		data.addColumn('number', 'Sandwich');
		data.addColumn('number', 'Salad');
		data.addColumn('number', 'Wrap');
		data.addColumn('number', 'Side');
		
		var dataRow = [];
		
		for(var i=0; i<searchData.length; i++) {
			console.log(searchData[i]);
			dataRow = [searchData[i].formatDate, searchData[i].sandwich, searchData[i].salad, searchData[i].wrap, searchData[i].side];
			data.addRow(dataRow);
		}
	
		var options = {
			title: '메뉴별 매출 현황',
			hAxis: {title: '메뉴별 매출 현황',  titleTextStyle: {color: '#333'}},
		};
	
		var chart = new google.visualization.LineChart(document.getElementById('LineChart'));
		chart.draw(data, options);
	}
	
	//Pie Chart
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawMultSeries);
	
	function drawMultSeries() {
		var data = new google.visualization.arrayToDataTable([]);
		
		data.addColumn('string', 'Month');
		data.addColumn('number', '판매량');
		
		data.addRows([
			['Sandwich', ${type.sandwich}],
			['Salad', ${type.salad}],
			['Wrap', ${type.wrap}],
			['Side', ${type.side}]
		]);
		
		var options = {
			title: '메뉴별 주문 비율'
		};
		
        var chart = new google.visualization.PieChart(document.getElementById('PieChart'));
        chart.draw(data, options);
	}
	
	//검색 Pie Chart - Ajax
	function searchDrawMultSeries(searchData) {
		var data = new google.visualization.arrayToDataTable([]);
		
		console.log(searchData[0]);
		
		data.addColumn('string', 'Month');
		data.addColumn('number', '판매량');
		
		data.addRows([
			['Sandwich', searchData[0].sandwich],
			['Salad', searchData[0].salad],
			['Wrap', searchData[0].wrap],
			['Side', searchData[0].side]
		]);
		
		var options = {
			title: '메뉴별 주문 비율',
		};
		
		var chart = new google.visualization.PieChart(document.getElementById('PieChart'));
		chart.draw(data, options);
	}
	
	//주문내역 검색 결과 - Ajax
	function searchCreateTable(searchData, searchPage) {
		var elem = "";
		var elem2 = "";
		var idx = searchPage[0].startPage;

		console.log("이거 어케하냐");
		console.log(searchData);
		console.log(searchPage[0]);
		
		$("#cnt").text(searchPage[0].listCnt);
		
		$("#searchTable").empty();
		for(var i=0; i<searchData.length; i++) {
			elem += '<tr><td>';
			elem += searchData[i].request;
			elem += '</td><td>';
			elem += searchData[i].menu_type;
			elem += '</td><td>';
			elem += searchData[i].menu_name;
			elem += '</td><td>';
			elem += searchData[i].order_type;
			elem += '</td><td>';
			elem += searchData[i].payment_list;
			elem += '</td><td>';
			elem += searchData[i].total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			elem += '원</td></tr>';
			document.getElementById("searchTable").innerHTML = elem;
		}
		
		$("#page").empty();
		if(searchPage[0].prev) {
			elem2 += '<li class="page-item">';
			elem2 += '<a class="page-link" href="#" onClick=';
			elem2 += '"fn_prev(';
			elem2 += idx + "," + searchPage[0].range + "," + searchPage[0].rangeSize + ",";
			if(searchPage[0].menu_type == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].menu_type + "',";
			if(searchPage[0].menu_name == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].menu_name + "',";
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
			if(searchPage[0].menu_type == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].menu_type + "',";
			if(searchPage[0].menu_name == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].menu_name + "',";
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
			if(searchPage[0].menu_type == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].menu_type + "',";
			if(searchPage[0].menu_name == "") elem2 += "''" + ",";
			else elem2 += "'" + searchPage[0].menu_name + "',";
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
		var menu_type = $("#category").val();
		var menu_name = $("#menu").val();
		var order_type = $("#order").val();
		var payment_list = $("#pay").val();
			
		$.ajax({
			url : '/lubway/productSearchStat.mdo',
			type : 'post',
			data : {
				start : start,
				end : end,
				menu_type : menu_type,
				menu_name : menu_name,
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
				searchDrawMultSeries(data[1]);
				searchCreateTable(data[2], data[3]);
			},
			error : function(data, status, opt) {
				alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+opt);
			}
		});
	}
</script>
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">
    	<!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">품목별 매출 현황</h1>
        <p class="mb-4"></p>
        <div class="card shadow mb-4">
        	<div class="card-header py-3">
            	<h6 class="m-0 font-weight-bold text-warning">Sales Status By Product</h6>
            </div>
            <div class="card-body">
               	<div class="chart chart1" id="LineChart" style="width: 40%; height: 300px;"></div>
               	<div class="chart chart2" id="PieChart" style="width: 40%; height: 300px;"></div>
                     	
				<!-- 기간, 메뉴 타입, 메뉴 선택 및 검색 시작 -->
				<div class="searchDate">
					<!-- 날짜 선택 -->
					<strong>날짜 선택 : </strong>
					<input type="date" name="start" class="selectDate start" style="margin-left: 5px;">
					<strong> - </strong>
					<input type="date" name="end" class="selectDate end">
				</div>
				<div class="searchMenu">
					<!-- 메뉴 선택 -->
					<strong>메뉴 선택 : </strong>
					<select class="btn btn-primary dropdown-toggle" style="margin: 5px 5px 10px 5px" id="category">
						<option>메뉴 카테고리</option>
						<option>sandwich</option>
						<option>salad</option>
						<option>wrap</option>
						<option>side</option>
					</select>
					<!-- 선택한 메뉴에 따른 메뉴명 선택 -->
					<select class="btn btn-primary dropdown-toggle" style="margin: 5px 0 10px 0" id="menu">
						<option>메뉴명 선택</option>
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
					<input style="margin: 5px 0 10px 0; padding: 5px" name="searchBtn" class="btn btn-warning btn-icon-split" type="submit" onclick="searchStat()" value="search" />
				</div>
				<span class="num">총 <strong id="cnt">${listCnt}</strong> 건</span>
				<!-- 기간, 메뉴 타입, 메뉴 선택 및 검색  종료 -->
				
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th style="width: 15%">주문 날짜</th>
                                <th style="width: 15%">매뉴 타입</th>
                                <th style="width: 25%">메뉴명</th>
                                <th style="width: 15%">수령 방식</th>
                                <th style="width: 15%">결제 방식</th>
                                <th style="width: 20%">결제 금액</th>
                            </tr>
                        </thead>
                        <tbody id="searchTable">
 							<c:forEach items="${orderList}" var="result">
								 <tr>
									<td>${result.request}</td>
									<td>${result.menu_type}</td>
									<td>${result.menu_name}</td>
									<td>${result.order_type}</td>
									<td>${result.payment_list}</td>
									<td><fmt:formatNumber type="currency" value="${result.total_price}"/>원</td>
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
								<a class="page-link" href="#" onClick="fn_prev('${pagination.page}','${pagination.range}', '${pagination.rangeSize}', '${pagination.menu_type}', '${pagination.menu_name}', '${pagination.order_type}', '${pagination.payment_list}', '${pagination.start}', '${pagination.end}')">Prev</a>
							</li>
						</c:if>
						
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
							<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
								<a class="page-link" href="#" onClick="fn_pagination('${idx}','${pagination.range}', '${pagination.rangeSize}', '${pagination.menu_type}', '${pagination.menu_name}', '${pagination.order_type}', '${pagination.payment_list}', '${pagination.start}', '${pagination.end}')"> ${idx}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pagination.next}">
							<li class="page-item">
								<a class="page-link" href="#" onClick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}', '${pagination.menu_type}', '${pagination.menu_name}', '${pagination.order_type}', '${pagination.payment_list}', '${pagination.start}', '${pagination.end}')">Next</a>
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