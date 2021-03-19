<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>History</title>
<style type="text/css">
#content{
	width: 100%;
	padding-top : 150px;
}

img{
	width: 100%;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<div id="content">
		<img src="${path}/resources/images/sub/history.png" />
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>