<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
</head>
<body id="page-top">

	<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">쿠폰 리스트</h1>
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-warning">Coupon List</h6>
			</div>
			<form action="/lubway/insertCoupon.mdo" method="post">
				<div class="card-body">
					<div class="table-responsive">
						<div align="right">

							<input type="submit" class="btn btn-warning btn-icon-split"
								style="padding: 5px" value="쿠폰 등록">
						</div>
						<div class="my-2"></div>
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">

							<thead>
								<tr align="center">
									<th width="10%">쿠폰 코드</th>
									<th width="20%">쿠폰 이름</th>
									<th width="15%">쿠폰 사용처</th>
									<th width="15%">쿠폰 할인율</th>
									<th width="20%">쿠폰 등록일</th>
									<th width="20%">쿠폰 만기일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${couponList}" var="coupon">
									<tr align="center">
										<td>${coupon.code }</td>
										<td><a type="hidden" href="getCoupon.mdo?no=${coupon.no}">${coupon.name }</td>
										<td>${coupon.type }</td>
										<td>${coupon.discount }%</td>
										<td><fmt:formatDate value="${coupon.regdate }"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${coupon.enddate }"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- /.container-fluid -->

	<!-- End of Main Content -->

	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${path}/resources/js/sb-admin-2.js"></script>

	<!-- Page level plugins -->
	<script src="${path}/resources/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="${path}/resources/js/demo/chart-area-demo.js"></script>
	<script src="${path}/resources/js/demo/chart-pie-demo.js"></script>

	<%--  검색기능 , 페이징처리 스크립트  
	<!-- Page level plugins -->
    <script src="${path}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${path}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${path}/resources/js/demo/datatables-demo.js"></script>
     --%>
</body>
</html>