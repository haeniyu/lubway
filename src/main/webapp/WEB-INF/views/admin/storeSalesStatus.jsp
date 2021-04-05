<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!--<c:url var="getNoticeList" value="/lubway/search.mdo">
	<c:param name="page" value="${pagination.page}" />
	<c:param name="range" value="${pagination.range}" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
	<c:param name="searchKeyword" value="${pagination.searchKeyword}" />
	<c:param name="fix" value="${pagination.fix }" />
</c:url>-->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/salesStatus.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
var searchAjax = false;

   //이전 버튼 이벤트
   function fn_prev(page, range, rangeSize, searchKeyword) {
      var page = ((range - 2) * rangeSize) + 1;
      var range = range - 1;
      var url = "${pageContext.request.contextPath}/search.mdo";
      url = url + "?page=" + page;
      url = url + "&range=" + range;
      url = url + "&searchKeyword=" + searchKeyword;
      location.href = url;
   }

   //페이지 번호 클릭
   function fn_pagination(page, range, rangeSize, searchKeyword, fix) {
      var url = "${pageContext.request.contextPath}/search.mdo";
      url = url + "?page=" + page;
      url = url + "&range=" + range;
      url = url + "&searchKeyword=" + searchKeyword;
      location.href = url;
   }
   
   //다음 버튼 이벤트
   function fn_next(page, range, rangeSize, searchKeyword) {
      var page = parseInt((range * rangeSize)) + 1;
      var range = parseInt(range) + 1;
      var url = "${pageContext.request.contextPath}/search.mdo";
      url = url + "?page=" + page;
      url = url + "&range=" + range;
      url = url + "&searchKeyword=" + searchKeyword;
      location.href = url;
   }
   
   //Area Chart
   google.charts.load('current', {'packages':['corechart']});
   google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	   
		var data = google.visualization.arrayToDataTable([
			['Month', '월 매출'],
			<c:forEach items="${stat}" var="result" varStatus="status">
				['${result.formatDate}', ${result.total_price}],
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
		console.log(searchAjax);
		console.log(searchData);
		
		console.log(searchData[0]);
	
		var data = new google.visualization.arrayToDataTable([]);
		   
		data.addColumn("string", "Month");
		data.addColumn("number", "월 매출");
		
		var dataRow = [];
		
		for(var i=0; i<searchData.length; i++) {
			console.log(searchData[i]);
			console.log(searchData[i].formatDate, searchData[i].total_price);
			dataRow = [searchData[i].formatDate, searchData[i].total_price];
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
	      data.addColumn('timeofday', 'Time of Day');
	      data.addColumn('number', 'Fast-Way');
	      data.addColumn('number', 'Home-Way');
	
	      data.addRows([
	        [{v: [8, 0, 0], f: '1월'}, 1, .25],
	        [{v: [9, 0, 0], f: '2월'}, 2, .5],
	        [{v: [10, 0, 0], f:'3월'}, 3, 1],
	        [{v: [11, 0, 0], f: '4월'}, 4, 2.25],
	        [{v: [12, 0, 0], f: '5월'}, 5, 2.25],
	        [{v: [13, 0, 0], f: '6월'}, 6, 3],
	        [{v: [14, 0, 0], f: '7월'}, 7, 4],
	        [{v: [15, 0, 0], f: '8월'}, 8, 5.25],
	        [{v: [16, 0, 0], f: '9월'}, 9, 7.5],
	        [{v: [17, 0, 0], f: '10월'}, 10, 10],
	        [{v: [17, 0, 0], f: '11월'}, 10, 10],
	        [{v: [17, 0, 0], f: '12월'}, 10, 10]
	      ]);
	
	      var options = {
	        title: 'Fast-Way / Home-Way 주문 비율',
	        hAxis: {
	          title: '주문방식 비율',
	          format: 'h:mm a',
	          viewWindow: {
	            min: [7, 30, 0],
	            max: [17, 30, 0]
	          }
	        },
	      };
	      var chart = new google.visualization.ColumnChart(
	        document.getElementById('ColumnChart'));
	
	      chart.draw(data, options);
	    }
	
	//검색 function
	function searchStat() {
		console.log("검색");
		console.log($("input[name=start]").val());
		console.log($("input[name=end]").val());
		
		var start = $("input[name=start]").val();
		var end = $("input[name=end]").val();
		
		$.ajax({
			url : '/lubway/searchStat.mdo',
			type : 'post',
			data : {
				start : start,
				end : end
			},
			async : false,
			success : function(data) {
				console.log("ajax 통신 성공");
				searchAjax = true;
				searchDrawChart(data)
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
        <h1 class="h3 mb-2 text-gray-800">매장별 매출 현황</h1>
        <p class="mb-4"></p>
        <div class="card shadow mb-4">
        	<div class="card-header py-3">
            	<h6 class="m-0 font-weight-bold text-warning">Sales Status By Store</h6>
            </div>
            <div class="card-body">
               	<div class="chart chart1" id="AreaChart" style="width: 50%; height: 300px;"></div>
               	<div class="chart chart2" id="ColumnChart" style="width: 50%; height: 300px;"></div>
				
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
					<!-- 수령 방식 선택 -->
	               <select class="btn btn-primary dropdown-toggle" style="margin: 5px 5px 10px 5px">
	                  <option>수령 방식 선택</option>
	               </select>
	               <!-- 지역구 선택 -->
					<select class="btn btn-primary dropdown-toggle" style="margin: 5px 5px 10px 5px">
						<option>지역구 선택</option>
					</select>
					<!-- 선택한 지역구에 따른 매장명 선택 -->
					<select class="btn btn-primary dropdown-toggle" style="margin: 5px 0 10px 0">
						<option>매장명 선택</option>
					</select>
				</div>
				<div class="searchKeyword" >
					<input type="text" name="searchKeyword" placeholder="매장명으로 검색해 주세요." style="width: 70%" />
					<input style="margin: 5px 5px 10px 0; padding: 5px" class="btn btn-warning btn-icon-split" type="submit" onclick="searchStat()" value="search" />
				</div>
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
                        <tbody>
                        <!-- 매장별로 띄워주세욤 -->
                            <tr>
                                <td>2021-04-05</td>
                                <td>종로임미당</td>
                                <td>배달</td>
                                <td>현금</td>
                                <td>1,000,000</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
				<!-- 페이지 네비게이션 (페이지 알고리즘 관련) 출력 -->
				<div align="center">
					<ul class="pagination">
						<c:if test="${pagination.prev}">
							<li class="page-item">
								<a class="page-link" href="#" onClick="fn_prev('${pagination.page}','${pagination.range}',
									'${pagination.rangeSize}','${pagination.searchKeyword }')">Prev</a>
							</li>
						</c:if>
						<c:forEach begin="${pagination.startPage}"
							end="${pagination.endPage}" var="idx">
							<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
								<a class="page-link" href="#" onClick="fn_pagination('${idx}','${pagination.range}',
									'${pagination.rangeSize}','${pagination.searchKeyword }','${pagination.fix }')"> ${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${pagination.next}">
							<li class="page-item">
								<a class="page-link" href="#" onClick="fn_next('${pagination.page}','${pagination.range}', 
									'${pagination.rangeSize}','${pagination.searchKeyword }')">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
        	</div>
    	</div>
	</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>