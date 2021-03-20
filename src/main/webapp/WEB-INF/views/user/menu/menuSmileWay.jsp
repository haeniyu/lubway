<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY - 샌드위치</title>
		<link rel="stylesheet" href="resources/css/step01.css">
		<link rel="stylesheet" href="resources/css/menu.css?v=2">
        <script type="text/javascript" src="resources/js/jquery/jquery-1.12.4.min.js?v=2021031101"></script>
        <script type="text/javascript" src="resources/js/jquery/jquery-ui-1.12.0.min.js?v=2021031101"></script>
        <script type="text/javascript" src="resources/js/jquery/jquery.easing.1.3.min.js?v=2021031101"></script>
        <script type="text/javascript" src="resources/js/jquery/jquery.bxslider.min.js?v=2021031101"></script>
        <script type="text/javascript" src="resources/js/jquery/jquery.mCustomScrollbar.concat.min.js?v=2021031101"></script>
        <!-- block ui -->
        <script type="text/javascript" src="resources/js/jquery/jquery.blockUI.min.js?v=2021031101"></script>
        <script type="text/javascript" src="resources/js/jquery/TweenMax.min.js?v=2021031101"></script>
        <script type="text/javascript" src="resources/js/jquery/jquery.cookie.js?v=2021031101"></script>
        <!--<script type="text/javascript" th:src="'/js/lottie.js?v=' + ${cacheParam}"></script>-->
        <script type="text/javascript" src="resources/js/ui.common.js?v=2021031101"></script>
        <script type="text/javascript" src="resources/js/subway.common.js?v=2021031101"></script>
        <script type="text/javascript" src="resources/js/util/jsrender.js?v=2021031101"></script>
        <script type="text/javascript" src="resources/js/jquery/jquery.tmpl.min.js?v=2021031101"></script>
        <script type="text/javascript" src="resources/js/waffle/waffle.utils.js?v=2021031101"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<div id="wrap">
		<!-- inc header s -->
				<!--// gnb -->
				<!-- util menu -->
				<!--// util menu -->
		<!--// inc header e -->
		<!-- container s -->
		<div id="container">
			<div class="sub_header type01">
				<!-- 메뉴소개일경우 type01클래스 추가 -->
				<div class="content">
					<a class="logo" href="/">HOME</a>
					<!-- sub location -->
					<div class="sub_loc">
						<!-- 메뉴소개 -->
						<ul>
							<li><a href="/lubway/menu.do">샌드위치</a></li>
							<li><a href="/lubway/menuWrap.do">랩ㆍ기타</a></li>
							<li><a href="/lubway/menuSalad.do">찹샐러드</a></li>
							<li><a href="/lubway/menuMorning.do">아침메뉴</a></li>
							<li class="active"><a href="/lubway/menuSmileWay.do">스마일 웨이</a></li>
						</ul>
						<!-- 이용방법 -->
					</div>
					<!--// sub location -->
					<a class="top" href="#none">TOP</a>
				</div>
			</div>
			<!-- sub content s -->
			<div id="content">
				<!-- 메뉴소개 s -->
				<div class="menu_list_wrapper">
					<!-- 상품 visual -->
					<div class="visual sides_drink">
						<h2>Smile Way</h2>
						<p>
							웃음이 번지는 착한 가격, 착한 맛!<br />
							스마일 썹과 함께 하루 종일 스마일 하세요~
						</p>
						<div class="img01"></div>
						<div class="img02"></div>
					</div>
					<!--// 상품 visual -->
					<!-- 상품별 정렬 tab -->
					<div class="pd_tab">
						<!-- 샌드위치 -->
						<!-- 랩 -->
						<!-- 찹샐러드 -->

						<!-- 샌드위치 -->


						<!-- 2020.12.28 아침메뉴 추가 -->

					</div>
					<!--// 상품별 정렬 tab -->

					<!-- 상품목록 -->
					<div class="pd_list_wrapper">
					<ul>
						<li class="sides">
								<!-- label -->
								<div class="label">
									<span class="season">SEASON</span>
								</div>
								<!--// label -->
								<div class="img"><img alt="민트 초코" src="../images/menu/img_sides_14.jpg" /></div>
								<strong class="tit">민트 초코</strong>
								<span class="eng">Mint Choco</span>
								<span class="cal">215 kcal</span>
								<div class="summary">
									<p>
										민초 시즌이 돌아왔다!<br />
										진한 초콜릿에 상쾌한 민트가 퐁당!<br />
										특별한 달콤함에 푹 빠져보세요.
									</p>
								</div>
								<a class="btn_view" data-id="sd14" href="/lubway/menuDetail.do"><!-- 상세이동버튼 -->
							</a></li>
							<li class="sides">
								<!-- label -->
								<div class="label">
									<span class="new">NEW</span>
								</div>
								<!--// label -->
								<div class="img"><img alt="머쉬룸 수프" src="../images/menu/img_sides_22.png" /></div>
								<strong class="tit">머쉬룸 수프</strong>
								<span class="eng">Mushroom Soup</span>
								<span class="cal">150 kcal</span>
								<div class="summary">
									<p>
										2020년 겨울, 새롭게 선보이는<br />
										부드러운 머쉬룸 수프
									</p>
								</div>
								<a class="btn_view" data-id="sd22" href="/lubway/menuDetail.do"><!-- 상세이동버튼 -->
							</a></li>
							<li class="sides">
								<!-- label -->
								<div class="label">
									<span class="new">NEW</span>
								</div>
								<!--// label -->
								<div class="img"><img alt="이탈리안 미니 랩" src="../images/menu/wrap_mw03.jpg" /></div>
								<strong class="tit">이탈리안 미니 랩</strong>
								<span class="eng">Italian Mini Wrap</span>
								<span class="cal">405 kcal</span>
								<div class="summary">
									<p>
										작지만 화끈하다!<br />
										입안 가득 즐기는 이탈리아의 풍미.<br />
										이탈리안 미니 랩!
									</p>
								</div>
								<a class="btn_view_sub" href="/wrapView?param=mw03&smenu=sideDrink"></a> <!-- 상세이동버튼 -->
							</li>
							<li class="sides">
								<!-- label -->
								<div class="label">
									<span class="new">NEW</span>
								</div>
								<!--// label -->
								<div class="img"><img alt="우유" src="../images/menu/img_sides_18.jpg" /></div>
								<strong class="tit">우유</strong>
								<span class="eng">Milk</span>
								<span class="cal">125 kcal / 320 kcal</span>
								<div class="summary">
									<p>
										* 매장 별 판매 여부는 상이할 수 있습니다.
									</p>
								</div>
								<a class="btn_view" data-id="sd18" href="/lubway/menuDetail.do"><!-- 상세이동버튼 -->
							</a></li>
							<li class="sides">
								<div class="img"><img alt="치킨 베이컨 미니 랩" src="../images/menu/wrap_mw01.jpg" /></div>
								<strong class="tit">치킨 베이컨 미니 랩</strong>
								<span class="eng">Chicken Bacon Mini Wrap</span>
								<span class="cal">376 kcal</span>
								<div class="summary">
									<p>
										담백한 치킨, 바삭한 베이컨 비츠가<br />
										쫀득한 통밀 랩에 쏘옥!<br />
										치킨 베이컨 미니 랩 
									</p>
								</div>
								<a class="btn_view_sub" href="/wrapView?param=mw01&smenu=sideDrink"></a> <!-- 상세이동버튼 -->
							</li>
							<li class="sides">
								<div class="img"><img alt="웨지 포테이토" src="../images/menu/img_sides_09.jpg" /></div>
								<strong class="tit">웨지 포테이토</strong>
								<span class="eng">Ovenbaked Wedge Potatoes</span>
								<span class="cal">143 kcal</span>
								<div class="summary">
									<p>
										오븐에 구워 더 담백,<br />겉은 바삭 속은 촉촉한 건강한 사이드<br />
										※제공시간 : 오전 11시 ~
									</p>
								</div>
								<a class="btn_view" data-id="sd09" href="/lubway/menuDetail.do"><!-- 상세이동버튼 -->
							</a></li>
					</ul>
				</div>
				<!--// 상품목록 -->
				</div>
				<!--// 메뉴소개 e -->
			</div>
			<!--// sub content e -->
		</div>
	</div>

	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>
