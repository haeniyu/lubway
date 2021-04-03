<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="resources/js/TweenMax.js"></script>
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
						<c:if test="${select eq 'menuSandwich.do'}">
							<li class="active"><a href="/lubway/menuSandwich.do">샌드위치</a></li>
						</c:if>
						<c:if test="${select ne 'menuSandwich.do'}">
							<li><a href="/lubway/menuSandwich.do">샌드위치</a></li>
						</c:if>
						
						<c:if test="${select eq 'menuWrap.do'}">
							<li class="active"><a href="/lubway/menuWrap.do">랩ㆍ기타</a></li>
						</c:if>
						<c:if test="${select ne 'menuWrap.do'}">
							<li><a href="/lubway/menuWrap.do">랩ㆍ기타</a></li>
						</c:if>
						
						<c:if test="${select eq 'menuSalad.do'}">
							<li class="active"><a href="/lubway/menuSalad.do">찹샐러드</a></li>
						</c:if>
						<c:if test="${select ne 'menuSalad.do'}">
							<li><a href="/lubway/menuSalad.do">찹샐러드</a></li>
						</c:if>
						
						<c:if test="${select eq 'menuMorning.do'}">
							<li class="active"><a href="/lubway/menuMorning.do">아침메뉴</a></li>
						</c:if>
						<c:if test="${select ne 'menuMorning.do'}">
							<li><a href="/lubway/menuMorning.do">아침메뉴</a></li>
						</c:if>
						
						<c:if test="${select eq 'menuSmileWay.do'}">
							<li class="active"><a href="/lubway/menuSmileWay.do">스마일 웨이</a></li>
						</c:if>
						<c:if test="${select ne 'menuSmileWay.do'}">
							<li><a href="/lubway/menuSmileWay.do">스마일 웨이</a></li>
						</c:if>
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
					<div class="category"></div>
					<h2 class="name">${menu.name }</h2>
					<p class="eng">${menu.engname }</p>
					<p class="cal">${nutrient.cal }Kcal</p>
				</div>
				<!--// 메뉴 header -->
				
				<!-- 메뉴 content -->
				<div class="menu_content">
					<!-- 메뉴정보 -->
					<div class="menu_info">
						<div class="menu_img">
							<img src="${menu.filePath }" />
						</div>
						<p class="summary">
							${menu.content }
						</p>
					</div>
					<!--// 메뉴정보 -->

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
											<td>${nutrient.ttl }</td>
											<td>${nutrient.cal }</td>
											<td>${nutrient.sug }</td>
											<td>${nutrient.pro}</td>
											<td>${nutrient.fat}</td>
											<td>${nutrient.sod}</td>

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

					<!-- 3가지 원칙 -->
					<%@ include file="/WEB-INF/views/user/menu/3fresh.jsp"%>

					<!-- 목록보기 -->
					<div class="btns_list_wrapper">
						<div class="btn_list">
							<a href="/lubway/${select}">목록보기</a>
						</div>
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