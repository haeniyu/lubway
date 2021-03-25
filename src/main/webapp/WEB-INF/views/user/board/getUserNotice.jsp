<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/noticein.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/footer.css" />
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<!-- container s -->
	<div id="container">
		<div class="sub_header">
			<div class="content">
				<a class="logo" href="/">HOME</a> <a class="top" href="#none">TOP</a>
			</div>
		</div>
	</div>

	<!-- sub content s -->
	<div id="content">
		<!-- 뉴스ㆍ공지사항 view s -->
		<div class="news_view_wrapper">
			<div class="content">
				<h2 class="title">${notice.title }</h2>
				<div class="date">
					<fmt:formatDate value="${notice.regDate }"
						pattern="yyyy.MM.dd HH:mm" />
				</div>

				<div class="news_view_content">
					<div class="text_wrap">
						<c:if test="${notice.filePath != null }">
							<p class="MsoNormal">
								<img src="${notice.filePath}" style="width: 800px;"><br>
							</p>
						</c:if>
						<p class="MsoNormal"><pre>${notice.content}</pre></p>
					</div>
				</div>
				<div class="btn_list">
					<a href="/lubway/getUserNoticeList.do">목록보기</a>
				</div>

				<!-- 우측 영역 -->
				<div class=board_right>
					<ul class="notice">
						<c:forEach items="${getRightNoticeList}" var="getRightNoticeList">
							<c:set var="fix" value="${getRightNoticeList.fix }" />
							<c:choose>
								<c:when test="${fix eq 'true' }">
									<li><a type="hidden"
										href="getUserNotice.do?no=${getRightNoticeList.no}">${getRightNoticeList.title }</a>
									</li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
				<!--// 우측 영역 -->
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>