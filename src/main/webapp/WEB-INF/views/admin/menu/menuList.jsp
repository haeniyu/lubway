<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getNoticeList" value="/lubway/search.mdo">
	<c:param name="page" value="${pagination.page}" />
	<c:param name="range" value="${pagination.range}" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
	<c:param name="searchKeyword" value="${pagination.searchKeyword}" />
	<c:param name="fix" value="${pagination.fix }" />
</c:url>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#select1").val("sandwich").prop("selected", true);
		
		$("#select1").on("change", function() {
			var select = $("#select1").val();
			
			var url = "${pageContext.request.contextPath}/menuListTab.mdo"
			if(select == "sandwich"){
				$.ajax({
					url : 'menuListTab.mdo?select=' + select,
					type : 'get',
					data : select,
				});
				select = $(this).val();	
				url = url + "?select=" + select;
				location.href = url;
			}else if(select == "drink"){
				$.ajax({
					url : 'menuListTab.mdo?select=' + select,
					type : 'get',
					data : select,
				});
				select = $(this).val();
				url = url + "?select=" + select;
				location.href = url;
			}else if(select == "wrap"){
				$.ajax({
					url : 'menuListTab.mdo?select=' + select,
					type : 'get',
					data : select,
				});
				select = $(this).val();
				url = url + "?select=" + select;
				location.href = url;
			}else if(select == "was"){
				$.ajax({
					url : 'menuListTab.mdo?select=' + select,
					type : 'get',
					data : select,
				});
				select = $(this).val();
				url = url + "?select=" + select;
				location.href = url;
			}else if(select == "salad"){
				$.ajax({
					url : 'menuListTab.mdo?select=' + select,
					type : 'get',
					data : select,
				});
				select = $(this).val();
				url = url + "?select=" + select;
				location.href = url;
			}else if(select == "morning"){
				$.ajax({
					url : 'menuListTab.mdo?select=' + select,
					type : 'get',
					data : select,
				});
				select = $(this).val();
				url = url + "?select=" + select;
				location.href = url;
			}else if(select == "cookie"){
				$.ajax({
					url : 'menuListTab.mdo?select=' + select,
					type : 'get',
					data : select,
				});
				select = $(this).val();
				url = url + "?select=" + select;
				location.href = url;
			}
			
			console.log(select);
		});
		
		

	});
</script>
<script>
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
</script>

</head>
<body id="page-top">

	<%@ include file="/WEB-INF/views/admin/header.jsp"%>

	<!-- 관리자 버전 화면 만들기  -->
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">메뉴관리</h1>
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-warning">Menu List</h6>
			</div>

			<div class="mb-3">
				<div class="col-sm-3">
					<div class="small mb-1"></div>
					<div class="dropdown mb-4">
						<span class="form_select" style="width: 300px"> <select
							class="btn btn-primary dropdown-toggle" id="select1"
							name="select" style="width: 150px">
								<option value="sandwich">샌드위치</option>
								<option value="wrap">랩&파니니</option>
								<option value="salad">찹샐러드</option>
								<option value="morning">아침메뉴</option>
								<option value="cookie">쿠키</option>
								<option value="was">웻지&스프</option>
								<option value="drink">음료</option>
						</select>
						</span>
					</div>
				</div>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<!-- 카테고리 선택 s -->

					<!-- 카테고리 선택 e -->
					<form action="/lubway/menu.mdo">
						<!-- method="post" 넣어줘야 함/ 일단 페이지만 넘어가게 했어요! -->
						<!-- 메뉴 등록 버튼 -->
						<div align="right">
							<input type="submit" class="btn btn-warning btn-icon-split"
								style="padding: 5px" value="메뉴 등록">
						</div>
						<div class="my-2"></div>
						<!-- 리스트 보여주는 table -->
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr align="center">
									<th width="20%">code</th>
									<th width="20%">eng name</th>
									<th width="35%">code</th>
									<th width="25%">English Name</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach items="${List}" var="List" >
									<tr>
										<td>${List.name}</td>
										<td>${List.engname}</td>
										<td><a type="hidden" href="menuDetail.mdo?code=${List.code}">${List.code}</a></td>
										<td>${List.filePath}</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>


					</form>

					<div align="right" style="display: inline;">
						<form action="/lubway/selectCategory.mdo" method="get">
							<tr>
								<td><input type="text" name="searchKeyword"
									placeholder="검색할 제목을 입력해 주세요." style="width: 20%" /> <input
									style="margin: 3px; padding: 3px"
									class="btn btn-warning btn-icon-split" type="submit"
									value="search" /></td>
							</tr>
						</form>
					</div>

					<!-- 페이지 네비게이션 (페이지 알고리즘 관련) 출력 -->
					<!-- pagination{s} -->

					<div align="center">
						<ul class="pagination" class="NoticeVO">
							<c:if test="${pagination.prev}">
								<li class="page-item"><a class="page-link" href="#"
									onClick="fn_prev('${pagination.page}','${pagination.range}','${pagination.rangeSize}','${pagination.searchKeyword }')">Prev</a></li>
							</c:if>
							<c:forEach begin="${pagination.startPage}"
								end="${pagination.endPage}" var="idx">
								<li
									class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
									class="page-link" href="#"
									onClick="fn_pagination('${idx}','${pagination.range}','${pagination.rangeSize}','${pagination.searchKeyword }','${pagination.fix }')">
										${idx} </a></li>
							</c:forEach>


							<c:if test="${pagination.next}">
								<li class="page-item"><a class="page-link" href="#"
									onClick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}','${pagination.searchKeyword }')">Next</a></li>
							</c:if>
						</ul>
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