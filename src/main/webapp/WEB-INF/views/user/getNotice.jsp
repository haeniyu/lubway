<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<h2 class="title">써브웨이와 함께하는 JTBC &#39;라이브온&#39;</h2>
				<div class="date">2020.11.16 17:33</div>

				<div class="news_view_conten">
					<!-- <div class="img"><img src="../images/temp/temp_news_view.jpg" /></div> -->
					<div class="text_wrap">
						<p>
							<img src="resources/upload/event/liveon_20201116063037079.png"
								style="width: 800px;"><br>
						</p>
						<p>써브웨이와 함께하는 JTBC '라이브온', 많은 시청 부탁 드립니다.</p>
					</div>
				</div>

				<!-- 첨부파일 -->

				<!--// 첨부파일 -->

				<div class="btn_list">
					<a href="#" onclick="view.list();return false;">목록보기</a>
				</div>

				<!-- 우측 영역 -->
				<div class="board_right">
					<!-- 공지사항 영역 -->
					<ul class="notice">
						<li><a href="${path}" onclick="view.view(241)">써브웨이와 함께하는 JTBC
								&#39;라이브온&#39;</a></li>
						<li><a href="#" onclick="view.view(232)">써브웨이 앱 출시 및 앱 사용
								불가 매장 안내</a></li>
						<li><a href="#" onclick="view.view(220)">써브웨이 그릴드 랩 &amp;
								파니니 일부 매장 판매 안내 </a></li>
						<li><a href="#" onclick="view.view(214)">써브웨이 모바일 상품권 이용
								안내의 건</a></li>
						<li><a href="#" onclick="view.view(190)">고객 경험 설문조사 프로그램
								안내</a></li>
					</ul>
					<!--// 공지사항 영역 -->

					<!-- 이전,다음글 영역 -->
					<ul class="board_nav">
						<li class="prev"><a href="#" onclick="view.view(242)">2021년
								설날 당일 매장 영업 안내 </a></li>
						<li><strong>써브웨이와 함께하는 JTBC &#39;라이브온&#39;</strong></li>
						<li class="next"><a href="#" onclick="view.view(240)">2020년
								추석 당일 매장운영 안내</a></li>
					</ul>
					<!--// 이전,다음글 영역 -->
				</div>
				<!--// 우측 영역 -->
			</div>
		</div>
		<!--// 뉴스ㆍ공지사항 view e -->
	</div>
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