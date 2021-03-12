<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<meta charset='utf-8'>
<title>LUBWAY 러브웨이</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/footer.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>  
<script type="text/javascript">
$(function(){
	var $firstMenu = $('nav > ul > li ');
	
	$firstMenu.mouseenter(function(){
		$('#gnb').stop().animate({height:'350px'});
	})
	.mouseleave(function(){
		$('#gnb').stop().animate({height:'85px'});
	});
	
});
</script>
</head>

<body>
	<div class="header">
		<div class="content">
			<div class="logo">
				<a href="main.do"><img alt="LUBWAY" src="${path}/resources/images/logo_w.png" /></a>
			</div>
			<c:if test="${user != null}">
				<ul class="login">
					<li class="before_sign"><a href="logout.do">로그아웃</a></li>
					<li class="before_sign"><a href="myway.do">MY-WAY</a></li>
	
					<li class="icon_menu global_subway"><a
						href="http://www.subway.com/en-us/exploreourworld" target="_blank"
						title="Global Subway"><span class="blind"><img
								alt="Global Subway" src="${path}/resources/images/icon_utill_global.png" /></span></a></li>
				</ul>
			</c:if>
			<c:if test="${user == null}">
				<ul class="login">
					<li class="before_sign"><a href="login.do">로그인</a></li>
					<li class="before_sign"><a href="step01.do">회원가입</a></li>
	
					<li class="icon_menu global_subway"><a
						href="http://www.subway.com/en-us/exploreourworld" target="_blank"
						title="Global Subway"><span class="blind"><img
								alt="Global Subway" src="${path}/resources/images/icon_utill_global.png" /></span></a></li>
				</ul>
			</c:if>
			<!-- gnb -->
			<nav id="gnb">
				<ul id="gnb">
					<li><a class="dp1" href="#none">메뉴소개</a>
						<ul>
							<li><a href="/sandwichList">샌드위치</a></li>
							<li><a href="/wrapList">랩ㆍ기타</a></li>
							<li><a href="/saladList">찹샐러드</a></li>
							<li><a href="/morningList">아침메뉴</a></li>
							<li><a href="/sideDrink">스마일 썹</a></li>
						</ul></li>
					<li><a href="/utilizationSubway" class="dp1">이용방법</a></li>
					<li><a href="#none" class="dp1">새소식</a>
						<div class="dp2">
							<ul>
								<li><a href="/eventList">이벤트ㆍ프로모션</a></li>
								<li><a href="/newsList">뉴스ㆍ공지사항</a></li>
								<li><a href="/tvCommercial">광고영상</a></li>
							</ul>
						</div></li>
					<li><a href="#none" class="dp1">써브웨이</a>
						<div class="dp2">
							<ul>
								<li><a href="/subwayHistory">써브웨이 역사</a></li>
								<li><a href="/subwayPromise">써브웨이 약속</a></li>
								<li style="display: none;"><a href="#">써브웨이 사회공헌</a></li>
								<li><a href="/storeSearch">매장찾기</a></li>
							</ul>
						</div></li>
					<li><a href="#none" class="dp1">가맹점</a>
						<div class="dp2">
							<ul>
								<li><a href="/franchise">써브웨이 프랜차이즈</a></li>
								<li><a href="/franchiseFaq">가맹관련 FAQ</a></li>
								<li><a href="/franchiseInquiry">가맹신청ㆍ문의</a></li>
							</ul>
						</div></li>
					<li><a class="dp1" href="javascript:void(0);">온라인 주문</a>
						<div class="dp2">
							<ul>
								<li><a href="/order/view/fast/near/store">FAST-SUB</a></li>
								<li><a href="/order/view/home/step1">HOME-SUB</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
			<!-- gnb 끝 -->
		</div>
	</div>
</body>
</html>