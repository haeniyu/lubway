<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getNoticeList" value="/search.mdo">
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
		var selected = '${select}';
		console.log(selected);
		
		if(selected != "") $("#select1").val(selected);			
		
		$("#select1").on("change", function() {
			var select = $("#select1").val();
			console.log(select);

			var form = document.createElement("form");

			form.setAttribute("method", "post");
			form.setAttribute("action", "/menuListTab.mdo");

			var input_select = document.createElement("input");
			input_select.setAttribute("type", "hidden");
			input_select.setAttribute("name", "select");
			input_select.setAttribute("value", select);

			form.appendChild(input_select);
			document.body.appendChild(form);
			form.submit();
			
		});

	});
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
			<div class="card-body">
				<div class="table-responsive">
					<!-- 카테고리 선택 s -->
					<div class="mb-3">
						<div class="col-sm-3">
							<div class="small mb-1"></div>
							<div class="dropdown mb-4">
								<span class="form_select" style="width: 300px">
								<select class="btn btn-primary dropdown-toggle" id="select1" name="select" style="width: 150px">
										<option value="sandwich">샌드위치</option>
										<option value="wrap">랩&파니니</option>
										<option value="salad">찹샐러드</option>
										<option value="morning">아침메뉴</option>
										<option value="cookie">쿠키</option>
										<option value="was">웨지&스프</option>
										<option value="drink">음료</option>
								</select>
								</span>
							</div>
						</div>
					</div>
					<!-- 카테고리 선택 e -->
					<form action="/menu.mdo">
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
									<th width="25%">name</th>
									<th width="20%">eng name</th>
									<th width="20%">code</th>
									<th width="35%">file</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${List}" var="List" >
									<tr>
										<td>${List.name}</td>
										<td>${List.engname}</td>
										<td><a type="hidden" href="/menuDetail.mdo?code=${List.code}&select=${select}">${List.code}</a></td>
										<td><img src="${List.filePath }" width="200px"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
					</div>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
			<!-- End of Main Content -->
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>