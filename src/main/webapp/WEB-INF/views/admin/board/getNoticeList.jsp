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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
		<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-warning">Notice Board</h6>
			</div>

			<form action="/lubway/insertNotice.mdo" method="post">
				<div class="card-body">
					<div class="table-responsive">
						<div align="right">
							<input type="submit" class="btn btn-warning btn-icon-split"
								style="padding: 5px" value="글등록">
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
								<c:forEach items="${noticeList}" var="notice">
									<tr>
										<c:set var="fix" value="${notice.fix }" />
										<c:choose>
											<c:when test="${fix eq 'true' }">
												<td><img src="resources/images/common/icon_notice.png"></td>
												<td align="left"><a type="hidden"
													href="getNotice.mdo?no=${notice.no}">${notice.title }</a></td>
												<td><fmt:formatDate value="${notice.regDate }"
														pattern="yyyy-MM-dd" /></td>
											</c:when>

											<c:otherwise>
												<td>${notice.rownum}</td>
												<td align="left"><a type="hidden"
													href="getNotice.mdo?no=${notice.no}">${notice.title }</a></td>
												<td><fmt:formatDate value="${notice.regDate }"
														pattern="yyyy-MM-dd" /></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
				</form>
				<!-- 검색 시작 -->
				<div align="right">
					<form action="/lubway/search.mdo" method="get">
						<tr>
							<td><input type="text" name="searchKeyword"
								placeholder="검색할 제목을 입력해 주세요." style="width: 20%" /> 
								<input
								style="margin: 3px; padding: 3px"
								class="btn btn-warning btn-icon-split" type="submit"
								value="search" /></td>
						</tr>
					</form>
				</div>
				<!-- 검색 종료 -->
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
	</div>
</div>
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>