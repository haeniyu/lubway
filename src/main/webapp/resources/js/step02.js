var view = {
	chk: false,
	init: function() {
		$('#phoneNum').val("N");
		$('#codeNum').val("N");

		$('#submitBtn').on('click', function(e) {
			e.preventDefault();
			view.phoneCheck();
			view.codeCheck();

			if (!view.chk) return false;

			view.done();
		});
	},

	phoneCheck: function() {
		view.chk=false;
		var form = document.certForm;
		if (form.phone.value.startsWith('010')) {
			//자바스크립트로 보내야하는 지경이야?...
			alert("전송되었습니다.\n인증번호를 아래에 입력해주세요.");
			form.code.focus();
			return true;
		}else {
			alert("번호를 입력해주세요.");
			form.phone.focus();
			return false;
		}
	},

	codeCheck: function() {
		view.chk=false;
		var form = document.certForm;
		if (form.code.value == "") {
			alert("인증번호를 확인해주세요.");
			form.code.focus();
			return false;
		}
		//맞는지 확인 필요
		alert("확인되었습니다.");
		view.chk=true;
	},

	done: function() {
		if(view.chk)
			document.certForm.submit();
		else
			alert("휴대폰 인증을 진행해주세요.");
	}
}

$(document).ready(function() {
	view.init();
});
