<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getstorelist" value="/lubway/searchstore.mdo">
	<c:param name="page" value="${pagination.page}" />
	<c:param name="range" value="${pagination.range}" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
	<c:param name="searchKeyword" value="${pagination.searchKeyword}" />
</c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 관리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

function shutdown(r) {
	var flag = confirm("해당 매장을 폐점 처리 하시겠습니까?");
	if (flag) {
		alert("해당 매장을 폐점 처리 했습니다.");
		var i = r.parentNode.parentNode.rowIndex;	//버튼이 눌러진 테이블의 로우넘버 저장
		var storename = document.getElementById("storeTable").rows[i].cells[1].innerHTML;	//해당 로우넘버의 매장명이 있는 칼럼 값 저장
		
		var form = document.createElement("form");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "/lubway/shutdown.mdo");
		
		var storenameField = document.createElement("input");
		storenameField.setAttribute("type", "hidden");
		storenameField.setAttribute("name", "storename");
		storenameField.setAttribute("value", storename);
		
		form.appendChild(storenameField);
		document.body.appendChild(form);
		form.submit();
	}
}

function update(r) {
		alert("해당 매장 계정 비밀번호를 수정하였습니다.");
		var i = r.parentNode.parentNode.rowIndex;	//버튼이 눌러진 테이블의 로우넘버 저장
		var storename = document.getElementById("storeTable").rows[i].cells[1].innerHTML;	//해당 로우넘버의 아이디가 있는 칼럼 값 저장
		var password = document.getElementById("storeTable").rows[i].cells[3].childNodes[0].value;
		
		var form = document.createElement("form");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "/lubway/updatestore.mdo");
		
		var storenameField = document.createElement("input");
		storenameField.setAttribute("type", "hidden");
		storenameField.setAttribute("name", "storename");
		storenameField.setAttribute("value", storename);
		
		var passwordField = document.createElement("input");
		passwordField.setAttribute("type", "hidden");
		passwordField.setAttribute("name", "password");
		passwordField.setAttribute("value", password);
		
		form.appendChild(storenameField);
		form.appendChild(passwordField);
		document.body.appendChild(form);
		form.submit();
	}

	<!--pagination-->
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, searchKeyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/searchstore.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword=" + searchKeyword;
		location.href = url;

	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchKeyword) {
		var url = "${pageContext.request.contextPath}/searchstore.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword=" + searchKeyword;
		location.href = url;

	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize, searchKeyword) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/searchstore.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword=" + searchKeyword;
		location.href = url;
	}
</script>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/views/admin/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">매장 관리</h1>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">매장 목록</h6>
				<!-- 검색 시작 -->
				<div align="right">
					<form action="/lubway/searchstore.mdo" method="get">
						<input type="text" name="searchKeyword"
								placeholder="매장명" style="width:10%" /> <input
								style="margin:0px 3px; padding:0px 3px"
								class="btn btn-warning" type="submit"
								value="search" />
					</form>
				</div>
				<!-- 검색 종료 -->
				<span>총 ${cnt }건</span>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="storeTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>지역구</th>
								<th>매장명</th>
								<th>매장 계정</th>
								<th>비밀번호</th>
								<th>매장 상태</th>
								<th>매장 정보 수정</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="store" items="${list }" varStatus="num">
							<tr>
								<td>${store.area}</td>
								<td>${store.storename }</td>
								<td>${store.id }</td>
								<td><input type="text" name="password" value="${store.password }" required></td>
								<td>
									<c:if test="${store.status eq 0 }">운영중</c:if>
									<c:if test="${store.status eq 1 }">폐점</c:if>
								</td>
								<td><a href="javascript:void(0);"
										class="btn btn-success btn-icon-split btn-sm" onclick="update(this)" >
											<span class="icon text-white-50"> <i class="fas fa-check"></i>
										</span> <span class="text">수정</span>
									</a>
									<c:if test="${store.status eq 0 }">
									<a href="javascript:void(0);"
										class="btn btn-danger btn-icon-split btn-sm" onclick="shutdown(this)" >
											<span class="icon text-white-50"> <i class="fas fa-trash"></i>
										</span> <span class="text">폐점</span>
									</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- pagination{s} -->
		<div align="center">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}','${pagination.range}','${pagination.rangeSize}','${pagination.searchKeyword }')">Prev</a></li>
				</c:if>
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li
						class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
						class="page-link" href="#"
						onClick="fn_pagination('${idx}','${pagination.range}','${pagination.rangeSize}','${pagination.searchKeyword }')">
							${idx} </a></li>
				</c:forEach>

				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}','${pagination.searchKeyword }')">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<!-- /.container-fluid -->

<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>