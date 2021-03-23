$(document).ready(function () {
	gnb();//gnb
	if ($('.sub_header').length > 0) {
		bodyScroll();//body scroll
	}

	if ($('div').hasClass('store_list')) {
		$('.store_list ul').mCustomScrollbar();
	}

	if ($('div').hasClass('scroll_wrap')) {
		$('.scroll_wrap').mCustomScrollbar({
			scrollInertia: 800,
		});
	}

	// if(location.hostname.indexOf("www") < 0 && location.hostname.indexOf("local") < 0) location.href = "https://www.subway.co.kr" + location.pathname;
})

function bodyScroll() {//body scroll
	var header = $('#header');
	var subHeader = $('.sub_header')
	var subLogo = subHeader.find('.logo')
	var subTop = subHeader.find('.top')
	var spd = 0.5;
	var eft = Power3.easeOut;
	var subHeaderTop = subHeader.offset().top

	scrollBarTo();
	$(window).on('scroll touchmove', function () {//window scrollto
		scrollBarTo();
	})

	function scrollBarTo() {
		if ($(window).scrollTop() > subHeaderTop) {
			TweenLite.to(subHeader.css('position', 'fixed'), 0.5, { ease: Power4.easeOut, backgroundColor: '#fff' })
			subHeader.addClass('fixed');
			TweenLite.to(subLogo, spd, { ease: eft, opacity: 1 })
			TweenLite.to(subTop, spd, { ease: eft, opacity: 1 })
		} else {
			TweenLite.to(subHeader.css('position', 'absolute'), 0.5, { ease: Power4.easeOut, backgroundColor: 'transparent' })
			subHeader.removeClass('fixed');
			TweenLite.to(subLogo, spd, { ease: eft, opacity: 0 })
			TweenLite.to(subTop, spd, { ease: eft, opacity: 0 })
		}
	}

	subTop.on('click', function () {//top button
		$('html,body').stop(true, false).animate({
			scrollTop: 0
		}, 1000, 'easeInOutQuint')
		return false;
	})
}


function gnb() {//gnb
	var spd = 0.5,
		eft = Power4.easeOut;
	$('#gnb >ul >li >.dp1').on('mouseenter', function () {
		TweenLite.to($('#header').css('overflow', 'inherit').addClass('open'), spd, { ease: eft, height: 425 })
		TweenLite.to($('.dp2'), spd, { ease: eft, top: 0, opacity: 1 })
	})

	$('#gnb').on('mouseleave', function () {
		TweenLite.to($('#header').css('overflow', 'hidden'), spd, {
			ease: eft, height: 165, onComplete: function () {
				$('#header').removeClass('open')
			}
		})
		TweenLite.to($('.dp2'), spd, { ease: eft, top: -20, opacity: 0 })
	})
}


function eventSlider() {//이벤트ㆍ프로모션 슬라이더
	$('.evnet_slider').bxSlider({
		infiniteLoop: false,
		onSliderLoad: function (currentIndex) {
			$('.evnet_slider li').eq(currentIndex).find('.event_info').css({ 'top': '0', 'opacity': '1' })
		},
		onSlideAfter: function ($slideElement, oldIndex, newIndex) {
			TweenLite.to($('.evnet_slider li').eq(newIndex).find('.event_info'), 0.5, { ease: Power3.easeOut, top: 0, opacity: 1 })
			$('.evnet_slider li').eq(newIndex).siblings('li').find('.event_info').attr('style', '')
		}
	});
}


function newStore_slider() {//신규매장안내 슬라이더
	$('.new_store_slider').bxSlider({
		infiniteLoop: false
	});
}


function pd_agress_scrollbar() {//문의 - 개인저보 동의 scrollbar
	$('.pd_agree_wrapper .pd_agree .scroll_wrapper').mCustomScrollbar();
}


function searchStore_scrollbar() {//매장찾기 검색결과 scrollbar
	$('.store_search_wrapper .store_search_layer .search_result_cont .store_list_scroll').mCustomScrollbar();
}


function formFile(obj) {// 첨부파일
	var value = obj.value
	$(obj).next('input').val(value)
}

function menuNavOver() {//메뉴소개 이전,다음이미지 hover,
	$('.menu_view_wrapper .hd .category button').on('click', function () {//메뉴소개 상단 카테고리 펼치기 - 20180208
		if ($(this).hasClass('open')) {
			$(this).removeClass('open')
			$('.menu_view_wrapper .hd .category a').css('display', 'none');
		} else {
			$(this).addClass('open')
			$('.menu_view_wrapper .hd .category a').css('display', 'inline-block');
		}
	})

	$('.menu_view_wrapper .menu_info .arr').on({
		'mouseover': function () {
			if ($(this).hasClass('prev')) {
				$('.menu_view_wrapper .menu_nav.prev').addClass('hover')
			} else {
				$('.menu_view_wrapper .menu_nav.next').addClass('hover')
			}
		},
		'mouseout': function () {
			$('.menu_view_wrapper .menu_nav').removeClass('hover');
		},
	})
}

function franchiseOver() {// 써브웨이 프랜차이즈
	$('.store_wrapper >div').on('mouseover', function () {
		$(this).addClass('hover').siblings('div').removeClass('hover')
	})
}


function pdTab_Sort() {//메뉴소개 : 메뉴 정렬
	var $hash = window.location.hash
	var eft = Power4.easeInOut;
	var spd = 0.5;
	var tg;

	$('.pd_tab li a').on('click', function () {
		if ($(this).parent().hasClass('active')) {
			return false;
		} else {
			tg = $(this).attr('href');
			$(this).parent().addClass('active').siblings('li').removeClass('active');
			TweenLite.to($('.pd_list_wrapper ul li'), spd, { ease: eft, opacity: 0, scale: 0.8 });
			setTimeout(function () {
				if (tg == 'all') {
					TweenLite.to($('.pd_list_wrapper ul li').show(), spd, { ease: eft, opacity: 1, scale: 1 })
				} else {
					pd_list_sort();
				}
			}, 400)
		};
		return false;
	})

	if ($hash == '#sandwich_list_bf') {//샌드위치 아침메뉴
		$('.pd_tab li').eq(6).addClass('active').siblings('li').removeClass('active');
		tg = 'bf';
		pd_list_sort();
	}

	function pd_list_sort() {
		$('.pd_list_wrapper ul li').each(function () {
			var $this = $(this);
			if ($this.hasClass(tg)) {
				$this.show();
				TweenLite.to($this, spd, { ease: eft, opacity: 1, scale: 1 })
			} else {
				$this.hide();
			}
		})
	}
};


function pdVisual_sandwich() {//메뉴소개 : 샌드위치 visual
	TweenLite.to($('.visual.sandwich h2'), 0.7, { ease: Power2.easeInOut, top: 0, opacity: 1 })
	TweenLite.to($('.visual.sandwich p'), 0.7, { ease: Power2.easeOut, top: 0, opacity: 1, delay: 0.3 })
	TweenLite.to($('.visual.sandwich .img01'), 1, { ease: Power4.easeOut, top: 0, opacity: 1, delay: 0.3 })
};

function pdVisual_wrap(){//메뉴소개 : 랩 visual
	TweenLite.to($('.visual.wrap h2'),0.7,{ease:Power2.easeInOut,top:0,opacity:1})
	TweenLite.to($('.visual.wrap p'),0.7,{ease:Power2.easeOut,top:0,opacity:1,delay:0.3})
	TweenLite.to($('.visual.wrap .img01'),0.7,{ease:Power3.easeOut,bottom:0,opacity:1,x:50,delay:0.5})
	TweenLite.to($('.visual.wrap .img02'),0.7,{ease:Power3.easeOut,top:0,opacity:1,delay:0.3})
};

function pdVisual_sidesDrink(){//메뉴소개 : 스마일 썹 visual
	TweenLite.to($('.visual.sides_drink h2'),0.7,{ease:Power2.easeInOut,top:0,opacity:1})
	TweenLite.to($('.visual.sides_drink p'),0.7,{ease:Power2.easeOut,top:0,opacity:1,delay:0.3})
	TweenLite.to($('.visual.sides_drink .img01'),1,{ease:Power4.easeOut,left:'-=100',opacity:1,delay:0.4})
	TweenLite.to($('.visual.sides_drink .img02'),1,{ease:Power3.easeOut,top:0,opacity:1,delay:0.3})
};

function pdVisual_morning(){//메뉴소개 : 아침메뉴 visual
	TweenLite.to($('.visual.morning h2'),0.7,{ease:Power2.easeInOut,top:0,opacity:1})
	TweenLite.to($('.visual.morning p'),0.7,{ease:Power2.easeOut,top:0,opacity:1,delay:0.3})
	TweenLite.to($('.visual.morning .img01'),1,{ ease: Power3.easeOut, top: 0, opacity: 1, delay: 0.5 })
	TweenLite.to($('.visual.morning .img02'),1,{ ease: Power3.easeOut, top: 0, opacity: 1, x: '-50', delay: 0.3 })
}

function pdVisual_fresh() {//메뉴소개 : 신선한재료소개 visual
	TweenLite.to($('.visual.fresh h2'), 0.7, { ease: Power2.easeInOut, top: 0, opacity: 1 })
	TweenLite.to($('.visual.fresh p'), 0.7, { ease: Power2.easeOut, top: 0, opacity: 1, delay: 0.3 })
	TweenLite.to($('.visual.fresh .img01'), 0.5, { ease: Power3.easeInOut, top: 0, opacity: 1, delay: 0.3 })
	TweenLite.to($('.visual.fresh .img02'), 0.6, { ease: Power3.easeOut, top: 74, opacity: 1, delay: 0.5 })
	TweenLite.to($('.visual.fresh .img03'), 0.6, { ease: Power3.easeOut, top: 168, opacity: 1, delay: 0.6 })
}


function pdVisual_salad() {//메뉴소개 : 찹샐러드 visual
	TweenLite.to($('.visual.salad h2'), 0.7, { ease: Power2.easeInOut, top: 0, opacity: 1 })
	TweenLite.to($('.visual.salad p'), 0.7, { ease: Power2.easeOut, top: 0, opacity: 1, delay: 0.3 })
	TweenLite.to($('.visual.salad .img01'), 0.7, { ease: Power3.easeOut, top: 0, opacity: 1, x: 50, delay: 0.5 })
	TweenLite.to($('.visual.salad .img02'), 0.7, { ease: Power3.easeOut, top: 0, opacity: 1, x: '-50', delay: 0.3 })
}

function pdVisual_topping() {//메뉴소개 : 추가토핑 visual
	TweenLite.to($('.visual.topping h2'), 0.7, { ease: Power2.easeInOut, top: 0, opacity: 1 })
	TweenLite.to($('.visual.topping p'), 0.7, { ease: Power2.easeOut, top: 0, opacity: 1, delay: 0.3 })
	TweenLite.to($('.visual.topping .img01'), 1, { ease: Power4.easeOut, left: '-=100', opacity: 1, delay: 0.2 })
	TweenLite.to($('.visual.topping .img02'), 1, { ease: Power4.easeOut, bottom: 0, opacity: 1, delay: 0.3 })
}

function pdVisual_catering() {//메뉴소개 : 단체메뉴 visual
	TweenLite.to($('.visual.catering h2'), 0.7, { ease: Power2.easeInOut, top: 0, opacity: 1 })
	TweenLite.to($('.visual.catering p'), 0.7, { ease: Power2.easeOut, top: 0, opacity: 1, delay: 0.3 })
	TweenLite.to($('.visual.catering .img01'), 1, { ease: Power4.easeOut, left: '-=100', opacity: 1, delay: 0.4 })
	TweenLite.to($('.visual.catering .img02'), 1, { ease: Power4.easeOut, top: 0, opacity: 1, delay: 0.2 })
}


function branchGuide() {//가맹점 : 지사안내
	$('.branch_guide_wrapper .tab ul li a').on('click', function () {
		var tg = $(this).attr('href');
		$(this).parent('li').addClass('active').siblings('li').removeClass('active');

		$('.branch_guide_wrapper .branch_guide_map').removeClass('active')
		$(tg).addClass('active');
		return false;
	})
}

function information() {//가맹점 : 사업설명회
	$('.franchise_information .tab ul li a').on('click', function () {
		var tg = $(this).attr('href');
		$(this).parent('li').addClass('active').siblings('li').removeClass('active');

		$('.franchise_information .information').removeClass('active')
		$(tg).addClass('active');
		return false;
	})
}

function tvCommercial() {//새소식 : TV광고
	$('.tv_commercial_wrapper .tv_commercial_list li a').on('click', function () {
		var tg = $(this).attr('href');
		$('.tv_commercial_wrapper .tv_commercial_view iframe').attr('src', tg);
		$(this).parent('li').addClass('active').siblings('li').removeClass('active');
		return false;
	})
}


function subwayUtilization() {//써브웨이 이용방법
	var stepIndex = 0;
	var btnArr = $('.arr_controls .arr');
	var stepNum = $('.utilization_subway_wrapper .slider_wrapper .step_content ol li');
	var slider_img = $('.utilization_subway_wrapper .slider_wrapper .img_content ol li');
	var slider_info = $('.utilization_subway_wrapper .info_content ol li');
	var spd = 1;
	var eft = Power3.easeOut;
	var prevIndex;

	if ($('#store_order').length) store_order();//써브웨이 이용방법 : 매장에서 주문하기

	if ($('#fast_sub, #home_sub, #group').length) app_order();


	$('.utilization_subway_wrapper .tab ul li a').on('click', function () {//써브웨이 이용방법 : tab
		if ($(this).parent('li').hasClass('active')) {
			return false;
		} else {
			var tg = $(this).attr('href');
			$(this).parent('li').addClass('active').siblings('li').removeClass('active')
			$(tg).show().siblings('.utilization_subway_content').hide();

			if (tg == '#store_order') {
				stepIndex = 0;

				$('.utilization_subway_content .step_num').text('STEP ' + (stepIndex + 1));
				$(stepNum).removeClass('prev active');
				$(stepNum).eq(stepIndex).addClass('active');
				$(slider_info).removeClass('active').attr('style', '')
				$(slider_info).eq(stepIndex).addClass('active').css({ 'marginTop': '0', 'opacity': '1' });
				$(slider_img).attr('style', '').removeClass('active');
				$(slider_img).find('.img').attr('style', '');
				$(slider_img).eq(stepIndex).css({ 'left': '50%', marginLeft: '-585px' });
				TweenLite.to($(slider_img).eq(stepIndex).find('.img'), spd, { ease: eft, width: 700 });
				TweenLite.to($(slider_img).eq(stepIndex).next(), spd, { ease: eft, marginLeft: '-280' });
			} else {
				AOS.init({
					once: 'data-aos-once',
					duration: 600,
					easing: 'ease-out-ease',
					delay: 100,
				});
			}
			return false;
		}
	});

	function store_order() {//써브웨이 이용방법 : 매장에서 주문하기 2019-12-23 수정
		$(slider_img).eq(stepIndex).css({ 'left': '50%', marginLeft: '-585px' })
		TweenLite.to($(slider_img).eq(stepIndex).find('.img'), spd, { ease: eft, width: 700 });
		TweenLite.to($(slider_img).eq(stepIndex).next(), spd, { ease: eft, marginLeft: '-280' });

		$(btnArr).on('click', function () {
			if (TweenMax.isTweening(slider_img)) {
				return false;
			} else {
				prevIndex = stepIndex;
				if ($(this).hasClass('prev')) {
					if (stepIndex <= 0) {
						return false;
					} else {
						stepIndex--;
						$(stepNum).eq(stepIndex).removeClass('prev').addClass('active')
						$(stepNum).eq(prevIndex).removeClass('active')

						TweenLite.to($(slider_img).eq(stepIndex).prev(), spd, { ease: eft, left: '0', marginLeft: '-280' })
						TweenLite.to($(slider_img).eq(prevIndex), spd, { ease: eft, left: '100%', marginLeft: '-280' })
						TweenLite.to($(slider_img).eq(prevIndex).find('.img'), spd, { ease: eft, width: 560 })
						TweenLite.to($(slider_img).eq(stepIndex), spd, { ease: eft, left: '50%', marginLeft: '-585' })
						TweenLite.to($(slider_img).eq(stepIndex).find('.img'), spd, { ease: eft, width: 700 })
						TweenLite.to($(slider_img).eq(prevIndex).next(), spd, { ease: eft, marginLeft: '560' })
					}
				} else {
					if (stepIndex >= 4) {
						return false;
					} else {
						stepIndex++;
						$(stepNum).eq(stepIndex).addClass('active')
						$(stepNum).eq(prevIndex).removeClass('active').addClass('prev')

						TweenLite.to($(slider_img).eq(prevIndex).prev(), spd, { ease: eft, left: '-560', marginLeft: '-560' })
						TweenLite.to($(slider_img).eq(prevIndex), spd, { ease: eft, left: '0', marginLeft: '-280' })
						TweenLite.to($(slider_img).eq(prevIndex).find('.img'), spd, { ease: eft, width: 560 })
						TweenLite.to($(slider_img).eq(stepIndex), spd, { ease: eft, left: '50%', marginLeft: '-585' })
						TweenLite.to($(slider_img).eq(stepIndex).find('.img'), spd, { ease: eft, width: 700 })
						TweenLite.to($(slider_img).eq(stepIndex).next(), spd, { ease: eft, marginLeft: '-280' })
					}
				}

				// $(slider_info).eq(prevIndex).removeClass('active').css('opacity', '0')
				// TweenLite.to($(slider_info).eq(stepIndex).addClass('active'), 0.7, {
				// 	ease: Power4.easeOut, marginTop: 0, opacity: 1, onComplete: function () {
				// 		$(slider_info).eq(prevIndex).attr('style', '')
				// 	}
				// });
				// $('.utilization_subway_content .step_num').text('STEP ' + (stepIndex + 1))
				// return false; 2019-12-23 슬라이드별 컨텐츠 show-hide, 스텝 숫자 변경 공통 function으로 분리 (stepText();)
				stepText();
			}
		});
	}

	function stepText(){ //매장에서이용하기, APP 이용방법 슬라이드 컨텐츠 내용, 스텝별 숫자 변경
		$(slider_info).eq(prevIndex).removeClass('active').css('opacity', '0')
		TweenLite.to($(slider_info).eq(stepIndex).addClass('active'), 0.7, {
			ease: Power4.easeOut, marginTop: 0, opacity: 1, onComplete: function () {
				$(slider_info).eq(prevIndex).attr('style', '');
			}
		});
		$('.utilization_subway_content .step_num').text('STEP ' + (stepIndex + 1));
		return false;
	}

	function app_order(){// APP 사용방법 (FAST, HOME, 단체주문)
		TweenLite.to($(slider_img).eq(stepIndex), spd, { ease: eft, opacity: '1'});
		TweenLite.to($(slider_img).eq(stepIndex).find('.img'), spd, { ease: eft, left: '0', zIndex: '1' });

		$(btnArr).on('click', function (e) {
			e.preventDefault();
			if (TweenMax.isTweening(slider_img)) {
				return false;
			} else {
				prevIndex = stepIndex;
				var stepLength = $(stepNum).length;
				if ($(this).hasClass('prev')) {// 이전 버튼
					if (stepIndex <= 0) {
						return false;
					} else {
						stepIndex--;
						$(stepNum).eq(stepIndex).removeClass('prev').addClass('active');
						$(stepNum).eq(prevIndex).removeClass('active');

						TweenLite.to($(slider_img).eq(prevIndex), spd, { ease: eft, opacity: '0' });
						TweenLite.to($(slider_img).eq(prevIndex).find('.img'), spd, { ease: eft, left: '200', zIndex: '-1' });

						TweenLite.to($(slider_img).eq(stepIndex), spd, { ease: eft, opacity: '1' });
						TweenLite.to($(slider_img).eq(stepIndex).find('.img'), spd, { left: '0', zIndex: '1' });
					}
				} else {// 다음버튼
					if (stepIndex >= stepLength - 1) {
						return false;
					} else {
						stepIndex++;
						$(stepNum).eq(stepIndex).addClass('active');
						$(stepNum).eq(prevIndex).removeClass('active').addClass('prev');

						TweenLite.to($(slider_img).eq(prevIndex), spd, { ease: eft, opacity: '0'});
						TweenLite.to($(slider_img).eq(prevIndex).find('.img'), spd, { ease: eft, zIndex: '-1'});

						TweenLite.to($(slider_img).eq(stepIndex), spd, { ease: eft, opacity: '1' });
						TweenLite.to($(slider_img).eq(stepIndex).find('.img'), spd, { left: '0', zIndex: '1'});
					}
				}
				stepText();
			}

			//스텝2 메뉴 선택 설명 영역 노출 (fast, home 공통)
			if($('#fast_sub, #home_sub').find(stepNum).eq(1).hasClass('active')){
				$('#fast_sub, #home_sub').addClass('active');
			}else{
				$('#fast_sub, #home_sub').removeClass('active');
			}
		});
	}
}

function mainScript() {
	$('.section02 .banner_sponsor .bxslider').bxSlider();
	$('.main_tap_event_wrapper ul').bxSlider({
		auto: true,
		autoStart: true,
		stopAutoOnClick: true,
		pause: 3000,
		touchEnabled: false
	});


	$('.subway_menu_slider >div').bxSlider({
		slideWidth: 1200,
		infiniteLoop: false,
		pager: false,
		touchEnabled: false
	});


	$('.section_subway_menu .hd .tab ul li a').on('click', function () {
		var tg = $(this).attr('href');
		var prev = $('.subway_menu_slider.active')
		$(this).parent('li').addClass('active').siblings('li').removeClass('active');

		TweenLite.to($(prev).removeClass('active'), 0.7, { ease: Power3.easeOut, opacity: 0, })
		TweenLite.to($(tg), 0.7, {
			ease: Power3.easeOut, left: 0, onComplete: function () {
				$(tg).addClass('active')
				$(prev).attr('style', '')
			}
		})

		return false;
	})

	$('.subway_menu_slider ul li').on('mouseenter', function () {
		TweenLite.to($(this).siblings('li'), 0, { ease: Power3.easeOut, margin: '0' })
		TweenLite.to($(this), 0, { ease: Power3.easeOut, width: 350, margin: '0' })
	})

	$('.subway_menu_slider ul li').on('mouseleave', function () {
		TweenLite.to($(this).siblings('li'), 0, { ease: Power3.easeOut, marginLeft: 30 })
		TweenLite.to($(this), 0, { ease: Power3.easeOut, width: 260, marginLeft: 30 })
	})

	/* 2018.01.30 메인 띠배너 스크립트 추가 */
	$(".line_banner_close_btn").click(function () {
		$('#main_line_banner').addClass('display_off')
	})
}


function faq() {//faq
	$('.faq_wrapper .fre').on('click', function () {
		var spd = 0.5,
			eft = Power3.easeOut
		if ($(this).parent('li').hasClass('open')) {
			$(this).parent('li').removeClass('open');
			TweenLite.to($(this).next('.ask'), spd, { ease: eft, height: 0 })
		} else {
			$(this).parent('li').addClass('open');
			var h = $(this).next('.ask').find('.ask_text').innerHeight();
			TweenLite.to($(this).next('.ask'), spd, { ease: eft, height: h })
		}
	})
}


function groupMenu() {//써브웨이 이용방법 : 단체메뉴 주문하기 slider
	$('.group_menu_wrapper .visual_slider_content').bxSlider({
		mode: 'fade',
		speed: 100,
		auto: true,
		autoStart: true,
		stopAutoOnClick: true,
		pause: 3000,
		onSliderLoad: function () {
			$('.group_menu_wrapper .visual_slider_wrapper .slider').css('opacity', '1')
		},
		pagerCustom: '.bx-pager'
	});
}


function sandwich_artist() {//샌드위치 아티스트 지원
	$('.career_path ol li .view p').on('mouseenter', function () {
		$(this).parent().next('.layer_view').css('display', 'table').stop(true, false).animate({
			'top': '36px'
		}, 500, 'easeOutBack')
	})

	$('.career_path ol li .layer_view').on('mouseleave', function () {
		$(this).stop(true, false).attr('style', '')
	})

	$('.slider_content .bxslider').bxSlider({
		slideWidth: 770,
		maxSlides: 3,
		moveSlides: 1,
		slideMargin: 130,
		touchEnabled: false,
		onSliderLoad: function (currentIndex) {
			$('.slider_content ul li').eq(currentIndex + 3).find('.img').css('opacity', '1')
			$('.slider_content ul li').eq(currentIndex + 3).find('.info').css({ 'opacity': '1', 'top': '0' })
		},
		onSlideBefore: function ($slideElement, oldIndex, newIndex) {
			$('.slider_content ul li div').attr('style', '')
			$('.slider_content ul li').eq(oldIndex + 3).removeClass('view')
			$('.slider_content ul li').eq(newIndex + 3).addClass('view')
		}
	});
}


function storedetail_slider() {//store detail slider
	$('.store_slider .bxslider').bxSlider({
		infiniteLoop: false,
		touchEnabled: true,
		pager: true
	});
}



function storeview_layer_open() {//매장찾기 레이어 open
	TweenLite.to($('.store_search_wrapper .store_map .store_map_layer').show(), 0.5, { ease: Back.easeOut, marginTop: '-125px' })
}

function storeview_layer_close() {//매장찾기 레이어 close
	$('.store_search_wrapper .store_map .store_map_layer').attr('style', '')
}

/************************************************************************************************************************

 2019 써브웨이 프리오더앱

 *************************************************************************************************************************/
var iH = $(window).innerHeight(); //브라우저 내부 높이

function writeOn() {//input focus
	var $input = $('.write_info_wrap input[type="text"], .write_info_wrap input[type="password"], .write_info_wrap input[type="tel"]');
	$input.on({
		focusin: function () {
			//console.log('e');
			var $this = $(this);
			$this.closest('dl').css({
				'border-color': '#009223'
			});
			// if ($this.attr('readonly')) {
			// 	$this.closest('dl').css({
			// 		'border-color': '#f8f8f8'
			// 	});
			// } // 2020-01-21 input readonly focus border-color 주석 처리
		},
		focusout: function () {
			var $this = $(this);
			$this.closest('dl').css({
				'border-color': '#e5e5e5'
			});
			// if ($this.attr('readonly')) {
			// 	$this.closest('dl').css({
			// 		'border-color': '#f8f8f8'
			// 	});
			// } // 2020-01-21 input readonly focus border-color 주석 처리
		}
	});
}

function agress_scrollbar() {//개인정보 동의 scrollbar
	$('.agree_wrapper .agree .scroll_wrapper').mCustomScrollbar();
}

// 작은 화면 대응: 기존 scroll 리셋, 컨텐츠 영역에 스크롤 추가
function iframeScrollReset() {
	$(".popup_content").mCustomScrollbar()
	$(".scroll_wrap").mCustomScrollbar("destroy");
}

function iframeAutoResize(ele, h) { // 레이어팝업 iframe 높이 자동조절
	if (ele == null) {
		return false;
	}
//	(h).height = "0px";
	var iframeHeight = (ele).contentWindow.document.body.scrollHeight, //iframe body 내부 높이
		iframeContent = $('iframe').contents();
	(ele).height = iframeHeight; //iframe height="" 속성 값

//	if (iH <= iframeHeight) { //iframe 높이가 iH 보다 클 때
//		(h).height = iH - 40 //iframe height="" 지정
//	}
	var obj = document.getElementById('ifrm');
//	if(iH <= 760){ //작은 화면에서 브라우저 높이 대응
//		if (iH <= iframeHeight){
//			var iframeDoc = obj.contentWindow || obj.contentDocument;
//
//			console.log(iframeDoc);
//
//			(h).height = iH - 100 //iframe height="" 지정
//			iframeContent.find('#popup_wrap .popup_content').addClass('content_scroll').css({
//				'min-height': '527px',
//				'max-height': '546px'
//			});
//			//iframeDoc.iframeScrollReset();
//		}
//	}

	if (iframeContent.find('#popup_wrap_wh').length){ //레이어팝업 테두리 없는 레이아웃일 경우
		$(top.document).find(".popup_iframe_wrapper").addClass('no_wrapper'); //테두리 없앨 클래스 추가
	}
	//console.log($('iframe').contents().find('#popup_wrap_wh').length); 부모페이지에서 레이어팝업 아이프레임 요소 찾는 콘솔

	TweenLite.to($('.popup_dim'), 0.2, {
		ease: Power4.easeOut
		, opacity: 0.6
		, onComplete : function  () {
			$.hideMask();
		}
	});
	TweenLite.fromTo($('.popup_iframe_wrapper'), .8, {delay: 0.3, y: 100}, {ease: Power4.easeInOut, opacity: 1, y: 0, onComplete: function  () {
		}});
//
//	$('body >.popup_dim').on('scroll mousewheel', function (event) {
//		event.preventDefault();
//		event.stopPropagation();
//		return false;
//	});
}


function popup_open(obj, w, h) {//팝업 열기 iframe
//	try {
//		$.showMask("");
//	}
//	catch (e) {}
//	var p_target = $(obj).attr('href') ? $(obj).attr('href') : $(obj).attr('data-url');
//
//	$('body').prepend('<div class="popup_dim"></div><div class="popup_iframe_wrapper" style="width:' + w + 'px; height:' + h + 'px; margin-left:-' + w / 2 + 'px"><iframe src="' + p_target + '" scrolling="no" style="height: 100%"></iframe><button class="btn_close"></button></div>');
//	TweenLite.to($('.popup_iframe_wrapper').show(), 0.5, { ease: Power4.easeOut, marginTop: $(window).scrollTop()+20})
//	TweenLite.to($('.popup_dim'), 0.5, { ease: Power4.easeOut, opacity: 0.6 })
//	$('body >.popup_dim').on('scroll mousewheel', function (event) {
//		event.preventDefault();
//		event.stopPropagation();
//		return false;
//	})
//
//
//
//	$('.popup_iframe_wrapper .btn_close,.popup_dim').on('click', function () {//20180131
//		$('body .popup_iframe_wrapper').remove();
//		TweenLite.to($('body >.popup_dim'), 0.5, {
//			ease: Power4.easeOut, opacity: 0, onComplete: function () {
//				$('body >.popup_dim').remove();
//			}
//		})
//	})

	popup_open_wh(obj, w, h);
}

function popup_open_wh(obj, w, h) {// 팝업 열기 iframe
	//	var p_target = $(obj).attr('href'); 기존에 a 태그에서만 띄울수 있던 소스를 아래와 같이 삼항식으로 수정, a 태그가 아닌 곳에서 레이어 팝업 띄울시 data-url 속성에 파일 경로를 넣어주세요.
	try {
		$.showMask("");
	}
	catch (e) {}
	var p_target = $(obj).attr('href') ? $(obj).attr('href') : $(obj).attr('data-url');
	var style = "opacity: 0; width: " + w + "px; margin-left:-" + (w / 2) + "px; top: " + ($(window).scrollTop()+20) + "px;";
	if(h) style += "height: " + (h + 20) + "px;";
	$('body').prepend('<div class="popup_dim"></div><div class="popup_iframe_wrapper" style="' + style + '"><iframe name="ifrm" id="ifrm" src="' + p_target + '" scrolling="no" style="height: 100%;display: none;"></iframe><button class="btn_close"></button></div>');


	TweenLite.to($('.popup_dim'), 0.8, {
		ease: Power4.easeOut
		, opacity: 0.6
		, onComplete : function  () {
			$.hideMask();
		}
	});
	TweenLite.fromTo($('.popup_iframe_wrapper'), 0.8, {delay: 0.3, y: 100, opacity:0}, {ease: Power4.easeInOut, opacity: 1, y: 0, onComplete: function  () {
		}});

	$("#ifrm").fadeIn(800);

	//$(".popup_iframe_wrapper").css({"top" : $(window).scrollTop()+20});

//	$("iframe#ifrm").on('load', function  () {
//		$(".popup_iframe_wrapper").show();
//		try {
//					iframeAutoResize(this);
//		}
//		catch (e) {};
//	});

	$('.popup_iframe_wrapper .btn_close').on('click', function (e) {
		e.preventDefault();
		$('body .popup_iframe_wrapper').remove();
		TweenLite.to($('body >.popup_dim'), 0.5, {
			ease: Power4.easeOut, opacity: 0, onComplete: function () {
				$('body >.popup_dim').remove();
			}
		});
	});
}

// My-sub 인덱스 이벤트 슬라이더
function myIndexEvent() {
	$(".evt_slider").bxSlider({
		infiniteLoop: true,
		auto: true,
		controls: false,
		slideWidth: 565,
		touchEnabled : (navigator.maxTouchPoints > 0)
	});
}
function dateReserve() {// e-gift카드 예약 전송 날짜 선택
	$.datepicker.setDefaults({//date picker setting
		closeText: "닫기",
		prevText: "이전달",
		nextText: "다음달",
		buttonImageOnly: true,
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true,
		showOn: "both",
		buttonImage: "../../images/common/icon_select_arr.png",
		yearSuffix: ".",
		currentText: "오늘",
		monthNames: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
		monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
		dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
		dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		weekHeader: "주",
		dateFormat: "yy. m. d",
	});

	$("#reserve_date").datepicker({minDate: 0});
}


$(document).ready(function () {
	$('.history_table .sum a').on('click', function (e) {
		e.preventDefault();

		var $this = $(this),
			orderBill = $this.closest('.history_table');

		if ($(orderBill).hasClass('on')) {
			orderBill.removeClass('on');
		} else {
			orderBill.addClass('on');
		}

		// if($(this).hasClass('on')){
		// 	$(this).removeClass('on').closest('table').removeClass('on');
		// 	$(this).closest('tr').siblings('tr').hide();
		// } else {
		// 	$(this).addClass('on').closest('table').addClass('on');
		// 	$(this).closest('tr').siblings('tr').show();
		// };
	});

	$(window).on("resize", function  () {

	});
});


//$(document).ready(function(){
//	$('.tab ul li a').on('click', function(){//써브웨이 이용방법 : tab
//		if($(this).parent('li').hasClass('active')){
//			return false;
//		}else{
//			var tg = $(this).attr('href');
//			$(this).parent('li').addClass('active').siblings('li').removeClass('active')
//			$(tg).show().siblings(tg).hide();
//		}
//	});
//});
