var view  = {
      chk : false,
      init : function() {

            // 이메일 변경될 경우 중복확인 초기화
         $("#mbrLgnId1, #mbrLgnId2, #mbrLgnId3").on("keyPress", function (){
                $('#mbrYn').val("N");
                $('#mbrLgnId').val("");
            });

         $("#mbrLgnId3").on("change", function (){
            $('#mbrYn').val("N");
            $("#mbrLgnId2").val($(this).val()).focus();
            //$(this).val("");
         });
         $("#subMbrLgnId3").on("change", function (){
            /*$('#mbrYn').val("N");*/
            $("#subMbrLgnId2").val($(this).val()).focus();
            //$(this).val("");
         });
         // 이메일 주소확인 영역 대문자 체크 #200916
         $("#subMbrLgnId1, #subMbrLgnId2").on("change", function () {
            if($(this).val().match(/^[-A-Z]/g) != null) {
               $(this).val($(this).val().trim().toLowerCase());
            }
         });


         // 비밀번호 입력할때 빈값/일치여부 체크
         $('.input_pw').on('keyup', function(e){
            view.pwdCheck();
         });

         $('#submitBtn').on('click', function(e) {
            e.preventDefault();
            view.idCheck();
            view.pwdCheck();
            view.nameCheck();

            if(!view.chk) return false;

            view.insert();
         });
      },

      // 회원가입시 아이디 체크
      idCheck : function () {
         view.chk = false;
         $("span.pw_check").hide();

         if (!$("#mbrLgnId1").val()) {
            $("#worng-msg-email").text("이메일 주소를 입력해 주세요.").show();
            $("#mbrLgnId1").focus();
            return false;
         }

         if (!$("#mbrLgnId2").val()) {
            $("#worng-msg-email").text("이메일 주소를 입력해 주세요.").show();
            $("#mbrLgnId2").focus();
            return false;
         }

         $('#mbrLgnId').val($('#mbrLgnId1').val().trim() + "@" + $('#mbrLgnId2').val().trim());

            // 대문자 체크
            if($("#mbrLgnId1").val().match(/^[-A-Z]/g) != null || $("#mbrLgnId2").val().match(/^[-A-Z]/g) != null) {
                $("#mbrLgnId1").val($("#mbrLgnId1").val().trim().toLowerCase());
                $("#mbrLgnId2").val($("#mbrLgnId2").val().trim().toLowerCase());
                $('#worng-msg-email').text('소문자만 입력이 가능합니다.').show();
                $("#mbrLgnId1").focus();
                return false;
            }

         if ($('#mbrLgnId').val().match(/^[-a-z0-9_]+[-a-z0-9_.]*[@]{1}[-a-z0-9_]+[-a-z0-9_.]*[.]{1}[a-z]{1,5}$/g) == null) {
            $('#worng-msg-email').text('이메일이 잘못 입력되었습니다. 이메일 아이디 혹은 도메인을 다시 확인해 주세요.(1)').show();
                $("#mbrLgnId1").focus();
            return false;
         }

         if ($('#mbrYn').val() == 'N' || $('#mbrYn').val() == '') {
            $('#worng-msg-email').text('이메일 중복 확인을 해주세요.').show();
                $("#mbrLgnId1").focus();
            return false;
         }

         // (2020.08.11) 회원 가입 시 이메일 두번 입력하도록 변경
         if ($("#mbrLgnId1").val() && !$("#subMbrLgnId1").val()) {
            $("#worng-msg-email-sub").text("이메일 주소를 한번 더 입력하여 주세요.").show();
            $("#subMbrLgnId1").focus();
            return false;
         }

         if ($("#mbrLgnId1").val() != $("#subMbrLgnId1").val()) {
            $("#worng-msg-email-sub").text("이메일이 잘못 입력되었습니다. 이메일 아이디 혹은 도메인을 다시 확인해 주세요.(8)").show();
            $("#subMbrLgnId1").focus();
            return false;
         }

         if ($("#mbrLgnId2").val() && !$("#subMbrLgnId2").val()) {
            $("#worng-msg-email-sub").text("이메일 주소를 한번 더 입력하여 주세요.").show();
            $("#subMbrLgnId2").focus();
            return false;
         }

         if ($("#mbrLgnId2").val() != $("#subMbrLgnId2").val()) {
            $("#worng-msg-email-sub").text("이메일이 잘못 입력되었습니다. 이메일 아이디 혹은 도메인을 다시 확인해 주세요.(9)").show();
            $("#subMbrLgnId2").focus();
            return false;
         }

         view.chk = true;
      },
		//회원가입시 이름 체크
		nameCheck : function(){
			view.chk = false;
			$("span.worng-msg-id").text("").hide();
			if(!$("#inputid").val() || $("#inputid").val().length < 2) {
            $("#idMsg").text("이름을 입력해 주세요.").show();
               $("#inputid").focus();
            return false;
         }
			view.chk = true;
		},
      pwdCheck : function () {
            /*if(!view.chk) return false;*/
         view.chk = false;
         $("span.worng-msg-pw").text("").hide();
         if(!$("#pw").val() || $("#pw").val().length < 8) {
            $("#pwdMsg1").text("8자이상 이상 입력하세요. (대문자 1개,소문자 1개,숫자 1개,특수문자 1개 필수)").show();
                $("#pw").focus();
            return false;
         }
         if(!/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]){8,}/.test($("#pw").val())) {
            $("#pwdMsg1").text("8자이상 이상 입력하세요. (대문자 1개,소문자 1개,숫자 1개,특수문자 1개 필수)").show();
                $("#pw").focus();
            return false;
         }
         if(/(\w)\1\1/.test($("#pw").val()) || /([\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])\1\1/.test($("#pw").val()) || /([가-힣ㄱ-ㅎㅏ-ㅣ\x20])\1\1/.test($("#pw").val())) {
            $("#pwdMsg1").text("같은 문자가 3자리 이상 반복될수 없습니다.").show();
                $("#pw").focus();
                return false;
            }
            // #201119 공백 체크
            if ($("#pw").val().length != $("#pw").val().replace(/\s/g, "").length) {
                $("#pwdMsg1").text("비밀번호에 공백이 있습니다.").show();
                $("#pw").focus();
                return false;
            }
         if($("#pw").val() && !$("#subPw").val()){
            $("#pwdMsg2").text("비밀번호를 한번 더 입력하여 주세요.").show();
                $("#subPw").focus();
            return false;
         }
         if($("#pw").val() != $("#subPw").val()){
            $("#pwdMsg2").text("비밀번호가 일치하지 않습니다.").show();
                $("#subPw").focus();
            return false;
         }

            view.chk = true;

      },

      insert : function() {
         if( $('#mbrYn').val() == 'N' ||  $('#mbrYn').val() == ''){
            alert('이메일 중복확인을 해주세요');
            return false;
         }

         var flag        = true;
         var focusObjArr = new Array();

         // check flag
         if (!flag) {
            $(focusObjArr[0]).focus();
            return false;
         }

         var obj = {
               mbrLgnId : $('#mbrLgnId').val(),
               pw : $('#pw').val(),
               pw : $('#inputid').val(),
               zipCd : $('#zipCd').val(),
               baseAddr : $('#baseAddr').val(),
               dtlAddr : $('#dtlAddr').val(),
               subPw : $('#subPw').val()
         }
         var param = JSON.stringify(obj);

         $.post('/member/join/step2/proc',"POST", param, function(data){
            //console.log(data);

            if (data.result) {
               location.href ="/member/join/step3";
            } else {
               // alert message
               if (data.message && data.message != '')
                  alert(data.message);

               // move page
               if (data.returnUrl)
                  location.href = data.returnUrl;
            }
            $.hideMask();
         }, function(data){
            alert("처리중 오류가 발생 하였습니다.\n잠시후 다시 실행 하여 주십시오.");
            $.hideMask();
         });
      },
       // 아이디 중복확인
      checkId : function(v) {
         if (v == "N") {
            $("#mbrYn").val(v);
         }

         $("#mbrLgnId").val($("#mbrLgnId1").val().trim() + "@" + $("#mbrLgnId2").val().trim());
         var id = $("#mbrLgnId").val();

         // 이메일 null값 체크
         if (id == null || id == '@' || id == '') {
            $('#worng-msg-email').text('이메일을 입력해주세요.');
            $('#worng-msg-email').show();
            return false;
         }

            // 대문자 체크
         if($("#mbrLgnId1").val().match(/^[-A-Z]/g) != null || $("#mbrLgnId2").val().match(/^[-A-Z]/g) != null) {
                $("#mbrLgnId1").val($("#mbrLgnId1").val().trim().toLowerCase());
                $("#mbrLgnId2").val($("#mbrLgnId2").val().trim().toLowerCase());
                $('#worng-msg-email').text('소문자만 입력이 가능합니다.').show();
                return false;
            }

         // 이메일 정규식 체크
         if (id.match(/^[-a-z0-9_]+[-a-z0-9_.]*[@]{1}[-a-z0-9_]+[-a-z0-9_.]*[.]{1}[a-z]{1,5}$/g) == null) {
            $('#worng-msg-email').text('이메일이 잘못 입력되었습니다. 이메일 아이디 혹은 도메인을 다시 확인해 주세요.(2)');
            $('#worng-msg-email').show();
            return false;
         }

         if ($("#mbrYn").val() == "N") {
            $('#worng-msg-email').hide();
            $('#pop').attr('href', '/member/pop/checkId?id=' + id)
            subwayCommon.popupValidation($('#pop'), 510, 510);
         }

         $.hideMask();
      }
}


$(document).ready(function(){
   view.init();
});


function popIdCheck() {
   var result = true;
   alert();
   // change btn class
   $.each($('.required-value'), function(i, v){
      if ($(v).val() == 'undefined' || $(v).val() == '' || $('#mbrYn').val() == 'N' || $('#mbrYn').val() == '') {
         result = false;
         return false;
      }
   });

   if (result){
      $('#submitBtn').addClass('i_reg');
      $('#submitBtn').attr('onclick', 'view.insert()');
   }
   else {
      $('#submitBtn').removeClass('i_reg');
      $('#submitBtn').attr('onclick', null);
   }
}