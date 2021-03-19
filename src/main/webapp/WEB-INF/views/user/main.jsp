<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/slick/slick-theme.css" />
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<!-- 배너 -->
	<div class="banner">
		<div>
			<img alt="1-2월 에그마요 콜렉션 윈도우"
				src="${path}/resources/upload/banner/main_PC_1920x440_20201223014928858.jpg" />
		</div>
		<div>
			<img alt="민트초코"
				src="${path}/resources/upload/banner/main_PC_1920x440_20210205043330107.jpg" />
		</div>
		<div>
			<img alt="02.내손안의 작은 러브웨이" src="${path}/resources/upload/banner/benner.png" />
		</div>
	</div>
	<!-- 배너 끝 -->
	<!-- quick link -->
	<div class="quick_link">
		<div class="quick_link_content">
			<div class="store">
				<a href="/lubway/findStore.do"> <img alt="map"
					src="${path}/resources/images/main/icon_map.png" /> <strong>매장찾기</strong>
				</a>
			</div>
			<div class="franchise">
				<a href="/lubway/franchiseInquiry.do"> <img alt="franchise"
					src="${path}/resources/images/main/icon_franchise.png" /> <strong>가맹신청ㆍ문의</strong></a>
			</div>
		</div>
	</div>
	<!-- quick link 끝 -->
	<!-- 샌드위치 메뉴 슬라이더 -->
	<div class="subway_slider_menu_wrap">
		<h2>Lubway's Menu</h2>
		<input type="radio" name="tabmenu" id="m_classic" checked> <input
			type="radio" name="tabmenu" id="m_fresh"> <input type="radio"
			name="tabmenu" id="m_premium"> <input type="radio"
			name="tabmenu" id="m_morning">

		<div class="subway_slider_menu">
			<label for="m_classic">클래식</label> <label for="m_fresh">프레쉬&라이트</label>
			<label for="m_premium">프리미엄</label> <label for="m_morning">아침메뉴</label>
		</div>

		<div class="subway_slider_content cl">
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=cl06"> <img alt="에그마요"
						src="${path}/resources/images/menu/sandwich_cl06.jpg" /> <strong class="title">에그마요</strong>
						<p>
							친환경 인증 받은 농장에서 생산된 달걀과<br />고소한 마요네즈가 만나 더 부드러운<br />스테디셀러
						</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=cl01"> <img alt="이탈리안 비엠티"
						src="${path}/resources/images/menu/sandwich_cl01.jpg" /> <strong class="title">이탈리안
							비엠티</strong>
						<p>
							7시간 숙성된 페퍼로니, 살라미<br />그리고 햄이 만들어내는 최상의 조화!<br />전세계가 사랑하는 No.1
							베스트셀러!<br />Biggest Meatiest Tastiest, It's B.M.T.!
						</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=cl02"> <img alt="비엘티"
						src="${path}/resources/images/menu/sandwich_cl02.jpg" /> <strong class="title">비엘티</strong>
						<p>
							오리지널 아메리칸 베이컨의<br />풍미와 바삭함 그대로~
						</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=cl03"> <img alt="미트볼"
						src="${path}/resources/images/menu/sandwich_cl03.jpg" /> <strong class="title">미트볼</strong>
						<p>
							이탈리안 스타일 비프 미트볼에<br />러브웨이만의 풍부한 토마토 향이 살아있는<br />마리나라소스를 듬뿍
						</p>
					</a>
				</div>
			</div>
		</div>
		<div class="subway_slider_content fr">
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=fl01"> <img alt="로티세리 바비큐 치킨"
						src="${path}/resources/images/menu/sandwich_fl01.jpg" /> <strong class="title">로티세리
							바비큐 치킨</strong>
						<p>
							촉촉한 바비큐 치킨의 풍미가득.<br />손으로 찢어 더욱 부드러운 치킨의 혁명
						</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=fl02"> <img alt="로스트 치킨"
						src="${path}/resources/images/menu/sandwich_fl02.jpg" /> <strong class="title">로스트
							치킨</strong>
						<p>
							오븐에 구워 담백한 저칼로리<br />닭가슴살의 건강한 풍미
						</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=fl04"> <img alt="러브웨이 클럽"
						src="${path}/resources/images/menu/sandwich_fl04.jpg" /> <strong class="title">러브웨이
							클럽</strong>
						<p>
							명실공히 시그니처 러브!<br />터키, 비프, 포크 햄의 완벽한 앙상블
						</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=fl05"> <img alt="터키"
						src="${path}/resources/images/menu/sandwich_fl05.jpg" /> <strong class="title">터키</strong>
						<p>
							280kcal로 슬림하게 즐기는<br />오리지날 터키 샌드위치
						</p>
					</a>
				</div>
			</div>
		</div>
		<div class="subway_slider_content pe">
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=pm10"> <img alt="풀드포크"
						src="${path}/resources/images/menu/sandwich_pm08.jpg" /> <strong class="title">풀드포크</strong>
						<p>
							7시간 저온 훈연한 미국 정통 스타일의<br />리얼 바비큐 풀드포크는 오직 러브웨이에서
						</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=pm01"> <img alt="스테이크&amp;치즈"
						src="${path}/resources/images/menu/sandwich_pm01.jpg" /> <strong class="title">스테이크&amp;치즈</strong>
						<p>
							육즙이 쫙~<br />풍부한 비프 스테이크의 풍미가 입안 한가득
						</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=pm02"> <img alt="터키 베이컨 아보카도"
						src="${path}/resources/images/menu/sandwich_pm02.jpg" /> <strong class="title">터키
							베이컨 아보카도</strong>
						<p>
							담백한 터키와 바삭한 베이컨 환상조합에<br />부드러운 아보카도는 신의 한수
						</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=pm04"> <img alt="스파이시 이탈리안"
						src="${path}/resources/images/menu/sandwich_pm06.jpg" /> <strong class="title">스파이시
							이탈리안</strong>
						<p>
							살라미, 페퍼로니가 입안 한가득!<br />쏘 핫한 이탈리아의 맛
						</p>
					</a>
				</div>
			</div>
		</div>
		<div class="subway_slider_content mo">
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=bf01"> <img alt="햄, 에그&치즈"
						src="${path}/resources/images/menu/sandwich_bf01.jpg" /> <strong class="title">햄,
							에그&치즈</strong>
						<p>푹신한 오믈렛과 햄의 가장 클래식한 조화</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=bf02"> <img alt="웨스턴, 에그 & 치즈"
						src="${path}/resources/images/menu/sandwich_bf02.jpg" /> <strong class="title">웨스턴,
							에그 & 치즈</strong>
						<p>
							토마토, 피망, 양파 세가지 야채가 더해져<br />더욱 신선한 하루 시작
						</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=bf03"> <img alt="베이컨, 에그 & 치즈"
						src="${path}/resources/images/menu/sandwich_bf03.jpg" /> <strong class="title">베이컨,
							에그 & 치즈</strong>
						<p>
							오리지널 아메리칸 베이컨으로<br />더욱 풍성한 아침 식사
						</p>
					</a>
				</div>
			</div>
			<div class="wrap">
				<div class="best_menu">
					<a href="/sandwichView?param=bf04"> <img alt="스테이크, 에그 & 치즈"
						src="${path}/resources/images/menu/sandwich_bf04.jpg" /> <strong class="title">스테이크,
							에그 & 치즈</strong>
						<p>
							육즙 가득 비프 스테이크로<br />든든한 아침 식사
						</p>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 샌드위치 메뉴 슬라이더 끝 -->
	<!-- 서브웨이 섹션 -->
	<div class="section_subway">
		<!-- content top -->
		<div class="content_top">
			<!-- 이용방법 -->
			<div class="utilization">
				<p>
					러브웨이를<br />제대로 즐기는 방법!
				</p>
				<a class="btn" href="/utilizationSubway"><span>이용방법</span></a>
			</div>
			<!--// 이용방법 -->

			<!-- 러브웨이 역사 -->
			<div class="history">
				<p>
					50년 역사를 가진<br />No.1 프랜차이즈의 성장기
				</p>
				<a class="btn" href="/subwayHistory"><span>러브웨이 역사</span></a> <img
					src="${path}/resources/images/main/img_subway_history.png" />
			</div>
			<!--// 러브웨이 역사 -->
		</div>
		<!--// content top -->

		<!-- content bottom -->
		<div class="content_bottom">
			<!-- whats new -->
			<div class="whats_new">
				<div class="hd">
					<h2>What's New</h2>
					<p>
						러브웨이의 다양한 소식을<br /> 빠르게 전달해드립니다.
					</p>
				</div>
				<div class="board_list">
					<ul>
						<li><a href="#" onclick="view.noticeView(this);return false;"
							data-idx="243">러브웨이 고객센터 2021년 설 연휴 휴무 안내</a></li>
						<li><a href="#" onclick="view.noticeView(this);return false;"
							data-idx="242">2021년 설날 당일 매장 영업 안내 </a></li>
						<li><a href="#" onclick="view.noticeView(this);return false;"
							data-idx="241">러브웨이와 함께하는 JTBC &#39;라이브온&#39;</a></li>
					</ul>
					<a class="more" href="/newsList">more</a>
				</div>
			</div>
			<!--// whats new -->

			<!-- banner sponsor -->
			<div class="banner_sponsor">
				<div class="mini_banner">
					<div>
						<img alt="SUBWAY BI 우하단 배너 (★상시 / SSL만료일도 이날임)"
							src="${path}/resources/upload/banner/subway_logo_bn_20200602031229667.png" />
					</div>
				</div>
			</div>
			<!--// banner sponsor -->
		</div>
		<!--// content bottom -->
	</div>
	<div class="quick_menu">
		<ul>
			<li class="qm01"><a href="/franchise">
					<div class="icon"></div> <strong>프랜차이즈</strong> <span>개설절차/투자비용
						정보</span>
			</a></li>
			<li class="qm02"><a href="/franchiseBranchGuide">
					<div class="icon"></div> <strong>지사안내</strong> <span>수도권/지방
						지사정보</span>
			</a></li>
			<li class="qm03"><a href="/lubway/video.do">
					<div class="icon"></div> <strong>광고영상</strong> <span>TV광고/동영상</span>
			</a></li>
			<li class="qm04"><a href="/qna">
					<div class="icon"></div> <strong>1:1 문의</strong> <span>개선/문의사항</span>
			</a></li>
		</ul>
	</div>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>

	
</body>
</html>