<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/event.css" />
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
						  <div class="top_event_img"><img src="${newEvent.thumbnail }"/></div>
						  <div class="top_event_info">
							 <div class="date"><em><fmt:formatDate value="${newEvent.regdate }" pattern="yyyy.MM.dd"/>
							 							 ~ <fmt:formatDate value="${newEvent.enddate }" pattern="yyyy.MM.dd"/></em></div>
							  <strong class="title">${newEvent.title }</strong>
							  <a class="btn_more" href="getUserEvent.do?no=${newEvent.no }">자세히보기</a>
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
							<c:forEach items="${eventList }" var="event">
								<li>
									<a type="hidden" href="getUserEvent.do?no=${event.no }">
										<div class="event_img"><img width="370px" src="${event.thumbnail }"/></div>
										<div class="event_info">
											<strong class="title">${event.title }</strong>
												<div class="date">
														<em><fmt:formatDate value="${event.regdate }" pattern="yyyy.MM.dd"/>
							 							 ~ <fmt:formatDate value="${event.enddate }" pattern="yyyy.MM.dd"/></em>
												</div>
												<p class="ev_close">&nbsp;</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!--// 이벤트 list e -->

		</div>
		<!--// sub content e -->
		<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>