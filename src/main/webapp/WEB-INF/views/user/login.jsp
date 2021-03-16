<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/login.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type = "text/javascript" src = "https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginBtn").on("click", function(){
			if($("#username").val().trim() == "" || $("#password").val().trim() == "") {
				alert("아이디와 비밀번호를 확인해주세요.");
				return;
			} else {
				$("#login").submit();
			}
		});
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<!-- login -->
	<!-- container s -->
	<div class="bg_type01" id="container">
		<!-- sub content s -->
		<div id="content">
			<!-- 로그인 -->
			<div class="signin_wrapper">
				<div class="signin_tit">
					<h2>LOGIN</h2>
					<p>
						러브웨이 회원으로 로그인하시면 제공하는<br>다양한 서비스를 이용할 수 있습니다.
					</p>
				</div>
				<form action="main.do" method="post" id="login">
					<div class="signin_input">
						<div class="form_box">
							<div class="write_info_wrap">
								<div class="input_set">
									<dl>
										<dt>이메일 아이디</dt>
										<dd>
											<span class="form_text">
												<c:if test="${findId == null || findId == '1'}"> 
													<input class="required-value" id="username" name="id" placeholder="이메일 아이디 입력" type="text">
												</c:if>
												
												<c:if test="${findId != null && findId != '1'}"> 
													<input class="required-value" id="username" name="id" placeholder="이메일 아이디 입력" type="text" value="${findId}">
												</c:if>
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
					<div id = "naver_id_login">
						<a href="${url}"><img width="223" src="${pageContext.request.contextPath}/resources/images/naver_Bn_white.PNG"/></a>
					</div>
				</form>
				<div class="signin_link">
					<ul>
						<li><a href="findId.do" id="findIdBtn">아이디 찾기</a></li>
						<li><a href="findPwd.do" id="findPwBtn">비밀번호 찾기</a></li>
						<li><a href="step01.do">회원가입</a></li>
					</ul>
				</div>
			</div>
			<!--// 로그인 -->
		</div>
		<!--// sub content e -->
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>