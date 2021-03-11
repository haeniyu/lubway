<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	function list(page) {
		console.log("페이지를 이동합니다.");
		location.href = "list.bdo?curPage" + page;
	}
</script>
</head>
<body id="page-top">

	<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<form action="/lubway/insertNotice.bdo" method="post">
	<!-- 관리자 버전 화면 만들기  -->
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-warning">Notice Board</h6>
			</div>
			
			
			<div class="card-body">
				<div class="table-responsive">
					<div align="right">
					
						<input type="submit" class="btn btn-warning btn-icon-split" value="글등록">
							
						
					</div>
					</form>
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
						<form action="/lubway/search.bdo" method="get">
							<tr>
								<td><input type="text" name="searchKeyword" placeholder="검색할 제목을 입력해 주세요." style="width:20%" /> <input
									style="margin: 3px; padding: 3px"
									class="btn btn-warning btn-icon-split" type="submit"
									value="search" /></td>
							</tr>
					</form>
					</div>
					<!-- 검색 종료 -->
					<!-- 페이지 네비게이션 (페이지 알고리즘 관련) 출력 -->
					<div align="center">
						<tr>
							<td colspan="7" align="center"><c:if
									test="${map.pager.curBlock > 1}">
									<a href="#" onclick="list('1')">[처음]</a>
								</c:if> <!-- 현재 블록이 1블록보다 크면 (뒤쪽에 있기때문에) 처음으로 갈 수 있도록 링크를 추가 --> <c:if
									test="${map.pager.curBlock > 1}">
									<a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
								</c:if> <!-- 현재 블록이 1블록보다 크면 이전 블록으로 이동할 수 있도록 링크 추가 --> <c:forEach
									var="num" begin="${map.pager.blockBegin}"
									end="${map.pager.blockEnd}">
									<c:choose>
										<c:when test="${num == map.pager.curPage}">

											<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
											<!-- 현재 페이지인 경우에는 링크를 빼고 빨간색으로 처리를 한다. -->
											<span style="color: red;">${num}</span>
										</c:when>
										<c:otherwise>
											<a href="#" onclick="list('${num}')">${num}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach> <c:if test="${map.pager.curBlock <= map.pager.totBlock}">
									<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
								</c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작으면 다음으로 갈 수있도록 링크를 추가 --> <c:if
									test="${map.pager.curPage <= map.pager.totPage}">
									<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
								</c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작거나 같으면 끝으로 갈 수 있도록 링크를 추가함--></td>
						</tr>
					</div>
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