<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LUBWAY</title>
<link rel="stylesheet" href="resources/css/step01.css">
<link rel="stylesheet" href="resources/css/menu.css?v=2">
<link rel="stylesheet" href="resources/css/modal.css" />
<link rel="stylesheet" href="resources/css/ui.common.css" />
<link rel="stylesheet" href="resources/css/ui.popup.css" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="resources/js/TweenMax.js"></script>

<!--<script type="text/javascript" th:src="'/js/lottie.js?v=' + ${cacheParam}"></script>-->
<!--   <script type="text/javascript" src="/js/ui.common.js?v=2021031802"></script>
        <script type="text/javascript" src="/js/subway.common.js?v=2021031802"></script>
        <script type="text/javascript" src="/js/waffle/waffle.utils.js?v=2021031802"></script>
-->
        <!-- 
	<link href="" rel="shortcut icon" type="image/x-icon">
 -->
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<div id="container">

		<div class="sub_header">
			<div class="content">
				<a class="logo" href="/">HOME</a>
				<!-- sub location -->
				<div class="sub_loc">
					<!-- 메뉴소개 -->
					<ul>
						<li class="active"><a href="/lubway/menuSandwich.do">샌드위치</a></li>
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
			<div class="menu_view_wrapper">
				<!-- 메뉴 header -->
				<div class="hd">
					<!-- 20180208 -->
					<div class="category"></div>
					<!--// 20180208 -->
					<h2 class="name">로스트 치킨 베이컨</h2>
					<p class="eng">Roasted Chiken Bacon</p>
					<p class="cal">409 Kcal</p>
				</div>
				<!--// 메뉴 header -->
				<!-- 메뉴 content -->
				<div class="menu_content">
					<!-- 메뉴정보 -->
					<div class="menu_info">
						<div class="menu_img">
							<img alt="로스트 치킨 베이컨" src="" />
						</div>
						<div class="order">
							<div class="price">
								<em>5,900</em>원
							</div>
							<a class="btn bgc_point" href="#none" style="width: 180px;"><span>주문하기</span></a>
						</div>
						<p class="summary">
							든든한 로스트치킨과<br /> 바삭한 베이컨의 풍미 넘치는 조합!
						</p>

						<!-- 레시피
                            <div class="recipe">
                                <ul>
                                    <li>
                                        <div class="img"><img alt="치킨 브레스트" src="../images/menu/img_recipe13.jpg" /></div>
                                        <p>치킨 브레스트 1장</p>
                                    </li>
                                    <li>
                                        <div class="img"><img alt="치즈" src="../images/menu/img_recipe04.jpg" /></div>
                                        <p>치즈 2장</p>
                                    </li>
                                    <li>
                                        <div class="rec">추천</div>
                                        <div class="img"><img alt="스위트 어니언" src="../images/menu/img_recipe_s07.jpg" /></div>
                                        <p>스위트 어니언</p>
                                    </li>
                                    <li>
                                        <div class="img"><img alt="베이컨" src="../images/menu/img_recipe02.jpg" /></div>
                                        <p>베이컨 2장</p>
                                    </li>
                                </ul>
                            </div>
                            // 레시피 -->
					</div>
					<!--// 메뉴정보 -->

					<p class="common_caution">* 제품 사진은 이미지컷입니다.</p>
					<!--공통문구-->

					<!-- 영양성분표 -->
					<div class="component_chart">
						<div class="content">
							<h3>영양성분표</h3>
							<!-- 로스트 치킨 베이컨 -->
							<div class="board_list_wrapper">
								<table>
									<thead>
										<TR>
											<th scope="col">중량(g)</th>
											<th scope="col">열량(kcal)</th>
											<th scope="col">당류(g)</th>
											<th scope="col">단백질(g)</th>
											<th scope="col">포화지방(g)</th>
											<th scope="col">나트륨(mg)</th>

										</TR>
									</thead>
									<tbody>
										<TR>
											<td>248</td>
											<td>409</td>
											<td>9</td>
											<td>29 (53%)</td>
											<td>4 (23%)</td>
											<td>1030 (52%)</td>

										</TR>
									</tbody>
								</table>
							</div>
							<ul class="notice">
								<li>※ 기본야채 5종(양상추, 토마토, 양파, 피망, 오이) 및 제품에 따른 미트류 포함, 치즈 및
									소스 제외, 15cm 위트 브레드 기준</li>
								<li>※ 괄호 안 %는 1일 영양소 기준치에 대한 비율</li>
							</ul>

							<div class="btns_wrapper">
								<a id="popup" class="btn bgc_black size1" style="width: 110px;" href="#popup_wrap" rel="modal:open">
									<span>원산지 정보</span>
								</a>
							</div>
						</div>
					</div>

					<!-- 세가지 원칙 -->
					<div class="fresh3_wrapper">
						<div>
							<div class="hd">
								<p>써브웨이만이 가지고 있는 세가지 원칙</p>
								<h3>
									<span>SUBWAY</span> 3 FRESH
								</h3>
							</div>
							<div class="content">
								<ol>
									<li>
										<div class="img">
											<img alt="매장에서 직접 구워낸 신선한 빵" src="resources/images/menu/img_fresh3_01.jpg" />
										</div>
										<div class="info">
											<span class="num">1</span> <strong>매장에서 직접 구워낸<br />신선한
												빵
											</strong>
											<p>
												매일 아침 각 매장에서 발효하고 직접 구워서<br />퀄러티 높은 신선한 빵을 제공합니다.
											</p>
										</div>
									</li>
									<li>
										<div class="img">
											<img alt="매일 배송되는 신선한 야채 제공" src="resources/images/menu/img_fresh3_02.jpg" />
										</div>
										<div class="info">
											<span class="num">2</span> <strong>매일 배송되는<br />신선한
												야채 제공
											</strong>
											<p>
												매장에서 직접 손질한 야채를<br />당일판매 원칙으로 제공하고 있습니다.
											</p>
										</div>
									</li>
									<li>
										<div class="img">
											<img alt="주문과 동시에 바로 만드는 신선함" src="resources/images/menu/img_fresh3_03.jpg" />
										</div>
										<div class="info">
											<span class="num">3</span> <strong>주문과 동시에<br />바로
												만드는 신선함
											</strong>
											<p>
												주문과 동시에 만들어지는 시스템으로<br />직접 눈으로 신선함을 확인하실 수 있습니다.
											</p>
										</div>
									</li>
								</ol>
							</div>
						</div>
						<!--// 세가지 원칙 -->
					</div>
					<!--// 세가지 원칙 -->

					<!-- 목록보기 -->
					<div class="btns_list_wrapper">
						<div class="btn_list">
							<a href="/lubway/menu.do">목록보기</a>
						</div>
						<!-- 이부분 수정 필요! -->
					</div>
					<!--// 목록보기 -->
				</div>
				<!--// 메뉴 content -->
			</div>
			<!--// 메뉴소개 e -->
		</div>
		<!--// sub content e -->
	</div>

	<!-- 원산지 표시 Modal -->
	<div id="popup_wrap" style="display: none;">
		<h1 class="title">원산지정보</h1>
		<div class="popup_content" style="overflow-y:auto; overflow-x:hidden; height:630px;">
			<div class="country_origin_wrapper">
				<div>
					<div id="mCSB_1" tabindex="0" style="max-height: none;">
						<div id="mCSB_1_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">
							<ul>
								<li>
									<div class="icon">
										<img alt="쇠고기" src="https://lubway.s3.ap-northeast-2.amazonaws.com/icon_country_origin01.png" class="mCS_img_loaded">
										<span>쇠고기</span>
									</div>
									<div class="info">
										<dl>
											<dt>로스트 비프, 미트볼</dt>
											<dd>: 호주산</dd>
											<dt>스테이크</dt>
											<dd>: 미국산</dd>
										</dl>
									</div>
								</li>
								<li>
									<div class="icon">
										<img alt="돼지고기" src="https://lubway.s3.ap-northeast-2.amazonaws.com/icon_country_origin02.png" class="mCS_img_loaded">
										<span>돼지고기</span>
									</div>
									<div class="info">
										<dl>
											<dt>베이컨, 살라미, 페퍼로니, 풀드 포크 바비큐</dt>
											<dd>: 미국산</dd>
											<dt>베이컨 비츠</dt>
											<dd>: 미국산</dd>
											<dt>햄</dt>
											<dd>: 국내산 돈육,수입후지(네덜란드)</dd>
										</dl>
									</div>
								</li>
								<li>
									<div class="icon">
										<img alt="닭고기" src="https://lubway.s3.ap-northeast-2.amazonaws.com/icon_country_origin03.png" class="mCS_img_loaded">
										<span>닭고기</span>
									</div>
									<div class="info">
										<dl>
											<dt>치킨 브레스트, 치킨 스트립, 로티세리 바비큐 치킨</dt>
											<dd>: 미국산</dd>
										</dl>
									</div>
								</li>
								<li>
									<div class="icon">
										<img alt="칠면조고기" src="https://lubway.s3.ap-northeast-2.amazonaws.com/icon_country_origin04.png" class="mCS_img_loaded">
										<span>칠면조고기</span>
									</div>
									<div class="info">
										<dl>
											<dt>터키 브레스트</dt>
											<dd>: 터키가슴살(칠레,미국)</dd>
										</dl>
									</div>
								</li>
								<li>
									<div class="icon">
										<img alt="참치" src="https://lubway.s3.ap-northeast-2.amazonaws.com/icon_country_origin06.png" class="mCS_img_loaded">
										<span>참치</span>
									</div>
									<div class="info">
										<dl>
											<dt>참치</dt>
											<dd>: 태국산</dd>
										</dl>
									</div>
								</li>
							</ul>
						</div>
						<div style="display: block;">
							<div class="mCSB_draggerContainer">
								<div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 429px; top: 0px; display: block; max-height: 536px;">
									<div class="mCSB_dragger_bar" style="line-height: 30px;">
									</div>
								</div>
								<div class="mCSB_draggerRail"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>