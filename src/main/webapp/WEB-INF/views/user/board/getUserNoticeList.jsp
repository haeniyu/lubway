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
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/notice.css" />
<title>SUBWAY - 뉴스ㆍ공지사항</title>
<meta charset="utf-8" />
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>

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


	<!-- footer -->
	<div id="footer">
		<div class="content">
			<!-- util menu -->
			<div class="util_menu">
				<ul>
					<li><a href="/agreement">이용약관</a></li>
					<li><a href="/privacy"><strong>개인정보처리방침</strong></a></li>
					<li><a href="https://store.subway.co.kr/" target="_blank">점주관리자</a></li>
				</ul>
			</div>
			<!--// util menu -->

			<span class="addr">서울시 서초구 강남대로 535 프린스빌딩 15층</span> <span
				class="rep">대표 : 콜린클락</span> <span class="tel">전화 :
				02-797-5036</span> <span class="rep">사업자등록번호 : 101-84-04143</span>
			<p class="copyright">SUBWAY® is a Registered Trademark of Subway
				IP LLC. © 2021 Subway IP LLC. All Rights Reserved.</p>
			<a class="sns_area instagram"
				href="https://www.instagram.com/subwaykorea" target="_blank">instagram</a>
			<a class="sns_area fackbook" href="https://www.facebook.com/Subwaykr"
				target="_blank">facebook</a>
		</div>
	</div>



</body>
</html>