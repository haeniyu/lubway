<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/login.css" />
</head>
<body>
<!-- login -->
	<!-- container s -->
	<div class="bg_type01" id="container">
		<input id="returnUrl" name="returnUrl" type="hidden" value="https://subway.co.kr/">

		<!-- sub content s -->
		<div id="content">
			<!-- 로그인 -->
			<div class="signin_wrapper">
				<div class="signin_tit">
					<h2>LOGIN</h2>
					<p>
						써브웨이 회원으로 로그인하시면 제공하는<br>다양한 서비스를 이용할 수 있습니다.
					</p>
				</div>
				<div class="signin_input">
					<div class="form_box">
						<div class="write_info_wrap">
							<div class="input_set">
								<dl>
									<dt>이메일 아이디</dt>
									<dd>
										<span class="form_text"> <input class="required-value"
											id="username" name="username" placeholder="이메일 아이디 입력"
											type="text">
										</span>
									</dd>
									<dt>비밀번호</dt>
									<dd>
										<span class="form_text"> <input class="required-value"
											id="password" name="password" placeholder="비밀번호 입력"
											type="password">
										</span>
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
				<div class="signin_btn">
					<a class="btn bgc_point on" href="javascript:void(0);"
						id="loginBtn" style="width: 370px;"><span>로그인</span></a>
				</div>
				<div class="signin_link">
					<ul>
						<li><a href="javascript:void(0);" id="findIdBtn">아이디 찾기</a></li>
						<li><a href="javascript:void(0);" id="findPwBtn">비밀번호 찾기</a></li>
						<li><a href="/member/join/step1">회원가입</a></li>
					</ul>
				</div>
			</div>
			<!--// 로그인 -->
		</div>
		<!--// sub content e -->
	</div>
</body>
</html>