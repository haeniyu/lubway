function phoneCheck(){
	var form = document.certForm;
	if(form.phone.value==""){
		alert("번호를 입력해주세요.");
		form.phone.focus();
		return;
		}
	if(form.code.value==""){
		alert("인증번호를 확인해주세요.");
		form.code.focus();
		return;
	}
}

