<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step03.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>

<!-- 
<script type="text/javascript" src="${path}/resources/js/step03.js"></script>
 -->
 
<script type="text/javascript">

$(document).ready(function() {
//	function joinform_check() {
	$("#submitBtn").on("click", function() {
		if(!$("#mbrLgnId1").val()) {
			$("#worng-msg-email").text("이메일 주소를 입력해 주세요.").show();
            $("#mbrLgnId1").focus();
            return false;
		}
		if(!$("#mbrLgnId2").val()) {
			$("#worng-msg-email").text("도메인 주소를 입력해 주세요.").show();
			$("#mbrLgnId2").focus();
            return false;
		}
		if(!$("#inname").val()) {
			$("#idMsg").text("이름을 입력해 주세요.").show();
			$("#inname").focus();
			return false;
		}
		if(!$("#pw").val()) {
			$("#pwdMsg1").text("비밀번호를 입력해 주세요.").show();
			$("#pw").focus();
			return false;
		}
		if(!$("#subPw").val()) {
			$("#pwdMsg2").text("비밀번호 확인을 입력해 주세요.").show();
			$("#subPw").focus();
			return false;
		}
		
		return true;
	});//end submitBtn check

	$("#mbrLgnId3").on("change", function (){
		$("#mbrLgnId2").val($(this).val()).focus();
	});
	
	//이메일 유효성 검사 ( -1 = 탈퇴 계정, 0 = 중복, 1 = 사용가능 )

	//대문자 체크
	$("#mbrLgnId1").on("blur", function() {
		var check_email = $("#mbrLgnId1").val();
		var check_capital = /^[-A-Z]/g;
		
		if(check_capital.test(check_email)) {
			$("#mbrLgnId1").val($("#mbrLgnId1").val().trim().toLowerCase());
			$("#worng-msg-email").text('소문자만 입력이 가능합니다.').show();
			$("#worng-msg-email").css("color", "red");
			$("#mbrLgnId1").focus();
		} else {
			$("#worng-msg-email").hide();
		}
	});//end email capital check
	
	$("#mbrLgnId2").on("blur", function() {
		var check_domain_email = $("#mbrLgnId2").val();
		var check_domain_capital = /^[-A-Z]/g;
		
		if(check_domain_capital.test(check_domain_email)) {
			$("#mbrLgnId2").val($("#mbrLgnId2").val().trim().toLowerCase());
			$("#worng-msg-email").text('소문자만 입력이 가능합니다.').show();
			$("#mbrLgnId2").focus();
		} else {
			$("#worng-msg-email").hide();
		}
	});//end domain capital check
	
	$("#mbrLgnId2").on("blur", function() {	
		var user_check = /^[-a-z0-9_]+[-a-z0-9_.]*[@]{1}[-a-z0-9_]+[-a-z0-9_.]*[.]{1}[a-z]{1,5}$/g;

		var user_email = ($('#mbrLgnId1').val().trim() + "@" + $('#mbrLgnId2').val().trim());

		if(!user_check.test(user_email)) {
			$("#worng-msg-email").text("이메일이 잘못 입력되었습니다. 이메일 아이디 혹은 도메인을 다시 확인해 주세요.").show();
			$("#worng-msg-email").css("color", "red");
			$("#mbrLgnId1").focus();
		} else {
			$.ajax({
				url : '/lubway/idCheck.do?userId=' + user_email,
				type : 'get',
				success : function(data) {
					if(data == 1) {
						$("#mbrLgnId1").focus();
						$("#worng-msg-email").text('이미 사용 중이거나 탈퇴된 계정입니다.').show();
						$("#worng-msg-email").css("color", "red");
					} else {
						$("#worng-msg-email").text("사용 가능한 계정입니다.").show();
						$("#worng-msg-email").css("color", "green");
					}
				},
				error : function(data) {
					console.log("실패함ㅠ");
				}
			});
		}
	});//end email check
	
	//이름 유효성 검사
	$("#inname").on("blur", function() {
		var name = $("#inname").val();
		var check_name = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		
		if(	check_name.test(name)) {
			$("#idMsg").text("이름이 올바르지 않습니다. (2 ~ 5 글자 허용)").show();
			$("#idMsg").css("color", "red");
			$("#inname").focus();
		} else {
			$("#idMsg").text("").show();
		}
	});//end name check

	//비밀번호 유효성 검사
	$("#pw").on("keyup", function() {
		var check_pass = true;
		
		if(!$("#pw").val || $("#pw").val().length < 8) {
			$("#pwdMsg1").text("8자이상 이상 입력하세요. (대문자 1개,소문자 1개,숫자 1개,특수문자 1개 필수)").show();
			$("#pwdMsg1").css("color", "red");
			$("#pw").focus();
			check_pass = false;
		}

		if(!/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]){8,}/.test($("#pw").val())) {
			$("#pwdMsg1").text("8자이상 이상 입력하세요. (대문자 1개,소문자 1개,숫자 1개,특수문자 1개 필수)").show();
			$("#pwdMsg1").css("color", "red");
			$("#pw").focus();
			check_pass = false;
		}
		
		if(/(\w)\1\1/.test($("#pw").val()) || /([\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])\1\1/.test($("#pw").val()) || /([가-힣ㄱ-ㅎㅏ-ㅣ\x20])\1\1/.test($("#pw").val())) {
			$("#pwdMsg1").text("같은 문자가 3자리 이상 반복될수 없습니다.").show();
			$("#pwdMsg1").css("color", "red");
			$("#pw").focus();
			check_pass = false;
		}

		if($("#pw").val().length != $("#pw").val().replace(/\s/g, "").length) {
			$("#pwdMsg1").text("비밀번호에 공백이 있습니다.").show();
			$("#pwdMsg1").css("color", "red");
			$("#pw").focus();
			check_pass = false;
		}

		if(check_pass) {
			$("#pwdMsg1").text("사용 가능한 비밀번호입니다.").show();
			$("#pwdMsg1").css("color", "green");
			$("#pwdMsg2").text("비밀번호를 한번 더 입력하여 주세요.").show();
			$("#pwdMsg2").css("color", "red");
		}
	});//end password check

	$("#subPw").on("keyup", function() {
		var check_subPass = true;
		
		if($("#pw").val() && !$("#subPw").val()){
			$("#pwdMsg2").text("비밀번호를 한번 더 입력하여 주세요.").show();
			$("#pwdMsg2").css("color", "red");
			$("#subPw").focus();
			check_subPass = false;
		}

		if($("#pw").val() != $("#subPw").val()){
			$("#pwdMsg2").text("비밀번호가 일치하지 않습니다.").show();
			$("#pwdMsg2").css("color", "red");
			$("#subPw").focus();
			check_subPass = false;
		}
		
		if(check_subPass) {
			$("#pwdMsg2").text("비밀번호가 일치합니다.").show();
			$("#pwdMsg2").css("color", "green");			
		}
	});//end subPassword check
	
});//end document ready function

</script>

</head>
<body>
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
										<dl>
											<dt>
												아이디(이메일)
												<span class="ess"></span>
											</dt>
											<dd>
												<span class="form_text" style="width: 155px">
													<input class="required-value" id="mbrLgnId1" name="id" placeholder="이메일 아이디 입력" type="text" />
												</span>
												@ 
												<span class="form_text" style="width: 155px">
													<input class="required-value" id="mbrLgnId2" name="at" placeholder="이메일 도메인 입력" type="text" />
												</span>
												<span class="form_select" style="width: 155px">
													<select id="mbrLgnId3" name="domain">
														<option value="">직접 입력</option>
														<option value="naver.com">naver.com</option>
														<option value="daum.net">daum.net</option>
														<option value="hanmail.net">hanmail.net</option>
														<option value="gmail.com">gmail.com</option>
														<option value="icloud.com">icloud.com</option>
														<option value="nate.com">nate.com</option>
													</select>
												</span>
												<div class="btn_input_in">
													<input class="required-val" id="duplicationYn-mbrLgnId"	type="hidden" value="N" />
													<a class="in_form_btn" href="javascript:void(0);" id="pop" onclick="view.checkId('N');return false;">
														<span>중복확인</span>
													</a>
												</div>
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
												<span class="pw_check miss worng-msg-pw" id="pwdMsg1"></span>
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
													여기에 전화번호가 뜹니다
												</span>
											</dd>
										</dl>
									</div>
								</div>
							</section>
						</div>
					</div>
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