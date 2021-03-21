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
							<li><a href="/lubway/menuSandwich.do">샌드위치</a></li>
							<li class="active"><a href="/lubway/menuWrap.do">랩ㆍ기타</a></li>
							<li><a href="/lubway/menuSalad.do">찹샐러드</a></li>
							<li><a href="/lubway/menuMorning.do">아침메뉴</a></li>
							<li><a href="/lubway/menuSmileWay.do">스마일 웨이</a></li>
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
					<div class="visual wrap">
						<h2>Wrap</h2>
						<p>
						Subway를 더 맛있고 간편하게 즐기는 방법<br />
						최상의 레시피로 만들어진 써브웨이 랩 시리즈, 이젠 고민하지 마세요!<br />
						* 그릴드 랩과 파니니는 일부 매장에서만 제공 가능합니다. 매장 리스트는 공지사항을 확인해주세요.
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
						<li class="gw">
							<div class="img"><img alt="쉬림프 에그 그릴드 랩" src="../images/menu/wrap_gw01.png" /></div>
							<strong class="tit">쉬림프 에그 그릴드 랩</strong>
							<span class="eng">Shrimp Egg Grilled Wrap</span>
							<span class="cal">427 kcal</span>
							<div class="summary">
								<p>
									더 뜨겁게, 더 맛있게 즐기자!<br />
									탱글한 새우와 부드러운 오믈렛의 만남
								</p>
							</div>
							<a class="btn_view" data-id="gw01" href="/lubway/menuDetail.do"></a>
						</li>
						<li class="gw">
							<div class="img"><img alt="스테이크 & 치즈 아보카도 그릴드 랩" src="../images/menu/wrap_gw02.png" /></div>
							<strong class="tit">스테이크 & 치즈 아보카도 그릴드 랩</strong>
							<span class="eng">Steak & Cheese Avocado Grilled Wrap</span>
							<span class="cal">451 kcal</span>
							<div class="summary">
								<p>
									더 뜨겁게, 더 맛있게 즐기자!<br />
									육즙이 쫙~ 비프 스테이크와<br />
									아보카도가 만나다!
								</p>
							</div>
							<a class="btn_view" data-id="gw02" href="/lubway/menuDetail.do"></a>
						</li>
						<li class="gw">
							<div class="img"><img alt="치킨 베이컨 미니 그릴드 랩" src="../images/menu/wrap_gw03.png" /></div>
							<strong class="tit">치킨 베이컨 미니 그릴드 랩</strong>
							<span class="eng">Chicken Bacon Mini Grilled Wrap</span>
							<span class="cal">376 kcal</span>
							<div class="summary">
								<p>
									더 뜨겁게 더 맛있게 즐기자!<br />
									담백한 치킨, 바삭한 베이컨 비츠가 쏙
								</p>
							</div>
							<a class="btn_view" data-id="gw03" href="/lubway/menuDetail.do"></a>
						</li>
						<li class="gw">
							<div class="img"><img alt="이탈리안 미니 그릴드 랩" src="../images/menu/wrap_gw04.png" /></div>
							<strong class="tit">이탈리안 미니 그릴드 랩</strong>
							<span class="eng">Italian Mini Grilled Wrap</span>
							<span class="cal">405 kcal</span>
							<div class="summary">
								<p>
									더 뜨겁게 더 맛있게 즐기자!<br />
									페퍼로니, 살라미 풍미 넘치는 한입<br />
									매콤한 핫칠리로 놓칠 수 없는 맛
								</p>
							</div>
							<a class="btn_view" data-id="gw04" href="/lubway/menuDetail.do"></a>
						</li>
                        <li class="pn">
							<div class="img"><img alt="스테이크 & 치즈 파니니" src="../images/menu/panini_01.png" /></div>
							<strong class="tit">스테이크 & 치즈 파니니</strong>
							<span class="eng">Steak & Cheese Panini</span>
							<span class="cal">453 kcal</span>
							<div class="summary">
								<p>
									바삭한 식감에 치즈는 두배로<br />
									써브웨이 베스트 메뉴 스테이크 & 치즈를<br />
									파니니로 즐겨보세요!<br />
								</p>
							</div>
							<a class="btn_view" data-id="pn01" href="/lubway/menuDetail.do"></a>
						</li>
                        <li class="pn">
							<div class="img"><img alt="로티세리 바비큐 치킨 파니니" src="../images/menu/panini_02.png" /></div>
							<strong class="tit">로티세리 바비큐 치킨 파니니</strong>
							<span class="eng">Rotisserie Barbecue Chicken Panini</span>
							<span class="cal">450 kcal</span>
							<div class="summary">
								<p>
									바삭한 식감에 치즈는 두배로<br />
									풍미 가득한 로티세리 바비큐 치킨을<br />
									파니니로 즐겨보세요!
								</p>
							</div>
							<a class="btn_view" data-id="pn02" href="/lubway/menuDetail.do"></a>
						</li>
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
