$(function() {
	var view = {

		init: function() {
			$('#agreeAllCbx').prop("checked", true).trigger("click");
			view.bindEvent();
		},

		bindEvent: function() {

			// agreeAllCbx
			$('#agreeAllCbx').on('click', function(e) {

				if ($(this).is(":checked")) {
					$('.chk-value').prop('checked', true);
					$('.sns-value').prop('checked', true);
					$('.agree_all').addClass('on');
				}
				else {
					$('.chk-value').prop('checked', false);
					$('.sns-value').prop('checked', false);
					$('.agree_all').removeClass('on');
				}
			});

			// checkBox
			$('.chk-value').on('click', function(e) {

				if ($('.chk-value').length != $('.chk-value:checked').length) {
					$('#agreeAllCbx').prop('checked', false);
					$('.agree_all').removeClass('on');
				} else {
					$('#agreeAllCbx').prop('checked', true);
					$('.agree_all').addClass('on');
				}
			});

			// requuired-check value
			$('input[type="checkbox"]').on('click', function(e) {

				if ($('.required-value').length != $('.required-value:checked').length) {
					$('#authBtn').removeClass('i_reg bgc_point').addClass('bgc_white');
				} else {
					$('#authBtn').addClass('i_reg bgc_point').removeClass('bgc_white');
				}
			});

			// marketing checkbox
			$('#marketing').on('click', function(e) {

				if ($(this).is(":checked"))
					$('.sns-value').prop('checked', true);
				else
					$('.sns-value').prop('checked', false);
			});

			// sns-checkBox
			$('.sns-value').on('click', function(e) {

				if ($('.sns-value').length != $('.sns-value:checked').length) {
					$('#marketing').prop('checked', false);
					//$('#agreeAllCbx').prop('checked', false);
				}
				else {
					$('#marketing').prop('checked', true);
					//$('#agreeAllCbx').prop('checked', true);
				}
				if ($('.chk-value').length == $('.chk-value:checked').length) {
					$('#agreeAllCbx').prop('checked', true);
				} else {
					$('#agreeAllCbx').prop('checked', false);
				}

			});

			// auth btn bind
			$('#authBtn').on('click', function(e) {
				e.preventDefault();
				
				if (!$(this).hasClass('i_reg')) {
					alert('필수값을 선택해주세요.');
					return false;
				} else {
					$.ajax({
						type: "POST",
						url: "/lubway/step02.do",
						data: {
							sms : $("#sms_recep").is(":checked"),
							email : $("#email_recep").is(":checked")
						},
						success: function() {
							$("#checkForm").submit();
						},
						error: function() {
							console.log("실패");
						}
					});
				}

			});
		},

	}

	$(document).ready(function() {
		view.init();
	});
});