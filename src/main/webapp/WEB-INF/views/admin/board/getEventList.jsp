<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getEventList" value="/lubway/getEventList.mdo">
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
		var url = "${pageContext.request.contextPath}/getEventList.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize ) {
		var url = "${pageContext.request.contextPath}/getEventList.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize, searchKeyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/getEventList.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>
<style type="text/css">
.cell{
	border: 1px solid lightgray;
}
</style>
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">이벤트 관리</h1>
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-warning">Event Board</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form action="/insertEvent.mdo" method="post">
						<div align="right">
							<input type="submit" class="btn btn-warning btn-icon-split" style="padding: 5px" value="글등록">
						</div>
						<div class="my-2"></div>
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr align="center">
									<th width="30%">Title</th>
									<th width="40%">Thumbnail</th>
									<th width="15%">StartDate</th>
									<th width="15%">EndDate</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${eventList}" var="event">
									<tr>
										<td><a type="hidden" href="/getEvent.mdo?no=${event.no}">${event.title }</a></td>
										<td><a type="hideen" href="/getEvent.mdo?no=${event.no }"><img
												width="370px" src="${event.thumbnail }"></a></td>
										<td><fmt:formatDate value="${event.regdate }"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${event.enddate }"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>

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
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>