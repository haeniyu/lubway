<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/notice.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/footer.css" />
<title>SUBWAY - 뉴스ㆍ공지사항</title>
<meta charset="utf-8" />

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
		<h2 class="subTitle">뉴스ㆍ공지사항</h2>

		<!-- 뉴스ㆍ공지사항 list s -->
		<div class="board_list_wrapper">
			<div class="content">
				<p class="board_total">
					총<strong itemid="${pagination}">${pageList}</strong>건의 게시글이 있습니다.
				</p>

				<div class="cont_right">
					<div class="form_search">
						<form id="searchForm" method="GET" name="searchForm"
							onsubmit="return view.search();">
							<input name="page" type="hidden" value="1" /> <input
								name="subject" placeholder="검색어를 입력하세요" type="text" value="" />
							<a class="btn_search" href="#"
								onclick="view.search();return false;"></a>
						</form>
					</div>
				</div>

				<table>
					<caption>뉴스ㆍ공지사항 테이블</caption>
					<colgroup>
						<col width="100px" />
						<col width="*" />
						<col width="50px" />
						<col width="120px" />
					</colgroup>
					<tbody>
						<tr class="notice">
							<!-- 공지사항일경우 notice 클래스 추가 -->
							<td><div class="icon_notice"></div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(241);return false;">써브웨이와
										함께하는 JTBC &#39;라이브온&#39;</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">20.11.16</div></td>
						</tr>
						<tr class="notice">
							<!-- 공지사항일경우 notice 클래스 추가 -->
							<td><div class="icon_notice"></div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(232);return false;">써브웨이 앱
										출시 및 앱 사용 불가 매장 안내</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">20.06.24</div></td>
						</tr>
						<tr class="notice">
							<!-- 공지사항일경우 notice 클래스 추가 -->
							<td><div class="icon_notice"></div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(220);return false;">써브웨이 그릴드
										랩 &amp; 파니니 일부 매장 판매 안내 </a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">19.10.10</div></td>
						</tr>
						<tr class="notice">
							<!-- 공지사항일경우 notice 클래스 추가 -->
							<td><div class="icon_notice"></div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(214);return false;">써브웨이 모바일
										상품권 이용 안내의 건</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">19.08.20</div></td>
						</tr>
						<tr class="notice">
							<!-- 공지사항일경우 notice 클래스 추가 -->
							<td><div class="icon_notice"></div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(190);return false;">고객 경험
										설문조사 프로그램 안내</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">18.07.20</div></td>
						</tr>
						<tr>
							<td><div class="num">145</div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(243);return false;">써브웨이
										고객센터 2021년 설 연휴 휴무 안내</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">21.02.09</div></td>
						</tr>
						<tr>
							<td><div class="num">144</div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(242);return false;">2021년 설날
										당일 매장 영업 안내 </a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">21.02.09</div></td>
						</tr>
						<tr>
							<td><div class="num">143</div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(241);return false;">써브웨이와
										함께하는 JTBC &#39;라이브온&#39;</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">20.11.16</div></td>
						</tr>
						<tr>
							<td><div class="num">142</div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(240);return false;">2020년 추석
										당일 매장운영 안내</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">20.09.28</div></td>
						</tr>
						<tr>
							<td><div class="num">141</div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(239);return false;">써브웨이
										고객센터 2020년 추석 연휴 휴무 안내</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">20.09.28</div></td>
						</tr>
						<tr>
							<td><div class="num">140</div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(238);return false;">써브웨이와
										함께하는 KBS &#39;오!삼광빌라&#39; </a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">20.09.21</div></td>
						</tr>
						<tr>
							<td><div class="num">139</div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(237);return false;">써브웨이와
										함께하는 tvN &#39;청춘기록&#39;</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">20.09.07</div></td>
						</tr>
						<tr>
							<td><div class="num">138</div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(236);return false;">써브웨이와
										함께하는 tvN &#39;식스센스&#39;</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">20.09.07</div></td>
						</tr>
						<tr>
							<td><div class="num">137</div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(234);return false;">개인정보
										처리방침 개정안내</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">20.07.01</div></td>
						</tr>
						<tr>
							<td><div class="num">136</div></td>
							<td><div class="title">
									<a href="#" onclick="view.view(233);return false;">써브카드 잔액
										환불 안내</a>
								</div></td>
							<td><div></div></td>
							<td><div class="date">20.07.01</div></td>
						</tr>
					</tbody>
				</table>
			</div>

			<!-- board 페이지 -->
			<div>
				<div class="pagination">


					<a class="arr prev" href="javascript:void(0);"></a> <a
						class="active" href="#">1</a> <a href="#"
						onclick="paging.page(2);return false;">2</a> <a href="#"
						onclick="paging.page(3);return false;">3</a> <a href="#"
						onclick="paging.page(4);return false;">4</a> <a href="#"
						onclick="paging.page(5);return false;">5</a> <a href="#"
						onclick="paging.page(6);return false;">6</a> <a href="#"
						onclick="paging.page(7);return false;">7</a> <a href="#"
						onclick="paging.page(8);return false;">8</a> <a href="#"
						onclick="paging.page(9);return false;">9</a> <a href="#"
						onclick="paging.page(10);return false;">10</a> <a class="arr next"
						href="javascript:void(0);" onclick="paging.next(15);return false;"></a>

				</div>
			</div>
			<!--// board 페이지 -->
		</div>
		<!--// 뉴스ㆍ공지사항 list e -->
	</div>
	<!--// sub content e -->


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