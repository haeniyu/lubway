<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <link rel="stylesheet" href="resources/css/step01.css">
		<link rel="stylesheet" href="resources/css/menu.css?v=2">
        <script type="text/javascript" src="/js/jquery/jquery-1.12.4.min.js?v=2021031802"></script>
        <script type="text/javascript" src="/js/jquery/jquery-ui-1.12.0.min.js?v=2021031802"></script>
        <script type="text/javascript" src="/js/jquery/jquery.easing.1.3.min.js?v=2021031802"></script>
        <script type="text/javascript" src="/js/jquery/jquery.bxslider.min.js?v=2021031802"></script>
        <script type="text/javascript" src="/js/jquery/jquery.mCustomScrollbar.concat.min.js?v=2021031802"></script>
        <!-- block ui -->
        <script type="text/javascript" src="/js/jquery/jquery.blockUI.min.js?v=2021031802"></script>

        <script type="text/javascript" src="/js/jquery/TweenMax.min.js?v=2021031802"></script>
        <script type="text/javascript" src="/js/jquery/jquery.cookie.js?v=2021031802"></script>
        <!--<script type="text/javascript" th:src="'/js/lottie.js?v=' + ${cacheParam}"></script>-->
        <script type="text/javascript" src="/js/ui.common.js?v=2021031802"></script>
        <script type="text/javascript" src="/js/subway.common.js?v=2021031802"></script>
        <script type="text/javascript" src="/js/util/jsrender.js?v=2021031802"></script>
        <script type="text/javascript" src="/js/jquery/jquery.tmpl.min.js?v=2021031802"></script>
        <script type="text/javascript" src="/js/waffle/waffle.utils.js?v=2021031802"></script>
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
						<div class="category">
						</div>
						<!--// 20180208 -->
                        <h2 class="name">로스트 치킨 베이컨</h2>
                        <p class="eng">Roasted Chiken Bacon</p>
                        <p class="cal">409 Kcal</p>

                        <!-- sns -->
                        <div class="sns">
                            <a class="fb" href="#" onclick="subwayCommon.shareToFacebook(location.href); return false;">FACE BOOK</a>
                            <a class="kt" href="#" id="ui_kakao_btn" onclick="subwayCommon.shareToKakao(location.href); return false;">KAKAO TALK</a>
                            <a class="url" href="#" onclick="subwayCommon.copyToClipboard(location.href, this); return false;">COPY URL</a>
                        </div>
                        <!--// sns -->
                    </div>
                    <!--// 메뉴 header -->
                    <!-- 메뉴 content -->
                    <div class="menu_content">
                        <!-- 메뉴정보 -->
                        <div class="menu_info">
                            <div class="menu_img"><img alt="로스트 치킨 베이컨" src="resources/images/menu/sandwich_fl10.png" /></div>
                            <div class="order">
                                <div class="price"><em>5,900</em>원</div>
                                <a class="btn bgc_point" href="#none" style="width:180px;"><span>주문하기</span></a>
                            </div>
                            <p class="summary">
                                든든한 로스트치킨과<br />
                                바삭한 베이컨의 풍미 넘치는 조합!
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

                            <!-- 이전/다음 버튼
                            <a class="arr prev" href="/sandwichView?param=fl06"><span>베지</span></a>
                            <a class="arr next" href="/sandwichView?param=fl09"><span>로스트 치킨 아보카도</span></a>
                            // 이전/다음 버튼 -->
                        </div>
                        <!--// 메뉴정보 -->

                        <p class="common_caution">* 제품 사진은 이미지컷입니다.</p> <!--공통문구-->

                        <!-- 영양성분표 -->
                        <div class="component_chart">
                            <div class="content">
                                <h3>영양성분표</h3>
                    <!-- 로스트 치킨 베이컨 -->
                    <div class="board_list_wrapper">
                        <table>
                            <thead>
                            <TR><th scope="col">중량(g)</th>
                            <th scope="col">열량(kcal)</th>
                            <th scope="col">당류(g)</th>
                            <th scope="col">단백질(g)</th>
                            <th scope="col">포화지방(g)</th>
                            <th scope="col">나트륨(mg)</th>
                            
                            </TR></thead><tbody>
                            <TR><td>248</td>
                            <td>409</td>
                            <td>9</td>
                            <td>29 (53%)</td>
                            <td>4 (23%)</td>
                            <td>1030 (52%)</td>
                            
                        </TR></tbody></table>
                    </div>
                    <ul class="notice">
                        <li>※ 기본야채 5종(양상추, 토마토, 양파, 피망, 오이) 및 제품에 따른 미트류 포함, 치즈 및 소스 제외, 15cm 위트 브레드 기준</li>
                        <li>※ 괄호 안 %는 1일 영양소 기준치에 대한 비율</li>
                    </ul>

                               <!--  <div class="btns_wrapper">
                                    <a class="btn bgc_black size1" href="/sandwichCountry" link-type="popup" onclick="popup_open(this,630,740); return false;" style="width:110px;"><span>원산지 정보</span></a>
                                    <a class="btn bgc_black size1" href="/sandwichAllergy" link-type="popup" onclick="popup_open(this,900,740); return false;" style="width:125px;"><span>알레르기 정보</span></a>
                                </div> -->
                            </div>
                        </div>
                        <!--// 영양성분표 -->

                        <!-- 세가지 원칙 -->
                        <div class="fresh3_wrapper">
<!-- 세가지 원칙 -->
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

                        <!-- 이전메뉴 
                        <div class="menu_nav prev">
                            <div class="img"><img alt="베지" src="../images/menu/sandwich_fl06.jpg" /></div>
                        </div>
                        // 이전메뉴
                        // 다음메뉴 
                        <div class="menu_nav next">
                            <div class="img"><img alt="로스트 치킨 아보카도" src="../images/menu/sandwich_fl09.png" /></div>
                        </div>
                        // 다음메뉴 -->

                        <!-- 목록보기 -->
                        <div class="btns_list_wrapper">
                            <div class="btn_list"><a href="/lubway/menu.do">목록보기</a></div>
                        </div>
                        <!--// 목록보기 -->
                    </div>
                    <!--// 메뉴 content -->
                </div>
                <!--// 메뉴소개 e -->
			</div>
			<!--// sub content e -->
		</div>

<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>