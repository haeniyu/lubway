$(document).ready(function () {
	gnb();//gnb
	if ($('.sub_header').length > 0) {
		bodyScroll();//body scroll
	}

	

	if ($('div').hasClass('scroll_wrap')) {
		$('.scroll_wrap').mCustomScrollbar({
			scrollInertia: 800,
		});
	}

})

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