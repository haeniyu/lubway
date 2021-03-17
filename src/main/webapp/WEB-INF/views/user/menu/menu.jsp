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
							<li class="active"><a href="/sandwichList">샌드위치</a></li>
							<li><a href="/wrapList">랩ㆍ기타</a></li>
							<li><a href="/saladList">찹샐러드</a></li>
							<li><a href="/morningList">아침메뉴</a></li>
							<li><a href="/sideDrink">스마일 썹</a></li>
							<li><a href="/catering">단체메뉴</a></li>
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
							<li class="fl">
								<!-- label -->
								<div class="label">
									<span class="limited_g">SEASON</span>
								</div> <!--// label -->
								<div class="img">
									<img alt="로스트 치킨 베이컨" src="resources/images/menu/sandwich_fl10.png" />
								</div> <strong class="tit">로스트 치킨 베이컨</strong> <span class="eng">Roasted
									Chiken Bacon</span> <span class="cal">409 kcal</span>
								<div class="summary">
									<p>
										든든한 로스트치킨과<br /> 바삭한 베이컨의 풍미 넘치는 조합!
									</p>
								</div> <a class="btn_view" data-id="fl10" href="#"></a>
							</li>
							<li class="fl">
								<!-- label -->
								<div class="label">
									<span class="limited_g">SEASON</span>
								</div> <!--// label -->
								<div class="img">
									<img alt="로스트 치킨 아보카도" src="resources/images/menu/sandwich_fl09.png" />
								</div> <strong class="tit">로스트 치킨 아보카도</strong> <span class="eng">Roasted
									Chiken Avocado</span> <span class="cal">383 kcal</span>
								<div class="summary">
									<p>
										담백한 닭가슴살 위 아보카도 한스쿱!<br /> 입안 가득 부드러운 신선함!
									</p>
								</div> <a class="btn_view" data-id="fl09" href="#"></a>
							</li>
							<li class="fl">
								<div class="img">
									<img alt="로스트 치킨" src="resources/images/menu/sandwich_fl02.jpg" />
								</div> <strong class="tit">로스트 치킨</strong> <span class="eng">Roasted
									Chicken</span> <span class="cal">320 kcal</span>
								<div class="summary">
									<p>오븐에 구워 담백한 저칼로리 닭가슴살의 건강한 풍미</p>
								</div> <a class="btn_view" data-id="fl02" href="#"></a>
							</li>
							<li class="cl">
								<div class="img">
									<img alt="에그마요" src="resources/images/menu/sandwich_cl06.jpg" />
								</div> <strong class="tit">에그마요</strong> <span class="eng">Egg
									Mayo</span> <span class="cal">480 kcal</span>
								<div class="summary">
									<p>
										<!-- 180130 수정 -->
										친환경 인증 받은 농장에서 생산된 달걀과<br /> 고소한 마요네즈가 만나 더 부드러운 스테디셀러
									</p>
								</div> <a class="btn_view" data-id="cl06" href="#"></a>
							</li>
							<li class="pm">
								<div class="img">
									<img alt="K-바비큐" src="resources/images/menu/sandwich_pm13.jpg" />
								</div> <strong class="tit">K-바비큐</strong> <span class="eng">K-BBQ</span>
								<span class="cal">378 kcal</span>
								<div class="summary">
									<p>
										써브웨이 최초의 코리안 스타일 샌드위치!<br /> 한국식 마늘, 간장 그리고 은은한 불맛까지!
									</p>
								</div> <a class="btn_view" data-id="pm13" href="#"></a>
							</li>
							<li class="pm">
								<div class="img">
									<img alt="쉬림프" src="resources/images/menu/sandwich_pm10.jpg" />
								</div> <strong class="tit">쉬림프</strong> <span class="eng">Shrimp</span>
								<span class="cal">253 kcal</span>
								<div class="summary">
									<p>
										탱글한 식감이 그대로 살아있는 통새우가<br /> 5마리 들어가 한 입 베어 먹을 때 마다<br /> 진짜
										새우의 풍미가 가득
									</p>
								</div> <a class="btn_view" data-id="pm10" href="#"></a>
							</li>
							<li class="fl">
								<div class="img">
									<img alt="로티세리 바비큐 치킨" src="resources/images/menu/sandwich_fl01.jpg" />
								</div> <strong class="tit">로티세리 바비큐 치킨</strong> <span class="eng">Rotisserie
									Barbecue Chicken</span> <span class="cal">350 kcal</span>
								<div class="summary">
									<p>
										촉촉한 바비큐 치킨의 풍미가득.<br /> 손으로 찢어 더욱 부드러운 치킨의 혁명
									</p>
								</div> <a class="btn_view" data-id="fl01" href="#"></a>
							</li>
							<li class="pm">
								<div class="img">
									<img alt="풀드포크" src="resources/images/menu/sandwich_pm08.jpg" />
								</div> <strong class="tit">풀드포크</strong> <span class="eng">Pulled
									Pork</span> <span class="cal">420 kcal</span>
								<div class="summary">
									<p>
										7시간 저온 훈연한 미국 정통 스타일의<br /> 리얼 바비큐 풀드포크는 오직 써브웨이에서
									</p>
								</div> <a class="btn_view" data-id="pm08" href="#"></a>
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
								</div> <a class="btn_view" data-id="cl01" href="#"></a>
							</li>
							<li class="cl">
								<div class="img">
									<img alt="비엘티" src="resources/images/menu/sandwich_cl02.jpg" />
								</div> <strong class="tit">비엘티</strong> <span class="eng">B.L.T.</span>
								<span class="cal">380 kcal</span>
								<div class="summary">
									<p>오리지널 아메리칸 베이컨의 풍미와 바삭함 그대로~</p>
								</div> <a class="btn_view" data-id="cl02" href="#"></a>
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
								</div> <a class="btn_view" data-id="cl03" href="#"></a>
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
								</div> <a class="btn_view" data-id="cl04" href="#"></a>
							</li>
							<li class="cl">
								<div class="img">
									<img alt="참치" src="resources/images/menu/sandwich_cl05.jpg" />
								</div> <strong class="tit">참치</strong> <span class="eng">Tuna</span> <span
								class="cal">480 kcal</span>
								<div class="summary">
									<p>
										남녀노소 누구나 좋아하는 담백한 참치와<br /> 고소한 마요네즈의 완벽한 조화
									</p>
								</div> <a class="btn_view" data-id="cl05" href="#"></a>
							</li>
							<li class="fl">
								<div class="img">
									<img alt="써브웨이 클럽" src="resources/images/menu/sandwich_fl04.jpg" />
								</div> <strong class="tit">써브웨이 클럽</strong> <span class="eng">Subway
									Club™</span> <span class="cal">310 kcal</span>
								<div class="summary">
									<p>
										명실공히 시그니처 써브!<br /> 터키, 비프, 포크 햄의 완벽한 앙상블
									</p>
								</div> <a class="btn_view" data-id="fl04" href="#"></a>
							</li>
							<li class="fl">
								<div class="img">
									<img alt="터키" src="resources/images/menu/sandwich_fl05.jpg" />
								</div> <strong class="tit">터키</strong> <span class="eng">Turkey</span>
								<span class="cal">280 kcal</span>
								<div class="summary">
									<p>280kcal로 슬림하게 즐기는 오리지날 터키 샌드위치</p>
								</div> <a class="btn_view" data-id="fl05" href="#"></a>
							</li>
							<li class="fl">
								<div class="img">
									<img alt="베지" src="resources/images/menu/sandwich_fl06.jpg" />
								</div> <strong class="tit">베지</strong> <span class="eng">Veggie
									Delite</span> <span class="cal">230 kcal</span>
								<div class="summary">
									<p>갓 구운 빵과 신선한 7가지 야채로 즐기는 깔끔한 한끼</p>
								</div> <a class="btn_view" data-id="fl06" href="#"></a>
							</li>
							<li class="pm">
								<div class="img">
									<img alt="스테이크 &amp; 치즈" src="resources/images/menu/sandwich_pm01.jpg" />
								</div> <strong class="tit">스테이크 &amp; 치즈</strong> <span class="eng">Steak
									&amp; Cheese </span> <span class="cal">380 kcal</span>
								<div class="summary">
									<p>
										육즙이 쫙~<br />풍부한 비프 스테이크의 풍미가 입안 한가득
									</p>
								</div> <a class="btn_view" data-id="pm01" href="#"></a>
							</li>
							<li class="pm">
								<div class="img">
									<img alt="터키 베이컨 아보카도" src="resources/images/menu/sandwich_pm02.jpg" />
								</div> <strong class="tit">터키 베이컨 아보카도</strong> <span class="eng">Turkey
									Bacon Avocado</span> <span class="cal">420 kcal</span>
								<div class="summary">
									<p>
										담백한 터키와 바삭한 베이컨 환상조합에<br /> 부드러운 아보카도는 신의 한수
									</p>
								</div> <a class="btn_view" data-id="pm02" href="#"></a>
							</li>
							<li class="pm">
								<div class="img">
									<img alt="써브웨이 멜트" src="resources/images/menu/sandwich_pm04.jpg" />
								</div> <strong class="tit">써브웨이 멜트</strong> <span class="eng">Subway
									Melt™</span> <span class="cal">365 kcal</span>
								<div class="summary">
									<p>
										자신있게 추천하는 터키, 햄, 베이컨의<br /> 완벽한 맛의 밸런스
									</p>
								</div> <a class="btn_view" data-id="pm04" href="#"></a>
							</li>
							<li class="pm">
								<div class="img">
									<img alt="스파이시 이탈리안" src="resources/images/menu/sandwich_pm06.jpg" />
								</div> <strong class="tit">스파이시 이탈리안</strong> <span class="eng">Spicy
									Italian</span> <span class="cal">480 kcal</span>
								<div class="summary">
									<p>
										살라미, 페퍼로니가 입안 한가득!<br /> 쏘 핫한 이탈리아의 맛
									</p>
								</div> <a class="btn_view" data-id="pm06" href="#"></a>
							</li>
							<li class="pm">
								<div class="img">
									<img alt="치킨 데리야끼" src="resources/images/menu/sandwich_pm07.jpg" />
								</div> <strong class="tit">치킨 데리야끼</strong> <span class="eng">Chicken
									Teriyaki</span> <span class="cal">370 kcal</span>
								<div class="summary">
									<p>
										담백한 치킨 스트립에 달콤짭쪼름한 써브웨이 특제<br /> 데리야끼 소스와의 환상적인 만남
									</p>
								</div> <a class="btn_view" data-id="pm07" href="#"></a>
							</li>
							<li class="bf">
								<div class="img">
									<img alt="햄, 에그&치즈" src="resources/images/menu/sandwich_bf01.jpg" />
								</div> <strong class="tit">햄, 에그&치즈</strong> <span class="eng">Ham,
									Egg & Cheese</span> <span class="cal">400 kcal</span>
								<div class="summary">
									<p>
										푹신한 오믈렛과 햄의 가장 클래식한 조화<br />※아침메뉴 제공시간 : 오전 11시까지
									</p>
								</div> <a class="btn_view" data-id="bf01" href="#"></a>
							</li>
							<li class="bf">
								<div class="img">
									<img alt="웨스턴, 에그 &amp; 치즈"
										src="resources/images/menu/sandwich_bf02.jpg" />
								</div> <strong class="tit">웨스턴, 에그 &amp; 치즈</strong> <span class="eng">Western,
									Egg &amp; Cheese</span> <span class="cal">370 kcal</span>
								<div class="summary">
									<p>
										<!-- 2018.01.31 아침메뉴제공시간 추가 -->
										토마토, 피망, 양파 세가지 야채가 더해져<br /> 더욱 신선한 하루 시작<br /> ※아침메뉴 제공시간
										: 오전 11시까지
									</p>
								</div> <a class="btn_view" data-id="bf02" href="#"></a>
							</li>
							<li class="bf">
								<div class="img">
									<img alt="베이컨, 에그 &amp; 치즈"
										src="resources/images/menu/sandwich_bf03.jpg" />
								</div> <strong class="tit">베이컨, 에그 &amp; 치즈</strong> <span class="eng">Bacon,
									Egg &amp; Cheese</span> <span class="cal">450 kcal</span>
								<div class="summary">
									<p>
										<!-- 180130 수정 -->
										<!-- 2018.01.31 아침메뉴제공시간 추가 -->
										오리지널 아메리칸 베이컨으로<br /> 더욱 풍성한 아침 식사<br /> ※아침메뉴 제공시간 : 오전
										11시까지
									</p>
								</div> <a class="btn_view" data-id="bf03" href="#"></a>
							</li>
							<li class="bf">
								<div class="img">
									<img alt="스테이크, 에그 &amp; 치즈"
										src="resources/images/menu/sandwich_bf04.jpg" />
								</div> <strong class="tit">스테이크, 에그 &amp; 치즈</strong> <span
								class="eng">Steak, Egg &amp; Cheese</span> <span class="cal">440
									kcal</span>
								<div class="summary">
									<p>
										<!-- 180130 수정 -->
										<!-- 2018.01.31 아침메뉴제공시간 추가 -->
										육즙 가득 비프 스테이크로 든든한 아침 식사<br /> ※아침메뉴 제공시간 : 오전 11시까지
									</p>
								</div> <a class="btn_view" data-id="bf04" href="#"></a>
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

</body>
</html>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>