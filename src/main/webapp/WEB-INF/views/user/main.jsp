<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css?v=1" />
<link rel="stylesheet" type="text/css" href="${path}/resources/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/slick/slick-theme.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
function menuDetail(code) {
	if($("#m_morning").is(":checked") == true){		
		var select = '${select1}';
	} else {
		var select = '${select}';
	}
	
	var form = document.createElement('form');
	form.setAttribute("method", "post");
	form.setAttribute("action", "menuDetail.do");
	
	var hiddenField_code = document.createElement("input");
    hiddenField_code.setAttribute("type", "hidden");
    hiddenField_code.setAttribute("name", "code");
    hiddenField_code.setAttribute("value", code);
    
    var hiddenField_select = document.createElement("input");
    hiddenField_select.setAttribute("type", "hidden");
    hiddenField_select.setAttribute("name", "select");
    hiddenField_select.setAttribute("value", select);
    
    form.appendChild(hiddenField_code);
    form.appendChild(hiddenField_select);
    document.body.appendChild(form);
    
	form.submit();
}
</script>
<title>LUBWAY 러브웨이</title>
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
		<input type="radio" name="tabmenu" id="m_classic" checked> 
		<input type="radio" name="tabmenu" id="m_fresh"> 
		<input type="radio" name="tabmenu" id="m_premium"> 
		<input type="radio" name="tabmenu" id="m_morning">

		<div class="subway_slider_menu">
			<label for="m_classic">클래식</label> <label for="m_fresh">프레쉬&라이트</label>
			<label for="m_premium">프리미엄</label> <label for="m_morning">아침메뉴</label>
		</div>

		<div class="subway_slider_content cl">
		<c:forEach items="${list1}" var="list">
			<c:if test="${list.name eq '에그마요' or list.name eq '이탈리안 비엠티' or list.name eq '비엘티' or list.name eq '미트볼' }">
			<div class="wrap">
				<div class="best_menu">
					<a href="#" onclick="javascript:menuDetail('${list.code}');"> <img alt="${list.name}"
						src="${list.filePath}" /> <strong class="title">${list.name}</strong>
						<p>
							${list.content}
						</p>
					</a>
				</div>
			</div>
			</c:if>
		</c:forEach>
		</div>
		<div class="subway_slider_content fr">
			<c:forEach items="${list1}" var="list">
			<c:if test="${list.name eq '로티세리 바비큐 치킨' or list.name eq '로스트 치킨' or list.name eq '러브웨이 클럽' or list.name eq '터키' }">
			<div class="wrap">
				<div class="best_menu">
					<a href="#" onclick="javascript:menuDetail('${list.code}');"> <img alt="${list.name}"
						src="${list.filePath}" /> <strong class="title">${list.name}</strong>
						<p>
							${list.content}
						</p>
					</a>
				</div>
			</div>
			</c:if>
		</c:forEach>
		</div>
		<div class="subway_slider_content pe">
			<c:forEach items="${list1}" var="list">
			<c:if test="${list.name eq '러브웨이 멜트' or list.name eq '스파이시 이탈리안' or list.name eq '치킨 데리야끼'}">
			<div class="wrap">
				<div class="best_menu">
					<a href="#" onclick="javascript:menuDetail('${list.code}');"> <img alt="${list.name}"
						src="${list.filePath}" /> <strong class="title">${list.name}</strong>
						<p>
							${list.content}
						</p>
					</a>
				</div>
			</div>
			</c:if>
		</c:forEach>
		</div>
		<div class="subway_slider_content mo">
			<c:forEach items="${list2}" var="list">
			<c:if test="${list.name eq '햄, 에그&치즈' or list.name eq '웨스턴, 에그 & 치즈' or list.name eq '베이컨, 에그 & 치즈' or list.name eq '스테이크, 에그 & 치즈 ' }">
			<div class="wrap">
				<div class="best_menu">
					<a class="morning" href="#" onclick="javascript:menuDetail('${list.code}');"> <img alt="${list.name}"
						src="${list.filePath}" /> <strong class="title">${list.name}</strong>
						<p>
							${list.content}
						</p>
					</a>
				</div>
			</div>
			</c:if>
		</c:forEach>
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
				<a class="btn" href="/lubway/howtouse.do"><span>이용방법</span></a>
			</div>
			<!--// 이용방법 -->

			<!-- 러브웨이 역사 -->
			<div class="history">
				<p>
					50년 역사를 가진<br />No.1 프랜차이즈의 성장기
				</p>
				<a class="btn" href="/lubway/history.do"><span>러브웨이 역사</span></a> <img
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
						<c:forEach items="${UserPageList}" var="pageList" begin="1" end="3">
						<li><a type="hidden" href="getUserNotice.do?no=${pageList.no}">${pageList.title}</a></li>
						</c:forEach>
					</ul>
					<a class="more" href="/lubway/getUserNoticeList.do">more</a>
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
			<li class="qm01"><a href="/lubway/franchise.do">
					<div class="icon"></div> <strong>프랜차이즈</strong> <span>개설절차/투자비용
						정보</span>
			</a></li>
			<li class="qm02"><a href="/lubway/findStore.do">
					<div class="icon"></div> <strong>매장찾기</strong> <span>수도권
						지사정보</span>
			</a></li>
			<li class="qm03"><a href="/lubway/video.do">
					<div class="icon"></div> <strong>광고영상</strong> <span>TV광고/동영상</span>
			</a></li>
			<li class="qm04"><a href="/lubway/franchiseInquiry.do">
					<div class="icon"></div> <strong>가맹문의</strong> <span>가맹/신청문의</span>
			</a></li>
		</ul>
	</div>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>

	
</body>
</html>