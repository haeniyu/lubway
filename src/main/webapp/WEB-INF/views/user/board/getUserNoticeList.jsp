<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getNoticeList" value="/lubway/search.do">
	<c:param name="page" value="${pagination.page}" />
	<c:param name="range" value="${pagination.range}" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
	<c:param name="searchKeyword" value="${pagination.searchKeyword}" />
	<c:param name="fix" value="${pagination.fix }" />
</c:url>
<!DOCTYPE html>
<html>
<script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, searchKeyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/search.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword=" + searchKeyword;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchKeyword, fix) {
		var url = "${pageContext.request.contextPath}/search.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword=" + searchKeyword;
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize, searchKeyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/search.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword=" + searchKeyword;
		location.href = url;
	}
</script>
<head>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/notice.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<title>LUBWAY - 뉴스ㆍ공지사항</title>
<meta charset="utf-8" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(window).load(function(){
    $(".loading").fadeOut();
});
</script>
<style type="text/css">
.loading{
	width: 100%;
	height: 100%;
	position: fixed;
	z-index: 1000;
	background-image : url("https://lubway.s3.ap-northeast-2.amazonaws.com/KakaoTalk_20210405_101739419.gif");
	background-repeat: no-repeat;
	background-position: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
<div class="loading"></div>
	<!-- container s -->
	<div id="container">
		<div class="sub_header">
			<div class="content">
				<a class="logo" href="/">HOME</a>
				<!-- sub location -->
				<div class="sub_loc">
					<ul>
						<li><a href="./eventList">이벤트ㆍ프로모션</a></li>
						<li class="active"><a href="#">뉴스ㆍ공지사항</a></li>
						<li><a href="./tvCommercial">광고영상</a></li>
					</ul>
				</div>
				<!--// sub location -->
				<a class="top" href="#none">TOP</a>
			</div>
		</div>
	</div>

	<!-- sub content s -->
	<div id="content">
		<h2 class="subTitle">뉴스ㆍ공지사항</h2>
		<!-- 뉴스ㆍ공지사항 list s -->
		<div class="board_list_wrapper">
			<div class="content">
				<p class="board_total">
					총<strong itemid="${pagination}">${pagination.listCnt}</strong>건의
					게시글이 있습니다.
				</p>

				<div class="cont_right">
					<div class="form_search">
						<form id="searchform" method="GET" action="/lubway/search.do">
							<input name="page" type="hidden" value="1" /> 
							<input name="searchKeyword" placeholder="검색어를 입력하세요" type="text" value="" />
							<input type="submit" class="btn_search" value="" formaction="/lubway/search.do"/>
						</form>
					</div>
				</div>

				<table>
					<caption>뉴스ㆍ공지사항 테이블</caption>
					<colgroup>
						<col width="100px" />
						<col width="*" />
						<col width="50px" />
						<col width="120px" />
					</colgroup>
					
					<tbody>
						<c:forEach items="${UserPageList}" var="pageList">
								<c:set var="fix" value="${pageList.fix }" />
								<c:choose>
								
									<c:when test="${fix eq 'true' }">
							<tr class="notice">
										<td><div>
												<img src="resources/images/common/icon_notice.png">
											</div></td>
										<td><div class="title">
												<a type="hidden" href="getUserNotice.do?no=${pageList.no}">${pageList.title }</a>
											</div></td>
										<td><div></div></td>
										<td><div class="date"><fmt:formatDate value="${pageList.regDate }"
												pattern="yyyy-MM-dd" /></div></td>
												</tr>
									</c:when>
									
									<c:otherwise>
									<tr>
										<td><div class="num">${pageList.rownum}</div></td>
										<td><div class="title">
												<a type="hidden" href="getUserNotice.do?no=${pageList.no}">${pageList.title }</a>
											</div></td>
										<td><div></div></td>
										<td><div class="date"><fmt:formatDate value="${pageList.regDate }"
												pattern="yyyy-MM-dd" /></div></td>
												<tr>
									</c:otherwise>
									
								</c:choose>
							
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- board 페이지 -->
			<div>
				<div class="pagination" >
				<ul class="UserPagination">
					<c:if test="${pagination.prev}">
						<a class="arr prev" href="javascript:void(0);"
							onClick="fn_prev('${pagination.page}','${pagination.range}','${pagination.rangeSize}','${pagination.searchKeyword }')"></a></li>
					</c:if>

					<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx" >
						<li 
							class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
							<a class="page-link" href="#"
							onClick="fn_pagination('${idx}','${pagination.range}','${pagination.rangeSize}','${pagination.searchKeyword }','${pagination.fix }')">
								${idx} </a></li>
					</c:forEach>

					<c:if test="${pagination.next}">
						<li class="page-item"><a class="arr next" href="javascript:void(0);"
							onClick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}','${pagination.searchKeyword }')"></a></li>
					</c:if>
				</ul>

				</div>
			</div>
			<!--// board 페이지 -->
		</div>
		<!--// 뉴스ㆍ공지사항 list e -->
	</div>
	<!--// sub content e -->

<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>