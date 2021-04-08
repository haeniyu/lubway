<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getOrderList" value="/lubway/getOrderList.sdo">
	<c:param name="page" value="${pagination.page}" />
	<c:param name="range" value="${pagination.range}" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
</c:url>
<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
   //이전 버튼 이벤트
   function fn_prev(page, range, rangeSize) {
      var page = ((range - 2) * rangeSize) + 1;
      var range = range - 1;
      var url = "${pageContext.request.contextPath}/getOrderList.sdo";
      url = url + "?page=" + page;
      url = url + "&range=" + range;

      location.href = url;

   }

   //페이지 번호 클릭
   function fn_pagination(page, range, rangeSize) {
      var url = "${pageContext.request.contextPath}/getOrderList.sdo";
      url = url + "?page=" + page;
      url = url + "&range=" + range;

      location.href = url;
      
   }
   
   //다음 버튼 이벤트
   function fn_next(page, range, rangeSize) {
      var page = parseInt((range * rangeSize)) + 1;
      var range = parseInt(range) + 1;
      var url = "${pageContext.request.contextPath}/getOrderList.sdo";
      url = url + "?page=" + page;
      url = url + "&range=" + range;

      location.href = url;
   }
   
	function changePayment(no, obj){
		console.log(no);
		
		var form = document.createElement("form");
			form.setAttribute("method", "Post");
		    form.setAttribute("action", "/lubway/updatepayment.sdo");
		
		var payField = document.createElement("input");
		payField.setAttribute("type", "hidden");
		payField.setAttribute("name", "no");
		payField.setAttribute("value", no);
		
	    form.appendChild(payField);
	    document.body.appendChild(form);
		form.submit();
	}

	function changeStatus(no, obj){
		console.log(no);
		
		var select = $(obj).val();
		console.log(select);
		
		var form = document.createElement("form");
			form.setAttribute("method", "Post");
		    form.setAttribute("action", "/lubway/updatestatus.sdo");
		
		var payField = document.createElement("input");
		payField.setAttribute("type", "hidden");
		payField.setAttribute("name", "no");
		payField.setAttribute("value", no);
		
		var statusField = document.createElement("input");
		statusField.setAttribute("type", "hidden");
		statusField.setAttribute("name", "select");
		statusField.setAttribute("value", select);
		
	    form.appendChild(payField);
	    form.appendChild(statusField);
	    document.body.appendChild(form);
		form.submit();
	}
	
	$(document).ready(function(){
		var count = $("select[name=count]").length;
		console.log(count);
		for(var i=0; i<count; i++) {
			var sta = $("#order_status" + i).val();
			console.log(sta);
			$("#status" + i).val(sta).prop("selected", true);
		}
	});
</script>
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/store/header.jsp"%>

	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">주문 조회</h1>
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-warning">오늘의 주문</h6>
			</div>
			<form action="/lubway/updateOrder.sdo" method="post">
				<div class="card-body">
					<div class="fixed-table-container">
						<div class="fixed-table-body">
						<table class="table table-bordered" id="dataTable" style="width:auto;">
							<thead>
								<tr align="center" style="font-size: 14px">
									<th>번호</th>
									<th>이름</th>
									<th>주문 시간</th>
									<th>결제 상태</th>
									<th>주문 상태</th>
									<th>주문 메뉴</th>
									<th>기본 선택</th>
									<th>추가 선택</th>
									<th>세트 선택</th>
									<th>총 금액</th>
									<th>수령 방법</th>
									<th>결제 수단</th>
									<th>요청 사항</th>
									<th>도착 예정 시간</th>
									<th>아이디</th>
									<th>주소</th>
									<th>연락처</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orderList}" var="list" varStatus="status">
									<tr style="font-size: 14px">
										<td>${list.no }</td>
										<td>${list.name }</td>
										<td><fmt:formatDate type="both" value="${list.order_time }" pattern="HH:mm:ss" /></td>
										<td>
											<c:if test="${list.payment_status eq 'true'}">
												결제 완료
											</c:if>
											<c:if test="${list.payment_status eq 'false'}">
												<input type="button" value="결제" onclick="changePayment(${list.no }, this)">
											</c:if>
										</td>
										<td>
											<input id="order_status${status.index}" type="hidden" value="${list.status }" >
											<select id="status${status.index}" name="count" onchange="changeStatus(${list.no }, this)">
												<option value="주문 접수">주문 접수</option>
												<option value="주문 완료">주문 완료</option>
												<option value="배달 중">배달 중</option>
												<option value="배달 완료">배달 완료</option>
												<option value="주문 취소">주문 취소</option>
											</select>
										</td>
										<td>${list.menu_name }</td>
										<td>${list.step01 }</td>
										<td>${list.add_topping }
											<c:if test="${list.add_topping ne null and (list.add_meat ne null or list.add_cheese ne null)}">
												,
											</c:if>
											${list.add_meat }
											<c:if test="${list.add_meat ne null and list.add_cheese ne null}">
												,
											</c:if>
											${list.add_cheese }
										</td>
										<td>${list.step03 }</td>
										<td>${list.total_price  }</td>
										<td>${list.order_type }</td>
										<td>${list.payment_list }</td>
										<td>${list.request }</td>
										<td><fmt:formatDate type="both" value="${list.delivery_time }" pattern="HH:mm:ss" /></td>
										<td>${list.id }</td>
										<td>${list.address }</td>
										<td>${list.tel }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</form>
			
			<!-- pagination -->
			<div align="center">
				<ul class="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_prev('${pagination.page}','${pagination.range}','${pagination.rangeSize}')">Prev</a></li>
					</c:if>
					<c:forEach begin="${pagination.startPage}"
						end="${pagination.endPage}" var="idx">
						<li
							class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
							class="page-link" href="#"
							onClick="fn_pagination('${idx}','${pagination.range}','${pagination.rangeSize}')">
								${idx} </a></li>
					</c:forEach>
					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->
<%@ include file="/WEB-INF/views/store/footer.jsp"%>
</body>
</html>