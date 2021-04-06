<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 입력</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step03.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/step03.js"></script>
<script type="text/javascript">
$(window).load(function(){
    $(".loading").fadeOut();
});
</script>
<style type="text/css">
.loading{
	width: 100%;
	height: 100%;
	position: fixed;
	z-index: 1000;
	background-image : url("https://lubway.s3.ap-northeast-2.amazonaws.com/KakaoTalk_20210405_101739419.gif");
	background-repeat: no-repeat;
	background-position: center;
}
</style>
</head>
<body>
<div class="loading"></div>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<!-- container s -->
	<div class="bg_type01" id="container">
		<!-- sub content -->
		<div id="content">
			<!-- 멤버십가입 -->
			<div class="joining_wrapper">
				<h2 class="subTitle_02">회원가입</h2>
				<h3 class="step_tit">
					<span>Step3.</span> 정보입력
				</h3>
				<!-- step_cont_box -->
				<form action="step04.do" method="post" name="pageMove">
					<div class="step_cont_box">
						<!-- step03_cont -->
						<div class="step03_cont">
							<section class="form_box">
								<h2>기본 정보 (필수 입력)</h2>
								<div class="write_info_wrap">
									<div class="input_set">
										<dl id="borderId">
											<dt>
												아이디(이메일)
												<span class="ess"></span>
											</dt>
											<dd>
												<span class="form_text" style="width: 155px">
													<input class="required-value" id="mbrLgnId1" placeholder="이메일 아이디 입력" type="text" />
												</span>
												@
												<span class="form_text" style="width: 155px">
													<input class="required-value" id="mbrLgnId2" name="at" placeholder="이메일 도메인 입력" type="text" />
												</span>
												<span class="form_select" style="width: 155px">
													<select id="mbrLgnId3" name="domain" style="width: 150px">
														<option value="" id="defaultValue">직접 입력</option>
														<option value="naver.com">naver.com</option>
														<option value="daum.net">daum.net</option>
														<option value="hanmail.net">hanmail.net</option>
														<option value="gmail.com">gmail.com</option>
														<option value="icloud.com">icloud.com</option>
														<option value="nate.com">nate.com</option>
													</select>
												</span>
												<span class="pw_check miss" id="worng-msg-email" style="display: none;">이메일 주소를 입력해주세요.</span>
											</dd>
										</dl>
									</div>
									<div class="input_set input_name_div">
										<dl>
											<dt>
												이름
												<span class="ess"></span>
											</dt>
											<dd>
												<span class="form_text" style="width: 235px">
													<input class="required-value input_name" id="inname" name="name" placeholder="이름 입력" type="text" />
													<span class="pw_check miss worng-msg-id" id="idMsg"></span>
												</span>
											</dd>
										</dl>
									</div>
									<div class="input_set input_pw_div">
										<dl>
											<dt>
												비밀번호
												<span class="ess"></span>
											</dt>
											<dd>
												<span class="form_text" style="width: 235px">
													<input class="required-value input_pw" id="pw" name="password" placeholder="비밀번호 입력" type="password" />
												</span>
												<span class="pw_check miss worng-msg-pw" id="pwdMsg1" style="padding-left:30px;"></span>
											</dd>
										</dl>
									</div>
									<div class="input_set input_pw_div">
										<dl>
											<dt>
												비밀번호 확인
												<span class="ess"></span>
											</dt>
											<dd>
												<span class="form_text" style="width: 235px">
													<input class="required-value input_pw" id="subPw" placeholder="비밀번호 입력" type="password" />
												</span>
												<span class="pw_check miss worng-msg-pw" id="pwdMsg2"></span>
											</dd>
										</dl>
									</div>
									<div class="input_set input_pw_div">
										<dl>
											<dt>
												전화번호
												<span class="ess"></span>
											</dt>
											<dd>
												<span class="form_text" style="width: 235px">
													${vo.tel }
												</span>
											</dd>
										</dl>
									</div>
								</div>
							</section>
						</div>
					</div>
					<input type="hidden" id="fullId" name="id">
					<input type="hidden" id="tel" name="tel" value="${vo.tel}">
					<input type="hidden" id="sms" name="sms_usable" value="${sms}">
					<input type="hidden" id="email" name="email_usable" value="${email}">
					<!--// step03_cont -->
					<div class="btn_area">
						<a class="btn bgc_point i_reg" href="javascript:pageMove.submit()" id="submitBtn" style="width: 170px;">
							<span>회원가입 완료</span>
						</a>
					</div>
				</form>
			</div>
			<!--// step_cont_box -->
		</div>
		<!--// 멤버십가입 -->
	</div>
	<!--// sub content -->
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>