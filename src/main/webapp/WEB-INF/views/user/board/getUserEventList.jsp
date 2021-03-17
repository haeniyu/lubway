<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
<!-- sub content s -->
		<div id="content">
			<h2 class="subTitle">이벤트ㆍ프로모션</h2>

			<!-- 이벤트ㆍ프로모션 slider s -->
			<div class="event_slider_wrapper">
				<div class="event_slider_cont">
					<ul class="evnet_slider">
					  <li>
						  <div class="event_img"><img src="/upload/event/event_770x400_20210302025848646.jpg" alt="써브웨이 로스트 치킨 컬렉션" onclick="view.view(190);return false;" /></div>
						  <div class="event_info">
							  
								  
								  
								  <div class="date"><em>2021.03.02 ~ 2021.05.02</em></div>
							  

							  <strong class="title">써브웨이 로스트 치킨 컬렉션</strong>
							  <p class="summary">부담 없이 다가온<br>NO부담 로스트 치킨</p>
							  <a class="btn_more" href="#" onclick="view.view(190);return false;">자세히보기</a>
						  </div>
					  </li>
					</ul>
				</div>
			</div>
			<!--// 이벤트ㆍ프로모션 slider s -->

			<!-- 이벤트 list s -->
			<div class="event_list_wrapper">
				<div class="content">
					<!-- tab -->
					<div class="tab_wrapper">
						<ul id="tabList">
							<li>진행중인 이벤트</li>
						</ul>
					</div>
					<!--// tab -->
					<!-- 이벤트 list content s -->
					<div class="event_list_content">
						<ul id="eventListContent">
							<li>
								<a href="#" onclick="view.view(190);return false;">
									<div class="event_img"><img src="/upload/event/event_370x192_20210302025848613.jpg" alt="써브웨이 로스트 치킨 컬렉션" /></div>
									<div class="event_info">
										<strong class="title">써브웨이 로스트 치킨 컬렉션</strong>

										
											
											<div class="date">
												
													
													<em>2021.03.02 ~ 2021.05.02</em>
												
											</div>
										
										
											<p class="ev_close">&nbsp;</p>
										
									</div>
								</a>
							</li>
							<li>
								<a href="#" onclick="view.view(189);return false;">
									<div class="event_img"><img src="/upload/event/event_370x192_20210226012255184.jpg" alt="이달의 썹!프라이즈!" /></div>
									<div class="event_info">
										<strong class="title">이달의 썹!프라이즈!</strong>

										
											
											<div class="date">
												
													
													<em>2021.03.02 ~ 2021.05.02</em>
												
											</div>
										
										
											<p class="ev_close">&nbsp;</p>
										
									</div>
								</a>
							</li>
							<li>
								<a href="#" onclick="view.view(186);return false;">
									<div class="event_img"><img src="/upload/event/event_370x192_20201113042155863.jpg" alt="써브웨이 아침메뉴!" /></div>
									<div class="event_info">
										<strong class="title">써브웨이 아침메뉴!</strong>

										
											
											<div class="date">
												
													
													<em>2020.11.16 ~ </em>
												
											</div>
										
										
											<p class="ev_close">&nbsp;</p>
										
									</div>
								</a>
							</li>
							<li>
								<a href="#" onclick="view.view(180);return false;">
									<div class="event_img"><img src="/upload/event/event_370x192_20201006035853185.jpg" alt="말이 안 나올 땐 손으로 주문하자!" /></div>
									<div class="event_info">
										<strong class="title">말이 안 나올 땐 손으로 주문하자!</strong>

										
											
											<div class="date">
												
													
													<em>2020.10.16 ~ </em>
												
											</div>
										
										
											<p class="ev_close">&nbsp;</p>
										
									</div>
								</a>
							</li>
							<li class="close">
								<a href="#" onclick="return false;">
									<div class="event_img"><img src="/upload/event/event_370x192_20201223014858568.jpg" alt="써브웨이 에그마요 3종" /></div>
									<div class="event_info">
										<strong class="title">써브웨이 에그마요 3종</strong>

										
											<p class="ev_close">이벤트가 종료되었습니다.</p>
											
										
										
											<p class="ev_close">&nbsp;</p>
										
									</div>
								</a>
							</li>
							<li class="close">
								<a href="#" onclick="return false;">
									<div class="event_img"><img src="/upload/event/event_370x192_20201030114358922.jpg" alt="스마일 썹 사이드 2종 출시!" /></div>
									<div class="event_info">
										<strong class="title">스마일 썹 사이드 2종 출시!</strong>

										
											<p class="ev_close">이벤트가 종료되었습니다.</p>
											
										
										
											<p class="ev_close">&nbsp;</p>
										
									</div>
								</a>
							</li>
						</ul>
						<a class="btn_list_more" href="#" data-listcount="31" onclick="view.more(this);return false;">더보기</a>
						<form id="searchForm" method="get" name="searchForm">
							<input name="page" type="hidden" value="1" />
							<input name="eventState" type="hidden" value="" />
						</form>
					</div>
					<!--// 이벤트 list content s -->
				</div>
			</div>
			<!--// 이벤트 list e -->

		</div>
		<!--// sub content e -->
		<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>