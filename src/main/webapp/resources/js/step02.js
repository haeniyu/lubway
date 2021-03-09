$(function() {
	var view = {
		chk: false,
		init: function() {
			$('#sendBtn').on('click', function(e) {
				e.preventDefault();
				view.sendSms('sendSms');
			})
			$('#submitBtn').on('click', function(e) {
				e.preventDefault();
				if (!view.chk) return false;
				view.done();
			});
		},

		sendSms: function(pageName) {
			view.chk = false;
			let phoneNum = $('#phoneNum').val();
			if (phoneNum != '') {
				console.log("문자를 전송합니다.");
				$("#certForm").attr("action", pageName + ".do");
				$("#certForm").submit();
				alert("전송되었습니다.\n인증번호를 아래에 입력해주세요.");
				
				document.certForm.codeNum.focus();
			} else {
				alert("번호를 입력해주세요.");
				phoneNum.focus();
				return view.chk = false;
			}
		},

		done: function() {
			if (view.chk)
				document.certForm.submit();
			else
				alert("휴대폰 인증을 진행해주세요.");
		}
	}

	$(document).ready(function() {
		view.init();
	});
});
