
var id_check = false;
var name_check = false;
var check_pass = false;
var check_subPass = false;
var login = 0;

var view = {
	
		// 계정 검증
		id_fun : function() {
			var user_check = /^[-a-z0-9_]+[-a-z0-9_.]*[@]{1}[-a-z0-9_]+[-a-z0-9_.]*[.]{1}[a-z]{1,5}$/g;
			var user_email = ($('#mbrLgnId1').val().trim() + "@" + $('#mbrLgnId2').val().trim());

			if(!$("#mbrLgnId1").val()) {
				$("#worng-msg-email").text("이메일 주소를 입력해 주세요.").show();
				$("#worng-msg-email").css("color", "red");
				id_check = false;
		        return false;
			} else if($("#mbrLgnId1").val().length < 5 || $("#mbrLgnId1").val().length > 15) {
				$("#worng-msg-email").text("이메일 주소를 확인해 주세요. (5 ~ 15 글자 허용)").show();
				$("#worng-msg-email").css("color", "red");
	            $("#mbrLgnId1").focus();
				id_check = false;
		        return false;
			}
			
			if(!$("#mbrLgnId2").val() && $("#mbrLgnId1").val()) {
				$("#worng-msg-email").text("도메인 주소를 입력해 주세요.").show();
				$("#worng-msg-email").css("color", "red");
				id_check = false;
		        return false;
			}
			
			$.ajax({
				url : '/lubway/idCheck.do?userId=' + user_email,
				type : 'get',
				success : function(data) {
					if(data == 1) {
						$("#mbrLgnId1").focus();
						$("#worng-msg-email").text('이미 사용 중이거나 탈퇴된 계정입니다.').show();
						$("#worng-msg-email").css("color", "red");
						id_check = false;
				        return false;
					} else {
						if(!user_check.test(user_email)) {
							$("#worng-msg-email").text("이메일이 잘못 입력되었습니다. 이메일 아이디 혹은 도메인을 다시 확인해 주세요.").show();
							$("#worng-msg-email").css("color", "red");
							id_check = false;				
					        return false;
						} else if(!$("#mbrLgnId1").val() && !$("#mbrLgnId2").val()) {
							$("#worng-msg-email").text("이메일 주소를 입력해 주세요.").show();
							$("#worng-msg-email").css("color", "red");
							id_check = false;							
					        return false;
						} else {
							$("#worng-msg-email").text("사용 가능한 계정입니다.").show();
							$("#worng-msg-email").css("color", "green");
							$("#fullId").val(user_email);
							console.log($("#fullId").val());
							id_check = true;
						}
					}
				},
				error : function(data) {
					id_check = false;
			        return false;
				}
			});
	},//end id_fun
		
	// 이름 검증
	name_fun : function() {
		var name = $("#inname").val();
		var check_name = /^[가-힣]{2,15}$/;
		
		if(!check_name.test(name) || name == "") {
			$("#idMsg").text("이름이 올바르지 않습니다. (2 ~ 5 글자 허용)").show();
			$("#idMsg").css("color", "red");
			name_check = false;
	        return false;
		} else {
			$("#idMsg").text("").show();
			name_check = true;
		}
	},//end name_fun
	
	// 패스워드 검증
	pass_fun : function() {
		if(check_subPass) {
			view.subPass_fun();
		}
		var pass = true;
		if(!$("#pw").val || $("#pw").val().length < 8) {
			$("#pwdMsg1").text("8자이상 이상 입력하세요. (대문자 1개,소문자 1개,숫자 1개,특수문자 1개 필수)").show();
			$("#pwdMsg1").css("color", "red");
			check_pass = false;
			pass = false;
	        return false;
		}

		if(!/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]){8,}/.test($("#pw").val())) {
			$("#pwdMsg1").text("8자이상 이상 입력하세요. (대문자 1개,소문자 1개,숫자 1개,특수문자 1개 필수)").show();
			$("#pwdMsg1").css("color", "red");
			check_pass = false;
			pass = false;
	        return false;
		}
		
		if(/(\w)\1\1/.test($("#pw").val()) || /([\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])\1\1/.test($("#pw").val()) || /([가-힣ㄱ-ㅎㅏ-ㅣ\x20])\1\1/.test($("#pw").val())) {
			$("#pwdMsg1").text("같은 문자가 3자리 이상 반복될수 없습니다.").show();
			$("#pwdMsg1").css("color", "red");
			check_pass = false;
			pass = false;
	        return false;
		}

		if($("#pw").val().length != $("#pw").val().replace(/\s/g, "").length) {
			$("#pwdMsg1").text("비밀번호에 공백이 있습니다.").show();
			$("#pwdMsg1").css("color", "red");
			check_pass = false;
			pass = false;
	        return false;
		}

		if(pass) {
			$("#pwdMsg1").text("사용 가능한 비밀번호입니다.").show();
			$("#pwdMsg1").css("color", "green");
			$("#pwdMsg2").text("비밀번호를 한번 더 입력하여 주세요.").show();
			$("#pwdMsg2").css("color", "red");
			check_pass = true;
			view.subPass_fun();
		}
	},//end pass_fun
	
	// 패스워드 확인 검증
	subPass_fun : function() {
		subPass = true;
		if(!$("#pw").val() && !$("#subPw").val()){
			$("#pwdMsg2").text("비밀번호를 한번 더 입력하여 주세요.").show();
			$("#pwdMsg2").css("color", "red");
			check_subPass = false;
			subPass = false;
	        return false;
		}

		if($("#pw").val() != $("#subPw").val()){
			$("#pwdMsg2").text("비밀번호가 일치하지 않습니다.").show();
			$("#pwdMsg2").css("color", "red");
			check_subPass = false;
			subPass = false;
	        return false;
		}
		
		if(subPass && check_pass && $("#pw").val() != "") {
			$("#pwdMsg2").text("비밀번호가 일치합니다.").show();
			$("#pwdMsg2").css("color", "green");
			check_subPass = true;
		}
	}
	
	
}//end view

$(document).ready(function() {
	$("#submitBtn").on("click", function() {
		if(login == 1) return false;
		
		if(!$("#mbrLgnId1").val()) {
			$("#worng-msg-email").text("이메일 주소를 입력해 주세요.").show();
	        $("#mbrLgnId1").focus();
	        return false;
		} else {
			view.id_fun();
		}		
		
		if(!$("#inname").val()) {
			$("#idMsg").text("이름을 입력해 주세요.").show();
			$("#inname").focus();
			return false;
		} else {
			if(!id_check) return false;
			view.name_fun();
		}
		
		if(!$("#pw").val()) {
			$("#pwdMsg1").text("비밀번호를 입력해 주세요.").show();
			$("#pw").focus();
			return false;
		} else {
			if(!name_check) return false;
			view.pass_fun();
		}
				
		if(!$("#subPw").val()) {
			$("#pwdMsg2").text("비밀번호 확인을 입력해 주세요.").show();
			$("#subPw").focus();
			return false;
		} else {
			if(!check_pass) return false;
			view.subPass_fun();
		}

		if(id_check && name_check && check_pass && check_subPass) {
			console.log(id_check);
			console.log(name_check);
			console.log(check_pass);
			console.log(check_subPass);

			login = 1;
			$("#submitBtn").bind('click', false)
			console.log("모든 검증 완료");
		}			
	});//end submitBtn check

	// 도메인 선택 처리
	$("#mbrLgnId3").on("change", function () {
		$("#mbrLgnId2").val($(this).val()).focus();
		view.id_fun();
	});

	$("#mbrLgnId2").on("keyup", function () {
		$("#mbrLgnId3 option:eq(0)").prop("selected", true);
	});

	//대문자 체크 - 이메일
	$("#mbrLgnId1").on("blur", function() {
		var check_email = $("#mbrLgnId1").val();
		var check_capital = /^[-A-Z]/g;
		
		if(check_capital.test(check_email)) {
			$("#mbrLgnId1").val($("#mbrLgnId1").val().trim().toLowerCase());
			$("#worng-msg-email").text('소문자만 입력이 가능합니다.').show();
			$("#worng-msg-email").css("color", "red");
			$("#mbrLgnId1").focus();
		}
	});//end email capital check
	
	//대문자 체크 - 도메인
	$("#mbrLgnId2").on("blur", function() {
		var check_domain_email = $("#mbrLgnId2").val();
		var check_domain_capital = /^[-A-Z]/g;
		
		if(check_domain_capital.test(check_domain_email)) {
			$("#mbrLgnId2").val($("#mbrLgnId2").val().trim().toLowerCase());
			$("#worng-msg-email").text('소문자만 입력이 가능합니다.').show();
			$("#mbrLgnId2").focus();
		}
	});//end domain capital check
	
	//이메일 검증
	$("#mbrLgnId1").on("keyup", view.id_fun);
	$("#mbrLgnId2").on("keyup", view.id_fun);
	$("#inname").on("focus", view.id_fun);
	
	//이름 유효성 검사
	$("#inname").on("keyup", view.name_fun);
	
	//비밀번호 유효성 검사
	$("#pw").on("keyup", view.pass_fun);

	// 비밀번호 확인 검증
	$("#subPw").on("keyup", view.subPass_fun);
	
});//end document ready function

