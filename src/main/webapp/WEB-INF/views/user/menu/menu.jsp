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
							<li class="active"><a href="/lubway/menu.do">샌드위치</a></li>
							<li><a href="/lubway/menuWrap.do">랩ㆍ기타</a></li>
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
					<div class="visual sandwich">
						<h2>Sandwich</h2>
						<p>
							전세계 넘버원 브랜드 Subway!<br /> 50년 전통의 세계 최고의 샌드위치를 맛보세요!
						</p>
						<div class="img01"></div>
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
							<li class="pm">
								<div class="img">
									<img alt="풀드포크" src="resources/images/menu/sandwich_pm08.jpg" />
								</div> <strong class="tit">풀드포크</strong> <span class="eng">Pulled
									Pork</span> <span class="cal">420 kcal</span>
								<div class="summary">
									<p>
										7시간 저온 훈연한 미국 정통 스타일의<br /> 리얼 바비큐 풀드포크는 오직 써브웨이에서
									</p>
								</div> <a class="btn_view" data-id="pm08" href="/lubway/menuDetail.do"></a>
							</li>
							<li class="cl">
								<div class="img">
									<img alt="이탈리안 비엠티" src="resources/images/menu/sandwich_cl01.jpg" />
								</div> <strong class="tit">이탈리안 비엠티</strong> <span class="eng">Italian
									B.M.T. ™</span> <span class="cal">410 kcal</span>
								<div class="summary">
									<p>
										7시간 숙성된 페퍼로니,<br /> 살라미 그리고 햄이 만들어내는 최상의 조화!<br /> 전세계가 사랑하는
										No.1 베스트셀러!<br />Biggest Meatiest Tastiest, It's B.M.T.!
									</p>
								</div> <a class="btn_view" data-id="cl01" href="/lubway/menuDetail.do"></a>
							</li>
							<li class="cl">
								<div class="img">
									<img alt="비엘티" src="resources/images/menu/sandwich_cl02.jpg" />
								</div> <strong class="tit">비엘티</strong> <span class="eng">B.L.T.</span>
								<span class="cal">380 kcal</span>
								<div class="summary">
									<p>오리지널 아메리칸 베이컨의 풍미와 바삭함 그대로~</p>
								</div> <a class="btn_view" data-id="cl02" href="/lubway/menuDetail.do"></a>
							</li>
							<li class="cl">
								<div class="img">
									<img alt="미트볼" src="resources/images/menu/sandwich_cl03.jpg" />
								</div> <strong class="tit">미트볼</strong> <span class="eng">Meatball</span>
								<!-- 180130 수정 --> <span class="cal">480 kcal</span>
								<div class="summary">
									<p>
										이탈리안 스타일 비프 미트볼에<br /> 써브웨이만의 풍부한 토마토 향이 살아있는<br /> 마리나라소스를
										듬뿍
									</p>
								</div> <a class="btn_view" data-id="cl03" href="/lubway/menuDetail.do"></a>
							</li>
							<li class="cl">
								<div class="img">
									<img alt="햄" src="resources/images/menu/sandwich_cl04.jpg" />
								</div> <strong class="tit">햄</strong> <span class="eng">Ham</span> <!-- 180130 수정 -->
								<span class="cal">290 kcal</span>
								<div class="summary">
									<p>
										기본 중에 기본! 풍부한 햄이 만들어내는<br /> 입 안 가득 넘치는 맛의 향연
									</p>
								</div> <a class="btn_view" data-id="cl04" href="/lubway/menuDetail.do"></a>
							</li>
						</ul>
						<!-- 영양성분표 -->
						<div class="btns_list_wrapper" style="display: none;">
							<a class="btn_list_pop btn bgc_point i_arr"
								href="/toppingNutritionFacts" link-type="popup"
								onclick="popup_open(this,900,740); return false;"
								style="width: 180px;"> <span>영양 성분표 보기</span>
							</a>
						</div>
						<!--// 영양성분표 -->
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