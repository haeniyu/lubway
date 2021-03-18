	$(document).ready(function() {
		//인증 받았는지 확인하는 변수
		var check = false;

		//전송 버튼 눌렀을 때
		$("#sendBtn").on("click", function() {
			//휴대폰 번호 유효성 검사
			var phoneNum = $('#phoneNum').val().trim();
			var checkNum = /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;

			if (phoneNum == null || phoneNum == '') {
				alert("번호를 입력해주세요.");
				$("#phoneNum").focus();
				check = false;
				return false;
			}

			if (!checkNum.test(phoneNum)) {
				alert("번호가 올바르지 않습니다.");
				$("#phoneNum").focus();
				check = false;
				return false;
			}

			$.ajax({
				url : '/lubway/sendSms.do?tell=' + phoneNum,
				type : 'post',
				success : function(data) {
					if(data == "" && findId != 1 && findPwd == 'null') {
						alert("이미 가입된 휴대폰 번호입니다.");
						check = false;
						return false;
					} else if(data == 1) {
						alert("가입된 휴대폰 번호가 없습니다.");
						check = false;
						return false;
					} else {
						alert("인증번호를 전송하였습니다.");
						$("#codeNum").val(data);
						$("#checkBtn").on("click", function() {
							if ($("#codeNum").val() == data) {
								alert("인증에 성공하였습니다.");
								check = true;
							} else {
								alert("인증번호가 틀렸습니다.");
								$("#codeNum").focus();
								check=false;
							}
						});
					}
				},
				error : function(data) {
					alert("인증에 실패하였습니다.");
					check = false;
				}
			});
			
		});

		//인증 완료 버튼 눌렀을 때
		$("#submitBtn").on("click", function() {
			if (check) {
				if(findId != "null") {	
					
					var tel = $("#phoneNum").val();
					var form = document.createElement("form");
			        form.setAttribute("method", "Post");
			        
			       	form.setAttribute("action", "/lubway/resultId.do");

			        var hiddenField = document.createElement("input");
			        hiddenField.setAttribute("type", "hidden");
			        hiddenField.setAttribute("name", "tel");
			        hiddenField.setAttribute("value", tel);

			        form.appendChild(hiddenField);
			        document.body.appendChild(form);
			        form.submit();
					
				} else if(findPwd != "null") {
					
					var tel = $("#phoneNum").val();
					var form = document.createElement("form");
			        form.setAttribute("method", "Post");
			        
					form.setAttribute("action", "/lubway/resultPwd.do");

			        var hiddenField = document.createElement("input");
			        hiddenField.setAttribute("type", "hidden");
			        hiddenField.setAttribute("name", "tel");
			        hiddenField.setAttribute("value", tel);

			        form.appendChild(hiddenField);
			        document.body.appendChild(form);
					form.submit();
				} else {
					$("#certForm").submit();
				}
			} else {
				alert("인증을 진행해주세요.");
			}
		});
		
	});
