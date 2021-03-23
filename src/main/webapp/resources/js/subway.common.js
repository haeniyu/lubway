/**
 * 공통 스크립트
 */
(function($){

	/*====================================================================================
    ' 함수명 : $.fn.closePop
    ' 기  능 : 아이프레임 팝업종료
    '=====================================================================================*/
	$.fn.closePop = function(){
		$('body').css('overflow-y','auto');
		$('body .popup_iframe_wrapper').remove();
		TweenLite.to($('body >.popup_dim'),0.5,{ease:Power4.easeOut, opacity:0,onComplete:function(){
				$('body >.popup_dim').remove();
			}});
	},

		/*====================================================================================
        ' 함수명 : $.fn.showBlockMask(msg)
        ' 인  수 : msg - 로딩 메세지
        ' 기  능 : 특정 Element 마스크 처리 및 로딩문구 노출
        ' 리턴값 : 없음.
        '=====================================================================================*/
		$.fn.showBlockMask = function(msg){
			$(this).block({
				message: (msg == "" || msg == undefined) ? "Please Wait..." : msg,
				css: {
					border: 'none',
					padding: '15px',
					//backgroundColor: '#eee',
					'-webkit-border-radius': '10px',
					'-moz-border-radius': '10px',
					opacity: 5,
					color: '#000'
				},
				overlayCSS: {
					backgroundColor: '#a7a7a7',
					opacity: 0.6,
					cursor: 'wait'
				}
			});
		},
		/*====================================================================================
        ' 함수명 :$.fn.hideBlockMask(msg)
        ' 인  수 : msg - 완료 메세지
        ' 기  능 : 특정 Element 마스크 해제 처리
        ' 리턴값 : 없음.
         '=====================================================================================*/
		$.fn.hideBlockMask = function(msg){
			if (msg == "" || msg == undefined) {
				$(this).unblock();
			}
			else {
				$(this).unblock({
					onUnblock: function () {
						alert(msg);
					}
				});
			}
		},
		/*====================================================================================
       ' 함수명 : $.showMask(msg)
       ' 인  수 : msg - 로딩 메세지
       ' 기  능 : 페이지 마스크 처리 및 로딩문구 노출
       ' 리턴값 : 없음.
       '=====================================================================================*/
		$.showMask = function(msg){
			$.blockUI({
				//message : "<div id='lottie'></div>",
				message : "<image src='/images/common/lottie_animation.gif' class='lottie_ani'>",
				css: {
					width: "160px",
					height:"160px",
					display:"block",
					overflow: "hidden",
					transform: "translate3d(0,0,0)",
					textAlign: "center",
					backgroundColor: "transparent",
					border: "none",
					margin: "-80px 0 0 -80px",
					left: "50%"
				},
				overlayCSS: {
					backgroundColor: "#000000",
					opacity: "0",
					margin: "0px",
					height: "100%",
					overflow: "hidden"
				}
			});



			// var params = {
			//         container: document.getElementById('lottie'),
			//         renderer: 'svg',
			//         loop: true,
			//         autoplay: true,
			//         animationData: "undefined" == typeof animationData ? window.parent.animationData : animationData
			//     };

			// if("undefined" == typeof lottie.loadAnimation) {
			// 	window.parent.lottie.loadAnimation(params);
			// } else {
			// 	lottie.loadAnimation(params);
			// }
		},
		/*====================================================================================
        ' 함수명 : $.hideMask(msg)
        ' 인  수 : msg - 완료 메세지
        ' 기  능 : 페이지 마스크 제거
        ' 리턴값 : 없음.
        '=====================================================================================*/
		$.hideMask = function(msg){
			if (msg == "" || msg == undefined) {
				//setTimeout($.unblockUI(), 9000);
				$.unblockUI();
			}
			else {
				$.unblockUI({
					onUnblock: function () {
						alert(msg);
					}
				});
			}
		},
		/*=======================================================================================
        ' 함수명 : $.fn.checkEmail()
        ' 인  수 : Email - 이메일주소
        ' 기  능 : 이메일 체크
        ' 리턴값 : true/false
        '======================================================================================*/
		$.fn.checkEmail = function(){
			var reg = new RegExp("^[\\w\\-]+(\\.[\\w\\-_]+)*@[\\w\\-]+(\\.[\\w\\-]+)*(\\.[a-zA-Z]{2,3})$", "gi");
			if (!reg.test(this.val())) {
				return false;
			}
			else {
				return true;
			}
		},
		/*====================================================================================
        ' 함수명 : $.fn.pager(obj)
        ' 인  수 : obj.size   - 페이지 사이즈
        '          obj - obj.page  		: page no
        '          obj - obj.pageCount  : total count
        '          obj - obj.size  		: pageSize
        '          obj - obj.fun  		: function
        ' 기  능 :  페이지 네비게이션 생성처리
        ' 리턴값
        '=====================================================================================*/
		$.fn.pager = function(obj){

		},
		/*====================================================================================
        ' 함수명 : $.post(url, reqMethod, param, successfn, failFn)
        ' 인  수 : url   - 호출 주소
        '        reqMethod - post, get
        '        param  - parameter 값 (Json)
        '        successfn : 처리 성공시 호출 함수
        '        failFn    : 실패시 호출 함수
        ' 기  능 :  Ajax 처리
        ' 리턴값
        '=====================================================================================*/
		$.post = function(url, reqMethod, param, successfn, failFn){
			var method = (reqMethod == null || reqMethod == undefined || reqMethod == "") ? "POST" : reqMethod;

			// csrf
			// var token  = $("meta[name='_csrf']").attr("content");
			// var header = $("meta[name='_csrf_header']").attr("content");

			// 대기 문구 노출
			$.showMask();

			$.ajax({
				type: method,
				url: url,
				data : param,
				dataType: "json",
				contentType: "application/json",
				beforeSend: function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
					// xhr.setRequestHeader(header, token);
				},
				cache: false,
				success: function (data) {
					successfn(data);

					// 대기 문구 숨김
					$.hideMask();
				},
				error: function (xhr, ajaxOptions, thrownError) {
					subwayCommon.errorAjaxProcess(xhr);

					if (failFn == null || failFn == undefined || failFn == "") {

					} else {
						failFn("error" + thrownError);
					}
					// 대기 문구 숨김
					$.hideMask();
				}
			});
		},
		/*====================================================================================
        ' 함수명 : $.fn.pass()
        ' 기  능  :  비밀번호 유혀성 검사
        ' 리턴값 : 0 - 사용가능 , 1 - 자리수 미달 , 2 - 영문.숫자,특수문자 조합 오류
        '=====================================================================================*/
		$.fn.pass = function(){
			var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}/;

			if(!regex.test(this.val())) {
				return false;
			}

			return true;
		}

	/*====================================================================================
    ' 함수명 : $.fn.getDateByjQueryDateFormat
    ' 기  능  :  query datepicker의 y m d 형식의 문자열로 날짜 구하기
    ' @param value jquery datepicker의 "-1y +1m +2d" 형식
    '=====================================================================================*/
	$.fn.getDateByjQueryDateFormat = function (value, baseDate) {
		var today = new Date();
		if(baseDate != null && typeof(baseDate) === 'object')
			today = new Date(baseDate.getFullYear(), baseDate.getMonth(), baseDate.getDate());
		//alert("today : " + today);
		var elements = value.toString().split(' ');
		for(var x in elements) {
			var num = eval(elements[x].substr(0, elements[x].length - 1).toString());
			var flag = elements[x].substr(elements[x].length -1).toString().toLowerCase();
			if(flag == 'd')
				today.setDate(today.getDate() + num);
			else if(flag == 'm')
				today.setMonth(today.getMonth() + num);
			else if(flag == 'y')
				today.setFullYear(today.getFullYear() + num);
		}
		return today;
	}

	/*=========================
	' 함수명 : $fn.getyyyyMMdd
    ' 기  능  : 날짜 객체를 yyyy-MM-dd 형식으로 가져옴
    ' 구분자 : 기본값 (-)
	==========================*/
	$.fn.getyyyyMMdd = function (dataObject, separator) {
		if( separator == null)
			separator = '-';

		var str = null;
		var month = dataObject.getMonth() + 1;
		var day = dataObject.getDate();
		if (month < 10) {
			month = '0' + month;
		}
		if (day < 10) {
			day = '0' + day;
		}
		str = dataObject.getFullYear() + separator + month + separator + day;
		return str;
	}



	$.fn.shareFacebook = function(ts, url) {
		if(url == null || url == "" || url == undefined) {
			url = window.location.href;
		}

		var title = $(ts).data('title');
		window.open('//www.facebook.com/sharer/sharer.php?u='+url+'&t='+title);

		return false;
	}

	$.fn.shareKakao = function(ts) {

		var title = $(ts).data('title');
		var image = window.location.protocol + '//' + window.location.host + $(ts).data('image');
		var url = url = window.location.href;
		Kakao.Link.sendDefault({
			objectType: 'feed',
			content: {
				title: title,
				description: 'SUBWAY - 써브웨이',
				imageUrl: image,
				imageWidth: 570,
				imageHeight: 400,
				link: {
					mobileWebUrl: url,
					webUrl: url
				}
			}
		});

		return false;
	}
	$.getParameterByName = function(name, url) {
		if (!url) url = window.location.href;
		name = name.replace(/[\[\]]/g, "\\$&");
		var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
			results = regex.exec(url);
		if (!results) return null;
		if (!results[2]) return '';
		return decodeURIComponent(results[2].replace(/\+/g, " "));
	}

	/**
	 * 좌측문자열채우기
	 * @params
	 *  - str : 원 문자열
	 *  - padLen : 최대 채우고자 하는 길이
	 *  - padStr : 채우고자하는 문자(char)
	 */
	$.lpad = function(str, padLen, padStr) {

		if (padStr.length > padLen) {
			console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
			return str;
		}
		str += "";
		padStr += "";
		while (str.length < padLen)
			str = padStr + str;
		str = str.length >= padLen ? str.substring(0, padLen) : str;
		return str;
	}

	/**
	 * dateFormat
	 * @params
	 *  - d : Date
	 *  - f : format String
	 */
	$.dateFormat = function(d, f) {

		if (!this.valueOf()) return " ";

		var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];

		return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
			switch ($1) {
				case "yyyy": return d.getFullYear();
				case "yy": return $.lpad(d.getFullYear() % 1000, 2, "0");
				case "MM": return $.lpad(d.getMonth() + 1, 2, "0");
				case "dd": return $.lpad(d.getDate(), 2, "0");
				case "E": return weekName[d.getDay()];
				case "HH": return $.lpad(d.getHours(), 2, "0");
				case "hh": return $.lpad((h = d.getHours() % 12) ? h : 12, 2, "0");
				case "mm": return $.lpad(d.getMinutes(), 2, "0");
				case "ss": return $.lpad(d.getSeconds(), 2, "0");
				case "a/p": return d.getHours() < 12 ? "오전" : "오후";
				default: return $1;
			}
		});
	},

		/**
		 * numberFormat
		 * @params
		 *  - n : number
		 *  - f : fix string
		 */
		$.numberFormat = function(d, f) {

			if (d == undefined || d == null)
				return d;

			f = f == undefined || f == null ? ',' : f;

			return d.toString().replace(/\B(?=(\d{3})+(?!\d))/g, f);
		}
})(jQuery);



var subwayCommon = {

	// iframe 오픈 시 해당 url 에러 검증 후 팝업 오픈.
	popupValidation : function (obj, w, h) {

		var p_target = $(obj).attr('href');

		$.get(p_target, function() {
			popup_open_wh(obj, w, h);
		}).fail(function(e) {
			subwayCommon.errorAjaxProcess(e);
		});
	},

	errorAjaxProcess : function (xhr, ajaxOptions, thrownError) {
		if(xhr.responseJSON != null){
			var url = null;

			// alertType
			if(xhr.responseJSON.alertType != null) {

				if (xhr.responseJSON.alertType == 'ALERT') {

					alert(xhr.responseJSON.message);
					url = xhr.responseJSON.confirmUrl;
				} else if (xhr.responseJSON.alertType == 'CONFIRM') {

					if (alert(xhr.responseJSON.message))
						url = xhr.responseJSON.confirmUrl+ "?returnUrl=" + location.pathname;
					else
						url = xhr.responseJSON.cancelUrl;
				} else
					alert(xhr.responseJSON.message);
			} else
				alert(xhr.responseJSON.message);

			// move url
			if (url != null && url != ''){
				switch(url) {
					case '-1' :
						history.back();
						break;
					case '-2':
						self.close();
						break;
					default:
						location.href = url;
				}
			}
		}else{
			console.log("error : " + thrownError);
		}

		if (typeof (opener) != "undefined" && opener != null) {
			opener.location.href = '/';
		} else {
			if (url == null || url == '') {
				// #201019 팝업 내 exception 발생 시, 부모 페이지 리로드 현상 수정 (ex. 야채 선택 팝업, 최근 야채 없을 때)
				//location.reload();
			} else {
				location.href = "/";
			}
		}
	},

	copyToClipboard: function(textData, targetObj) {

		/*
		//  Dialog를 사용하는 방법
		var IE = (document.all) ? true : false;
		if (IE) {
			if(confirm("주소를 클립보드에 복사하시겠습니까?"))
				window.clipboardData.setData("Text", textData);
		}
		else {
			temp = prompt("이 글의 트랙백 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", textData);
		}
		*/

		//  임의의 Element를 사용하는 방법
		var tempDiv = document.createElement('div');
		tempDiv.contentEditable = true;
		document.body.appendChild(tempDiv);

		tempDiv.innerHTML = textData;
		tempDiv.unselectable = "off";
		tempDiv.focus();

		document.execCommand('SelectAll');
		document.execCommand("Copy", false, null);
		document.body.removeChild(tempDiv);

		//  tempDiv로 이동된 포커스를 다시 가져온다.
		targetObj.focus();
		targetObj.blur();

		alert("주소가 복사되었습니다.");
	},

	shareToFacebook: function(url) {
		var popup = "http://www.facebook.com/sharer/sharer.php?u="
			+ encodeURIComponent(url);
		window.open(popup);
	},
	shareToKakao: function(containerId, label, imgSrc, url) {

		if (waffle.isMobile() == false) {
			document.getElementById("ui_kakao_btn").style.display = "none";
		}

		Kakao.init('247d92c0db39275acffc54aade477142');
		Kakao.Link.createTalkLinkButton({
			container: "#" + containerId,
			label: label,
			image: {
				src: imgSrc,
				width: '300',
				height: '200'
			},
			webButton: {
				text: '써브웨이',
				url: url
			}
		});
	},
	inputOnlyDigit: function(obj) {
		obj.value = obj.value.replace(/[^0-9-]/g, '');
	},
	inputEmail: function(obj) {
		obj.value = obj.value.replace(/[^0-9a-zA-Z_.@\-]/g, '');
	},
	escapeHtml: function(unsafe) {
		return unsafe
			.replace(/&/g, "&amp;")
			.replace(/</g, "&lt;")
			.replace(/>/g, "&gt;")
			.replace(/"/g, "&quot;")
			.replace(/'/g, "&#039;")
			.replace(/[?]/g, "&#63;");
	},

	/*====================================================================================
    ' 함수명 : changeNumberToCurrencyFormat
    ' 인  수 : obj - json object, jsonObjectArray, field - 통화포멧으로 변경할 field명 Array (null로 입력할경우 전체데이터중 숫자값은 모두 변환)
    ' 기  능 : 금액 -> , 달린 금액 String 으로 변경
    ' 리턴값 : 해당 obj에 새로운 값 매핑
    '=====================================================================================*/
	changeNumberToCurrencyFormat : function(obj, field) {

		// 변환 대상이 오브젝트가 아닐경우 종료
		if("object" != typeof obj) {
			return;
		}

		if(obj instanceof Array) {
			$.each(obj, function(i, item) {
				subwayCommon.changeNumberToCurrencyFormatObj(item, field);
			});
		} else {
			subwayCommon.changeNumberToCurrencyFormatObj(obj, field);
		}
	},
	changeNumberToCurrencyFormatObj : function(eachObj, field) {
		var keyArr = field;

		// 변환필드가 들어오지 않았을경우 모든 숫자형태 변경
		if(keyArr == null) {
			keyArr = keys(eachObj);
		}

		$.each(keyArr, function(i, key) {
			eachObj[key] = subwayCommon.numberToCurrencyFormat(eachObj[key]);
		});
	},
	numberToCurrencyFormat : function(num) {
		if("number" != typeof num) { return; }

		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	},
	stringCurrencyFormatToNumber : function(string) {
		if("number" == typeof string) { return string; }
		string = string.replace(/,/gi,'');
		return parseInt("" == string ? "0" : string);
	},

	// 해당 객체로 스크롤 이동
	scrollMove : function(moveTarget) {
		var top = $(moveTarget).offset().top;
		var header = $("#header").height() + 20;

		$("html").animate({scrollTop:top - header}, 0);
	},

	// 숫자만 입력 가능하도록 수정
	onlyNum : function() {
		var target = $(this);
		var value = target.val();
		value = value.replace(/[^0-9]/g, "");

		target.val(value);
	},

	// 숫자입력인지 확인
	checkNum : function(target) {
		var value = target.val();
		value = value.replace(/[^0-9]/g, "");

		return /[0-9]/g.test(value);
	},

	// 현재 영업중인 매장인지 체크
	isValidOrderFranchise : function() {
		$.ajax({
			type: "POST",
			url: "/order/progress/franchiseCheck",
			cache: false,
			success: function(result) {
				//console.log(result);
			},
			error: function (xhr, ajaxOptions, thrownError) {
				subwayCommon.errorAjaxProcess(xhr, ajaxOptions, thrownError);
			}
		});
	}
};

// 메뉴소개 하위 추천 소스가 있을 경우 문구 추가 처리 _by ahn.180322
$(document).ready(function(){
	var isNot = $(".recipe").hasClass("isNot"); //랩시리즈 문구 추가처리
	var isRecommand = $(".recipe div").hasClass("rec");
	if(isNot){
		if (isRecommand){
			var str_common = '<p class="not">* 매장에 따라 추천소스는 상이할 수 있습니다.</p>';
			$(".recipe").parent().append(str_common);
		}else{
			var str_common = '<p class="not"></p>';
			$(".recipe").parent().append(str_common);
		}
	} else {
		if (isRecommand){
			var str_common = '<p class="not">* 매장에 따라 추천소스는 상이할 수 있습니다.<br>* 써브웨이가 제공하는 신선한 야채가 정량으로 제공됩니다.</p>';
			$(".recipe").parent().append(str_common);
		}else{
			var str_common = '<p class="not">* 써브웨이가 제공하는 신선한 야채가 정량으로 제공됩니다.</p>';
			$(".recipe").parent().append(str_common);
		}
	}
});


if ( ! Number.isNaN ){
	Number.isNaN = function isNaN ( value ){  return value !== value;  };
}