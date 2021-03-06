<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>LUBWAY STORE ADMIN</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="shortcut icon" href="" type="image/x-icon" />

<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css?ver=1" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.button.css" />
</head>
<body id="login_wrapper">
	<div class="logo">
		<a href="#"> <img src="${path}/resources/images/yellowWhiteLogo.png" alt="logo" />
		</a>
	</div>

	<div class="login_content">
		<h3>LUBWAY 매장관리자 사이트 로그인</h3>
		<form action="main.mdo">
			<div class="form-group">
				<input type="text" class="form-text" placeholder="아이디" id="username" name="id" />
			</div>
			<div class="form-group">
				<input type="password" class="form-text" placeholder="비밀번호" id="password" name="password" />
			</div>

			<button type="submit" class="btn_login" id="ui_login_btn">로그인</button>
		</form>
		<p>
			본 시스템은 등록된 관리자에 한하여 사용하실 수 있습니다.<br /> 불법적인 접근 및 사용 시 관련 법규에 의해 처벌 될
			수 있습니다.
		</p>
	</div>
	<div class="copyright">© 2021 Lubway’s Associates Inc. LUBWAY® is
		a registered trademark of Lubway’s Associates Inc.. All rights
		reserved.</div>

</body>
</html>