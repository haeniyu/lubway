<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<body id="page-top">

	<%@ include file="/WEB-INF/views/admin/header.jsp"%>

	<!-- 관리자 버전 화면 만들기  -->
	<!-- Begin Page Content -->
	<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
			<p class="mb-4">DataTables is a third party plugin that is used
				to generate the demo table below. For more information about
				DataTables, please visit the</p>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-warning">Notice Board</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<div align="right">
						<a href="insertNotice.bdo" class="btn btn-warning btn-icon-split">
							<span class="text">글 등록</span>
						</a>
							<input type="submit" value="글 등록"
								class="btn btn-warning btn-icon-split">
						</div>
						<div class="my-2"></div>
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr align="center">
									<th width="10%">NO</th>
									<th width="70%">Title</th>
									<th width="20%">Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noticeList }" var="notice">
									<tr>
										<td>${notice.no }</td>
										<td align="left"><a href="getNotice.bdo?no=${notice.no }">${notice.title }</a></td>
										<td><fmt:formatDate value="${notice.regDate }"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
		<!-- 검색 시작 -->
		<div align="right">
			<form action="noticeList.bdo" method="post">
				<tr>
					<td><select name="searchCondition">
							<c:forEach items="${conditionMap }" var="option">
								<option value="${option.value }">${option.key }</option>
							</c:forEach>
					</select> <input type="text" name="searchKeyword" /> <input
						style="margin: 3px; padding: 3px"
						class="btn btn-warning btn-icon-split" type="submit"
						value="search" /></td>
				</tr>
			</form>
		</div>
		<!-- 검색 종료 -->
	</div>
	</div>
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