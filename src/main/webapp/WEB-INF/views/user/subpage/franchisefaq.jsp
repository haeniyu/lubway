<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Franchise FAQ</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/franchise.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function() {
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
});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<div id="content">
		<h2 class="subTitle">가맹관련 FAQ</h2>

		<div class="content">
			<!-- faq -->
			<div class="faq_wrapper">
				<ul class="faq_contet" id="ui_faq_items">
					<li>
						<div class="fre">
							<div class="q">Q</div>
							<strong>러브웨이 가맹점 오픈에 필요한 투자 금액은 어느 정도 인가요?</strong>
						</div>
						<div class="ask">
							<div class="a">A</div>
							<div class="ask_text">최소 전용 면적 25평 기준, 약 2억원 ~ 2억 1천만원이
								예상됩니다. (추가공사, 별도비용, 임대료, 부가세 제외) 자세한 예상비용은 홈페이지 "가맹점 → 러브웨이
								프랜차이즈"에서 확인하실 수 있습니다. http://www.subway.co.kr/franchise</div>
						</div>
					</li>
					<li>
						<div class="fre">
							<div class="q">Q</div>
							<strong>러브웨이 가맹점주가 되기 위한 조건이 있나요?</strong>
						</div>
						<div class="ask">
							<div class="a">A</div>
							<div class="ask_text">러브웨이는 50년이 넘는 역사를 지닌 프랜차이즈이며, 전 세계 가장 많은 매장을 운영하는 글로벌 QSR 브랜드 입니다.
따라서 제품의 퀄리티, 매장 운영, 고객 서비스에 있어 브랜드의 가치를 실현하기 위해 운영 매누얼 및 본사의 규정과 지침을 이행하고 준수 할 수 있는 분, 고객 서비스 마인드를 갖춘 분과 가맹계약을 체결합니다.
각 지사의 가맹 개발자는 계약 체결 전, 심도 깊은 상담, 성향 테스트를 통해 이부분은 검증합니다.</div>
						</div>
					</li>
					<li>
						<div class="fre">
							<div class="q">Q</div>
							<strong>가맹이 불가능한 지역은 언제쯤 상담 및 가맹점 오픈이 가능한가요?</strong>
						</div>
						<div class="ask">
							<div class="a">A</div>
							<div class="ask_text">지사 설립 후 가맹이 가능한 지역이 되기까지 최소 1년 이상 소요될 것으로 예산되나, 준비 상황에 따라 가맹시점이 달라질 수 있습니다.</div>
						</div>
					</li>
					<li>
						<div class="fre">
							<div class="q">Q</div>
							<strong>현재 가맹이 불가능한 지역은 어디인가요?</strong>
						</div>
						<div class="ask">
							<div class="a">A</div>
							<div class="ask_text">러브웨이는 각 지역권에 대해 미국 본사로 부터 승인을 받은 지사가 직접 가맹사업을 진행하고 있습니다.
지사가 아직 설립되지 않은 지역은 경기일부지역, 강원도, 충청북도, 제주도입니다.</div>
						</div>
					</li>
				</ul>
			</div>
			<!--// faq -->
		</div>
	</div>
	<!--// sub content e -->
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>