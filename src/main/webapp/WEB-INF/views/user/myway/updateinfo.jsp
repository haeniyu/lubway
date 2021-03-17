<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//체크박스 표시 유지
	$("input[name='sms_usable']").each(function(){
        var check = ${user.sms_usable};
        if( check == true ){
           $(this).attr("checked", true );
        }
     }); 
	
	$("input[name='email_usable']").each(function(){
        var check = ${user.email_usable};
        if( check == true ){
           $(this).attr("checked", true );
        }
     }); 
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
		}
	});//end password check
	
	//확인 버튼 눌렀을 때
	$("#modInfo").on("click", function() {
		
		var pw = $("#pw").val();
		var sms = $("#sms_recep").is(":checked");
		var email = $("#email_recep").is(":checked");
		
		var form = document.createElement("form");
        form.setAttribute("method", "Post");
        
        form.setAttribute("action", "/lubway/resultmod.do");

	    //비밀번호 저장
	     var passField = document.createElement("input");
	        passField.setAttribute("type", "hidden");
	        passField.setAttribute("name", "pw");
	        passField.setAttribute("value", pw);

        //sms 수신 동의 여부 저장
        var smsField = document.createElement("input");
        smsField.setAttribute("type", "hidden");
        smsField.setAttribute("name", "sms_recep");
        smsField.setAttribute("value", sms);

      	//email 수신 동의 여부 저장
        var emailField = document.createElement("input");
        emailField.setAttribute("type", "hidden");
        emailField.setAttribute("name", "email_recep");
        emailField.setAttribute("value", email);
	        
	    form.appendChild(passField);
        form.appendChild(smsField);
        form.appendChild(emailField);
        document.body.appendChild(form);
        
		alert("수정되었습니다.");
        
        form.submit();
		
	});
	
	$("#withdrawal").on("click",function(){
		var flag = confirm("정말로 탈퇴하시겠습니까?");
		if(flag){
			alert("그동안 이용해주셔서 감사합니다.");
			window.location.href="/lubway/withdrawal.do";
		}
		
	});
	
});
</script>
<title>개인 정보 수정</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<div class="bg_gray" id="container">
		<!-- sub content s -->
		<div id="content">
			<!-- 내정보관리 > 정보변경 -->
			<div class="manage_wrapper">
				<h2 class="subTitle_02">정보변경</h2>
				<div class="manage_cont_box">
					<section class="form_box">
						<div class="write_info_wrap">
							<div class="write_info_wrap">
								<h2>회원가입 정보</h2>
								<div class="input_set">
									<dl class="info_dl">
										<dt>이름</dt>
										<dd>${user.name }</dd>
									</dl>
									<dl class="info_dl">
										<dt>이메일 주소</dt>
										<dd>${user.id }</dd>
									</dl>
									<dl class="info_dl">
										<dt>휴대전화</dt>
										<dd>${user.tel }</dd>
									</dl>
								</div>
								<c:if test="${user != null && nuser == null}">
									<div class="input_set">
										<dl>
											<dt>비밀번호</dt>
											<dd>
												<div class="pass_num_wrap">
													<span class="form_text">
													<input id="pw" name="Changepass" type="password" placeholder="변경할 비밀번호를 입력하세요" />
													</span>
													<span class="pw_check miss worng-msg-pw" id="pwdMsg1"></span>
												</div>
											</dd>
										</dl>
									</div>
								</c:if>
								<h2>추가 정보 입력</h2>
								<div class="input_set">
									<dl>
										<dt>마케팅 동의</dt>
										<dd>
											<div class="marketing_agree_box">
												<label class="form_checkbox"> <input
											class="sns-value cd-value" id="sms_recep" name="sms_usable"
											type="checkbox" data-code="MEMBER_AGR.SMS_RECEP" /> <span
											class="icon"></span> <span>SMS/LMS/MMS 수신 동의</span>
										</label> <label class="form_checkbox"> <input
											class="sns-value cd-value" id="email_recep" name="email_usable"
											type="checkbox" data-code="MEMBER_AGR.EMAIL_RECEP" /> <span
											class="icon"></span> <span>E-mail 수신 동의</span>
										</label>
											</div>
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</section>

					<div class="btn_area">
						<a class="btn bgc_white" href="javascript:void(0);" id="withdrawal" style="width: 126px;"><span>회원탈퇴</span></a>
						<a class="btn bgc_point " href="javascript:void(0);" id="modInfo" style="width: 197px;"><span>회원정보 변경</span></a>
					</div>
				</div>
			</div>
			<!--// 내정보관리 > 정보변경 -->
		</div>
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>