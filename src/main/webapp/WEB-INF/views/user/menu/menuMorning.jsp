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
							<li><a href="/lubway/menuWrap.do">랩ㆍ기타</a></li>
							<li><a href="/lubway/menuSalad.do">찹샐러드</a></li>
							<li class="active"><a href="/lubway/menuMorning.do">아침메뉴</a></li>
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
					<div class="visual morning">
						<h2>Morning Menu</h2>
						<p>
                          	아침 메뉴도 Subway와 함께, 취향대로 즐기자!<br />
                            * 그릴드 랩과 파니니는 일부 매장에서만 제공 가능합니다. 매장 리스트는 공지사항을 확인해주세요.
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
						<li class="sandwich">
                                <div class="img">
                                    <img alt="스테이크, 에그 &amp; 치즈" src="../images/menu/sandwich_bf04.jpg" />
                                </div>
                                <strong class="tit">스테이크, 에그 &amp; 치즈</strong>
                                <span class="eng">Steak, Egg &amp; Cheese</span>
                                <span class="cal">440 kcal</span>
                                <div class="summary">
                                    <p> <!-- 180130 수정 --><!-- 2018.01.31 아침메뉴제공시간 추가 -->
                                        	육즙 가득 비프 스테이크로 든든한 아침 식사
                                        <br />
                                      	  ※아침메뉴 제공시간 : 오전 11시까지
                                    </p>
                                </div>
                                <a class="btn_view" data-id="bf04" data-type="sd" href="/lubway/menuDetail.do"></a>
                            </li>
                            <li class="sandwich">
                                <div class="img">
                                    <img alt="햄, 에그&치즈" src="../images/menu/sandwich_bf01.jpg" />
                                </div>
                                <strong class="tit">햄, 에그&치즈</strong>
                                <span class="eng">Ham, Egg & Cheese</span>
                                <span class="cal">400 kcal</span>
                                <div class="summary">
                                    <p>
                                      	  푹신한 오믈렛과 햄의 가장 클래식한 조화<br />※아침메뉴 제공시간 : 오전 11시까지
                                    </p>
                                </div>
                                <a class="btn_view" data-id="bf01" data-type="sd" href="/lubway/menuDetail.do"></a>
                            </li>
                            <li class="sandwich">
                                <div class="img">
                                    <img alt="웨스턴, 에그 &amp; 치즈" src="../images/menu/sandwich_bf02.jpg" />
                                </div>
                                <strong class="tit">웨스턴, 에그 &amp; 치즈</strong>
                                <span class="eng">Western, Egg &amp; Cheese</span>
                                <span class="cal">370 kcal</span>
                                <div class="summary">
                                    <p><!-- 2018.01.31 아침메뉴제공시간 추가 -->
                                    	    토마토, 피망, 양파 세가지 야채가 더해져
                                        <br />
                                   	     더욱 신선한 하루 시작
                                        <br />
                                   	     ※아침메뉴 제공시간 : 오전 11시까지
                                    </p>
                                </div>
                                <a class="btn_view" data-id="bf02" data-type="sd" href="/lubway/menuDetail.do"></a>
                            </li>
                            <li class="sandwich">
                                <div class="img">
                                    <img alt="베이컨, 에그 &amp; 치즈" src="../images/menu/sandwich_bf03.jpg" />
                                </div>
                                <strong class="tit">베이컨, 에그 &amp; 치즈</strong>
                                <span class="eng">Bacon, Egg &amp; Cheese</span>
                                <span class="cal">450 kcal</span>
                                <div class="summary">
                                    <p> <!-- 180130 수정 --><!-- 2018.01.31 아침메뉴제공시간 추가 -->
                                   	     오리지널 아메리칸 베이컨으로
                                        <br />
                                	        더욱 풍성한 아침 식사
                                        <br />
                              	          ※아침메뉴 제공시간 : 오전 11시까지
             	                      </p>
                                </div>
                                <a class="btn_view" data-id="bf03" data-type="sd" href="/lubway/menuDetail.do"></a>
                            </li>
                            <li class="wrap">
                                <div class="img">
                                    <img alt="스테이크, 에그 & 치즈 랩" src="../images/menu/wrap_bf04.png" />
                                </div>
                                <strong class="tit">스테이크, 에그 & 치즈 랩</strong>
                                <span class="eng">Steak, Egg & Cheese Wrap</span>
                                <span class="cal">344 kcal</span>
                                <div class="summary">
                                    <p>
                                        	이제 랩으로 즐기세요!
                                        <br />
                                    	    육즙 가득 비프 스테이크로 든든한 아침 식사
                                        <br />
                                    	    ※아침메뉴 제공시간 : 오전 11시까지
                                    </p>
                                </div>
                                <a class="btn_view" data-id="bf04" data-type="wr" href="/lubway/menuDetail.do"></a>
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
