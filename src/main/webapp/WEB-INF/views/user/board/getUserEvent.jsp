<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT INFO</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/eventview.css" />
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
<div class="wrapper">
	<div class="evn_content_main">
		<h2 class="title">${event.title }</h2>
		<div class="date">
			<em><fmt:formatDate value="${event.regdate }" pattern="yyyy.MM.dd"/>
				 ~ <fmt:formatDate value="${event.enddate }" pattern="yyyy.MM.dd"/></em>
		</div>
		<div class="event_view_conten">
			<div class="text_wrap">
				<p>
					<img src="${event.contimg }"
						style="width: 800px;"><br>
				</p>
			</div>

		</div>
		<div class="btn_list"><a href="getUserEventList.do">목록보기</a></div>
	</div>
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>