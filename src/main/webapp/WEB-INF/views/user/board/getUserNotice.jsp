<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/noticein.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/footer.css" />
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	
	<!-- container s -->
            <div id="container">
			<div class="sub_header">
				<div class="content">
					<a class="logo" href="/">HOME</a>
					<!-- sub location -->
					<div class="sub_loc">
						<ul>
							<li><a href="./eventList">이벤트ㆍ프로모션</a></li>
							<li class="active"><a href="#">뉴스ㆍ공지사항</a></li>
							<li><a href="./tvCommercial">광고영상</a></li>
						</ul>
					</div>
					<!--// sub location -->
					<a class="top" href="#none">TOP</a>
				</div>
			</div>
		</div>
	
	
	<!-- sub content s -->
	<div id="content">
		<!-- 뉴스ㆍ공지사항 view s -->
		<div class="news_view_wrapper">
			<div class="content">
				<h2 class="title">${notice.title }</h2>
				<div class="date"><fmt:formatDate value="${notice.regDate }" pattern="yyyy.MM.dd HH:mm" /></div>

				<div class="news_view_content">
					<!-- <div class="img"><img src="../images/temp/temp_news_view.jpg" /></div> -->
					<div class="text_wrap">
					<c:if test="${notice.filePath != null }">
						<p class="MsoNormal">
							<img src="${notice.filePath}" style="width: 800px;"><br>
						</p>
					</c:if>
						<p class="MsoNormal">${notice.content}</p>
					</div>
				</div>

				<!-- 첨부파일 -->

				<!--// 첨부파일 -->

				<div class="btn_list">
					<a href="/lubway/getUserNoticeList.do">목록보기</a>
				</div>

				<!-- 우측 영역 -->
				
									<div class=board_right>
					<c:forEach items="${getRightNoticeList}" var="getRightNoticeList">
											<ul class="notice">
								<c:set var="fix" value="${getRightNoticeList.fix }" />
								<c:choose>
								
									<c:when test="${fix eq 'true' }">
											<div style="font-size:1.1em" align="center">
												<img align="left" src="resources/images/common/icon_notice.png">
												<a type="hidden" href="getUserNotice.do?no=${getRightNoticeList.no}">${getRightNoticeList.title }</a>
											</div>
											
											</c:when>
										
									
									<c:otherwise>
									
										
										<div style="font-size:1.1em" align="center">
												<a type="hidden" href="getUserNotice.do?no=${getRightNoticeList.no}">${rightNoticeList.title }</a>
											</div>
										
												
									</c:otherwise>
									</c:choose>
									</ul>
									</c:forEach>
				
					<!--// 공지사항 영역 -->

					<!-- 이전,다음글 영역 -->
					
					<!--// 이전,다음글 영역 -->
				</div>
				<!--// 우측 영역 -->
			</div>
		</div>
		</div>
		<!--// 뉴스ㆍ공지사항 view e -->
	<!--// sub content e -->
	<input id="query" type="hidden" value="page=1&amp;subject=" />

	<!-- footer -->
	<div id="footer">
		<div class="content">
			<!-- util menu -->
			<div class="util_menu">
				<ul>
					<li><a href="/agreement">이용약관</a></li>
					<li><a href="/privacy"><strong>개인정보처리방침</strong></a></li>
					<li><a href="https://store.subway.co.kr/" target="_blank">점주관리자</a></li>
				</ul>
			</div>
			<!--// util menu -->

			<span class="addr">서울시 서초구 강남대로 535 프린스빌딩 15층</span> <span
				class="rep">대표 : 콜린클락</span> <span class="tel">전화 :
				02-797-5036</span> <span class="rep">사업자등록번호 : 101-84-04143</span>
			<p class="copyright">SUBWAY® is a Registered Trademark of Subway
				IP LLC. © 2021 Subway IP LLC. All Rights Reserved.</p>
			<a class="sns_area instagram"
				href="https://www.instagram.com/subwaykorea" target="_blank">instagram</a>
			<a class="sns_area fackbook" href="https://www.facebook.com/Subwaykr"
				target="_blank">facebook</a>
		</div>
	</div>

</body>
</html>