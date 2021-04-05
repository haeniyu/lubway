<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/findid.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<title>아이디 찾기</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<!-- container s -->
	<div class="bg_gray" id="container" style="padding-top:175px;">

		<!-- sub content s -->
		<div id="content">
			<!-- 아이디찾기 -->
			<div class="find_wrapper">
				<h2 class="subTitle_02">아이디 찾기</h2>
				<div class="find_box">
					<!-- 이메일 아이디 존재시 노출 -->
					<div class="result_info suc">
						<p>고객님의 이메일 아이디는 아래와 같습니다.</p>
					</div>
					<div class="form_box">
						<div class="write_info_wrap">
							<div class="input_set readonly">
								<dl>
									<dt style="line-height:normal;">아이디</dt>
									<dd>
										<span class="form_text"> ${findId}</span>
									</dd>
								</dl>
							</div>
						</div>
					</div>
					<div class="btn_area">
						<a class="btn bgc_white" href="findPwd.do" id="findPwBtn" style="width: 170px;"> 
							<span>비밀번호 찾기</span>
						</a> 
						<a class="btn bgc_point i_reg" href="login.do" style="width: 170px;"> 
							<span>로그인하기</span>
						</a>
					</div>
				</div>
				<!--// 이메일 아이디 존재시 노출 -->
				<!-- 이메일 아이디 미존재시 노출 -->

			</div>
			<!--// 아이디찾기 -->
		</div>
	</div>
	<!--// sub content e -->
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>