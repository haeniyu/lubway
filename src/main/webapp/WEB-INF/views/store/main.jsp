<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

var labels = new Array();
var data = new Array();
<c:forEach items="${typeList}" var="result" >
var json = new Object();
labels.push("${result.menu_type}");
data.push("${result.count}");
</c:forEach>
var count = new Array();
for(var i = 0; i < data.length; i++){ //문자 - 숫자로 변환
  var cnt = data[i].replace('"','');
  console.log(cnt);
  count.push(cnt);
}
function drawChart() {
	
	 var data = new google.visualization.DataTable();
     //그래프에 표시할 컬럼 추가
     data.addColumn('string', '메뉴타입');
     data.addColumn('number', '판매량');

     //그래프에 표시할 데이터
     var dataRow = [];

     for(var i = 0; i < labels.length; i++){ //데이터 입력
       var type = labels[i];
       var cnt = Number(count[i]);
       console.log(cnt);
       dataRow = [type , cnt];
       data.addRow(dataRow);
     }

    var options = {
		title: '타입별 판매 현황'
	};

	var chart = new google.visualization.PieChart(document.getElementById('piechart'));

	chart.draw(data, options);
}

google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawColColors);

var date = new Array();
var total = new Array();
var average = new Array();

<c:forEach items="${totalavg}" var="ttl" >
var json = new Object();
date.push("${ttl.date}");
total.push("${ttl.total}");
average.push("${ttl.average}");
</c:forEach>

function drawColColors() {
	var data = new google.visualization.DataTable();
	data.addColumn('string', '날짜');
	data.addColumn('number', '판매금액');
	data.addColumn('number', '일평균');
      
	//그래프에 표시할 데이터
	var dataRow = [];

	for(var i = 0; i < date.length; i++){ //데이터 입력
		var type = date[i];
        var ttl = Number(total[i]);
        var avg = Number(average[i]);
        dataRow = [type , ttl, avg];
        data.addRow(dataRow);
      }

      var options = {
        title: '일별 매출 총 합계 & 평균',
        colors: ['#008D43', '#FFCA01']
      };

      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
</script>
</head>
<body id="page-top">

	<%@ include file="/WEB-INF/views/store/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
		</div>
		<hr>
		<br>

		<!-- Content Row -->
		<div class="row">

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">수입 (월)</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<fmt:formatNumber type="currency" value="${monthSales}" />원
								</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-won-sign fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-success text-uppercase mb-1">수입 (연)</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<fmt:formatNumber type="currency" value="${yearSales}" />원
								</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-won-sign fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Pending Requests Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-warning shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-warning text-uppercase mb-1">총 주문량</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">${totalcount } 건</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-comments fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>

		<!-- Content Row -->

		<div class="row">

			<!-- column Chart -->
			<div class="col-xl-8 col-lg-7">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">매출 추이</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_div" style="width: 100%; height: 350px;"></div>
					</div>
				</div>
			</div>

			<!-- Pie Chart -->
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">주문 비율</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="piechart" style="width: 100%; height: 350px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/store/footer.jsp"%>
</body>
</html>