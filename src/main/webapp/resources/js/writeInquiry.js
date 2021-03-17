var view = {

	save: function() {
		var flag = view.param();
		if (!flag) {
			return false;
		}
		alert("등록되었습니다.");
		document.form.submit();
	},

	param: function() {
		var flag = true;

		if (($("select[name=area] option:selected").val() == "")) {
			alert("지역을 선택해주세요.");
			return;
		}
		if ($("input:text[name=title]").val().trim() == "") {
			alert("제목을 입력해주세요.");
			$("input:text[name=title]").focus();
			return;
		}
		if ($("textarea[name=content]").val() == "") {
			alert("내용을 입력해주세요.");
			$("textarea[name=content]").focus();
			return;
		}
		if (!$("input:checkbox[name=agree3]").is(":checked")) {
			alert("신청·문의사항에 대한 답변 처리에 따른 동의가 필요합니다.");
			$("input:checkbox[name=agree3]").focus();
			return;
		}
		return flag;
	}

}

$(document).ready(function() {
	$("#submitBtn").on("click", function() {
		view.save();
	});
});