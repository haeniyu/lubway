<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/findid.css?ver=1" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp" %>
	<!-- container s -->
	<div class="bg_type01" id="container">
		<!-- sub content s -->
		<div id="content">
			<!-- 비밀번호찾기 -->
			<div class="find_wrapper">
				<h2 class="subTitle_02">비밀번호 찾기</h2>
				<div class="find_box">
					<div class="result_info suc">
						<p>
							가입하신 <span>${getId} (으)로</span><br />
							<br />비밀번호 재설정에 필요한 메일이 발송되었습니다.
						</p>
						
					</div>
					<div class="btn_area">
						<a class="btn bgc_point i_reg" href="/user/login" style="width: 150px;"> <span>로그인</span>
						</a>
					</div>
				</div>
			</div>
			<!--// 비밀번호찾기 -->
		</div>
	</div>
<%@ include file="/WEB-INF/views/user/footer.jsp" %>
</body>
</html>