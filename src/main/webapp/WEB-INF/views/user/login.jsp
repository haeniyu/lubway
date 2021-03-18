<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="848158094091-dmohdudpt9hfq0m0uubdln37dfg2mqbk.apps.googleusercontent.com">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/login.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type = "text/javascript" src = "https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src = "//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
<script type="text/javascript">
	var name = null;
	var email = null;

	function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  name = profile.getName();
		  email = profile.getEmail();
	}
	
	function googleLogin() {
		if(name == null || email == null) {
			return;
		}
		var form = document.createElement("form");

		form.setAttribute("method", "post");
		form.setAttribute("action", "google.do");

		var input_name = document.createElement("input");
		input_name.setAttribute("type", "hidden");
		input_name.setAttribute("name", "name");
		input_name.setAttribute("value", name);

		var input_email = document.createElement("input");
		input_email.setAttribute("type", "hidden");
		input_email.setAttribute("name", "id");
		input_email.setAttribute("value", email);

		form.appendChild(input_name);
		form.appendChild(input_email);
		document.body.appendChild(form);
		form.submit();
	}
</script>
<script type="text/javascript">
function kakaoLogout() {
	Kakao.Auth.logout(function(response) {
		alert(response + 'logout');
	});
}
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
					<div id="naver_id_login">
						<a href="${url}"><img width="223" src="${pageContext.request.contextPath}/resources/images/naver_Bn.png"/></a>
					</div>
					<div class="g-signin2" data-onsuccess="onSignIn" onclick="googleLogin()"></div>
					<a id="kakao-login-btn"></a>
					<a onclick="kakaoLogout();">카카오 로그아웃</a>
					<!--
					<a href="http://developers.kakao.com/logout">Logout</a>
					 -->
					<script type="text/javascript">
						Kakao.init('6a3508a8b89b4d0077e04113035fff90'); //아까 카카오개발자홈페이지에서 발급받은 자바스크립트 키를 입력함
					
						//카카오 로그인 버튼을 생성합니다. 
						Kakao.Auth.createLoginButton({ 
							container: '#kakao-login-btn', 
							success: function(authObj) { 
							Kakao.API.request({
								url: '/v2/user/me',
								success: function(res) {
									console.log(res);
									console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
									console.log(res.kakao_account.email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
									console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
									// res.properties.nickname으로도 접근 가능 )
									console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
									var kakaonickname = res.properties.nickname;    //카카오톡 닉네임을 변수에 저장 (닉네임 값을 다른페이지로 넘겨 출력하기 위해서)
									//window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/lubway/kakao.do?res="+res);
									//로그인 결과 페이지로 닉네임 값을 넘겨서 출력시킨다.,
									}
								})
							},
							fail: function(error) {
								alert(JSON.stringify(error));
							}
						});
					</script>
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