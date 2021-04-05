<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<title>LUBWAY 러브웨이</title>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<!-- container s -->
	<div id="container">
		<!-- sub content -->
		<div id="content">
			<!-- 에러 페이지-->
			<div class="error">
				<h2 class="subTitle_02">페이지 호출 오류</h2>
				<div class="sub_txt_wrap wh_box" style="padding:90px 100px;">
					<h3 class="sub_tit_h3">
						이용에 불편을 드려 죄송합니다.<br />예기치 않은 오류가 발생하였습니다.
					</h3>
					<p class="sub_txt">
						요청하신 페이지가 존재하지 않거나<br />오류가 발생하였습니다.<br />빠른 시일내에 복구하도록 하겠습니다.
					</p>
				</div>
			</div>
			<!--// 에러 페이지-->
		</div>
		<!--// sub content -->
	</div>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>