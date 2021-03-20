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
							<li class="active"><a href="/lubway/menuSalad.do">찹샐러드</a></li>
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
					<div class="visual salad">
						<h2>Chopped Salad</h2>
						<p>
							양은 더 많이! 칼로리는 더 적게! <br />
							신선한 야채와 다양한 소스로 가볍게 찹샐러드를 즐겨보세요!
						</p>
						<div class="img01"></div>
						<div class="img02"></div>
					</div>
					<!--// 상품 visual -->
					<div class="pd_tab">

					</div>
					<!-- 상품목록 -->
					<div class="pd_list_wrapper">
					<ul>
						<li class="pm">
								<!-- label -->
								<div class="label">
									<span class="new">NEW</span>
								</div>
								<!--// label -->
								<div class="img"><img alt="K-바비큐" src="../images/menu/salad_pm13.jpg" /></div>
								<strong class="tit">K-바비큐</strong>
								<span class="eng">K-BBQ</span>
								<span class="cal">153 kcal</span>
								<div class="summary">
									<p>
										써브웨이 최초의 코리안 스타일 찹 샐러드!<br />
										마늘, 간장 그리고 은은한 불맛까지!
									</p>
								</div>
								<a class="btn_view" href="/lubway/menuDetail.do"></a>
							</li>
							<li class="pm">
								<div class="img"><img alt="쉬림프" src="../images/menu/salad_pm10.jpg" /></div>
								<strong class="tit">쉬림프</strong>
								<span class="eng">Shrimp</span>
								<span class="cal">108 kcal</span>
								<div class="summary">
									<p>
										탱글한 식감이 그대로 살아있는<br />
										통새우가 5마리가<br />
										찹샐러드에 쏙 ! Fresh함이 그대로~
									</p>
								</div>
								<a class="btn_view" href="/saladView?param=pm10"></a>
							</li>
							<li class="fl">
								<div class="img"><img alt="로티세리 치킨" src="../images/menu/salad_fl01.jpg" /></div>
								<strong class="tit">로티세리 치킨</strong>
								<span class="eng">Rotisserie Chicken</span>
								<span class="cal">170 kcal</span>
								<div class="summary">
									<p>
										촉촉한 바비큐 치킨의 풍미가득.<br /> 손으로 찢어 더욱 부드러운 치킨이 찹 샐러드에 쏙
									</p>
								</div>
								<a class="btn_view" href="/saladView?param=fl01"></a>
							</li>
							<li class="pm">
								<div class="img"><img alt="풀드 포크 바비큐" src="../images/menu/salad_pm08.jpg" /></div>
								<strong class="tit">풀드 포크 바비큐</strong>
								<span class="eng">Pulled Pork Barbecue</span>
								<span class="cal">265 kcal</span>
								<div class="summary">
									<p>
										훈연한 미국 스타일의 풀드 포크 바비큐가 가득 올라간 풍미 가득한 찹 샐러드
									</p>
								</div>
								<a class="btn_view" href="/lubway/menuDetail.do"></a>
							</li>
  							<li class="cl">
								<div class="img"><img alt="이탈리안 비엠티" src="../images/menu/salad_cl01.jpg" /></div>
								<strong class="tit">이탈리안 비엠티</strong>
								<span class="eng">Italian B.M.T. ™</span>
								<span class="cal">230 kcal</span>
								<div class="summary">
									<p>
										페퍼로니, 살라미 그리고 햄이<br />만들어내는 최상의 조화!<br />전세계가 사랑하는 써브웨이의 베스트셀러!<br />Biggest Meatiest Tastiest, its’ B.M.T! 찹 샐러드
									</p>
								</div>
								<a class="btn_view" href="/saladView?param=cl01"></a>
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
