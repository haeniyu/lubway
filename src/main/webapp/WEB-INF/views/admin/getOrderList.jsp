<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getTotalList" value="/lubway/getTotalList.mdo">
	<c:param name="page" value="${pagination.page}" />
	<c:param name="range" value="${pagination.range}" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
</c:url>

<!DOCTYPE html>
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
   //이전 버튼 이벤트

   function fn_prev(page, range, rangeSize) {

      var page = ((range - 2) * rangeSize) + 1;

      var range = range - 1;

      var url = "${pageContext.request.contextPath}/getTotalList.mdo";

      url = url + "?page=" + page;

      url = url + "&range=" + range;

      location.href = url;

   }

   //페이지 번호 클릭
   function fn_pagination(page, range, rangeSize) {
      
      var url = "${pageContext.request.contextPath}/getTotalList.mdo";

      url = url + "?page=" + page;

      url = url + "&range=" + range;

      location.href = url;
      
      
   }
   
   
   //다음 버튼 이벤트

   function fn_next(page, range, rangeSize) {

      var page = parseInt((range * rangeSize)) + 1;

      var range = parseInt(range) + 1;

      var url = "${pageContext.request.contextPath}/getTotalList.mdo";

      url = url + "?page=" + page;

      url = url + "&range=" + range;

      location.href = url;
   }
</script>
</head>
<body id="page-top">

	<%@ include file="/WEB-INF/views/admin/header.jsp"%>

	<!-- 관리자 버전 화면 만들기  -->
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">주문 조회</h1>
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-warning">Order List Board</h6>
			</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
							<thead>
								<tr align="center" style="font-size: 12px">
									<th>주문 코드</th>
									<th>아이디</th>
									<th>이름</th>
									<th>주문 시간</th>
									<th>도착 예정 시간</th>
									<th>주소</th>
									<th>연락처</th>
									<th>주문 메뉴</th>
									<th>기본 선택</th>
									<th>추가 선택</th>
									<th>세트 선택</th>
									<th>총 금액</th>
									<th>수령 방법</th>
									<th>결제 수단</th>
									<th>주문 매장</th>
									<th>요청 사항</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orderList}" var="list">
									<tr style="font-size: 12px">
										<td>${list.no }</td>
										<td>${list.id }</td>
										<td>${list.name }</td>
										<td><fmt:formatDate type="both" value="${list.order_time }"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><fmt:formatDate type="both" value="${list.delivery_time }"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${list.address }</td>
										<td>${list.tel }</td>
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
										<td>${list.menu_price }</td>
										<td>${list.order_type }</td>
										<td>${list.payment_list }</td>
										<td>${list.store_name }</td>
										<td>${list.request }</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
			
			<!-- 페이지 네비게이션 (페이지 알고리즘 관련) 출력 -->
			<!-- pagination{s} -->
			<!-- 페이지 네비게이션 (페이지 알고리즘 관련) 출력 -->
					<!-- pagination{s} -->
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
	</div>
	</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>