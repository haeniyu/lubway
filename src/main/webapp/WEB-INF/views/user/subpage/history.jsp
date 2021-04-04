<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LUBWAY - 러브웨이 역사</title>
<style type="text/css">
#content{
	width: 100%;
	padding-top : 150px;
}

img{
	width: 100%;
}
</style>
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<div id="content">
		<img src="${path}/resources/images/sub/history.png" />
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>