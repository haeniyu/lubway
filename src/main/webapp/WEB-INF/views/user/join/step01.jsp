<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관동의</title>
<link rel="stylesheet" type="text/css"href="${path}/resources/css/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" type="text/css"href="${path}/resources/css/joining.css" />
<link rel="stylesheet" type="text/css"href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css"href="${path}/resources/css/ui.commons.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script type="text/javascript"src="${path}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"src="${path}/resources/js/jquery-ui-1.12.0.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/step01.js"></script>
<script type="text/javascript"src="${path}/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
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
					<span>Step1.</span> 약관동의
				</h3>

				<!-- step_cont_box -->
				<div class="step_cont_box">
					<!-- step01_cont -->
					<div class="step01_cont">
						<div class="all_agree">
							<label class="form_checkbox"> 
								<input id="agreeAllCbx" type="checkbox" /> <span class="icon"></span>
								<strong>약관 전체 동의</strong>
							</label>
						</div>
						<div class="agree_wrapper twin">
							<!-- 홈페이지 이용약관 동의 -->
							<div class="agree">
								<!-- checkbox -->
								<label class="form_checkbox"> 
									<input class="chk-value required-value cd-value" type="checkbox" /> 
									<span class="icon"></span>
									<em>(필수)</em> ${homepage.title}
								</label>
								<!--// checkbox -->
								<div class="scroll_wrapper mCustomScrollbar _mCS_1">
									<div id="mCSB_1_container" class="mCSB_container"
										style="position: relative; top: 0; left: 0;" dir="ltr">
										${homepage.content }
									</div>
								</div>
							</div>
							<!--// 홈페이지 이용약관 동의 -->

							<!-- 개인정보 수집 및 이용동의 -->
							<div class="agree">
								<!-- checkbox -->
								<label class="form_checkbox"> 
									<input class="chk-value required-value cd-value" type="checkbox" /> 
									<span class="icon"></span>
									<em>(필수)</em> ${privacy.title }
								</label>
								<!--// checkbox -->
								<div class="scroll_wrapper">
									<div class="scroll_wrapper mCustomScrollbar _mCS_2">
										<div id="mCSB_2_container" class="mCSB_container"
											style="position: relative; top: 0; left: 0;" dir="ltr">
											${privacy.content }
										</div>
									</div>
								</div>
								<!--// 개인정보 수집 및 이용동의 -->
								<!-- 포인트 및 쿠폰 이용동의 -->
								<div class="agree">
									<label class="form_checkbox"> 
										<input class="chk-value required-value cd-value" type="checkbox" /> 
										<span class="icon"></span>
										<em>(필수)</em> ${service.title }
									</label>
									<div class="scroll_wrapper">
										<div class="scroll_wrapper mCustomScrollbar _mCS_1">
											<div id="mCSB_1_container" class="mCSB_container"
												style="position: relative; top: 0; left: 0;" dir="ltr">
												${service.content}
											</div>
										</div>
									</div>

									<!-- 마케팅 전체 동의 -->
									<div class="agree marketing">
										<!-- checkbox -->
										<label class="form_checkbox"> <input
											class="chk-value cd-value" id="marketing" name="marketing" type="checkbox" /> 
											<span class="icon"></span> (선택) 마케팅 전체 동의
										</label>
										<!--// checkbox -->
										<div class="scroll_wrapper">
											<div class="scroll_wrapper mCustomScrollbar _mCS_4">
												<div id="mCSB_4_container" class="mCSB_container"
													style="position: relative; top: 0; left: 0;" dir="ltr">
													등록하신 휴대폰번호, 이메일 정보와 APP 알림 받기 설정으로 이벤트 소식, 할인 정보, 서비스 안내등을
													받을수 있습니다. <br /> <br /> 이용 목적 : 새로운 서비스 및 이벤트 정보등의 안내
												</div>
											</div>
											</div>
											</div>
										<!--// 마케팅 전체 동의 -->
												<form action="step02.do" method="get" id="checkForm">
													<div class="marketing_agree_box">
														<label class="form_checkbox"> <input
															class="sns-value cd-value" id="sms_recep"
															name="sms_usable" type="checkbox"
															data-code="MEMBER_AGR.SMS_RECEP" /> <span class="icon"></span>
															<span>SMS/LMS/MMS 수신 동의</span>
														</label> <label class="form_checkbox"> <input
															class="sns-value cd-value" id="email_recep"
															name="email_usable" type="checkbox"
															data-code="MEMBER_AGR.EMAIL_RECEP" /> <span class="icon"></span>
															<span>E-mail 수신 동의</span>
														</label>
													</div>
												</form>
									<div class="inquiry_notice">
										<strong>만 14세 이상 고객만 가입이 가능합니다.</strong>
										<p class="txt">
											써브웨이는 만 14세 미만 아동의 회원가입을 제한하고 있습니다.<br /> 「정보통신망 이용촉진 및 정보보호
											등에 관한 법률에는 만 14세 미만 아동의 개인정보 수집 시 법정대리인 동의를<br /> 받도록 규정하고
											있으며, 만 14세 미만 아동의 법정대리인 동의없이 회원가입을 하는 경우 회원탈퇴 또는 서비스 이용이 제한될
											수 있습니다.」
										</p>
									</div>
								</div>
								<!--// step01_cont -->
								<div class="btn_area">
									<a class="btn bgc_white" href="/step02.do" id="authBtn"
										style="width: 170px;"><span>다음</span></a>
								</div>
							</div>
							<!--// step_cont_box -->
						</div>
						<!--// 멤버십가입 -->
					</div>
					<!--// sub content -->
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>