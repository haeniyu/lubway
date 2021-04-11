<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LUBWAY - 샌드위치</title>
<link rel="stylesheet" href="resources/css/step01.css">
<link rel="stylesheet" href="resources/css/menu.css">
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script type="text/javascript">
function menuDetail(code) {
	var form = document.getElementById('form');
	
	var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "code");
    hiddenField.setAttribute("value", code);
    form.appendChild(hiddenField);
	
	form.submit();
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
<form action="menuDetail.do" method="post" id="form">
	<div id="wrap">
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
							<li class="active"><a href="/menuSandwich.do">샌드위치</a></li>
							<li><a href="/menuWrap.do">랩ㆍ기타</a></li>
							<li><a href="/menuSalad.do">찹샐러드</a></li>
							<li><a href="/menuMorning.do">아침메뉴</a></li>
							<li><a href="/menuSmileWay.do">스마일 웨이</a></li>
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
					<div class="visual sandwich">
						<h2>Sandwich</h2>
						<p>
							전세계 넘버원 브랜드 Subway!<br /> 50년 전통의 세계 최고의 샌드위치를 맛보세요!
						</p>
						<div class="img01"></div>
					</div>
					<!--// 상품 visual -->
					<div class="pd_tab"></div>

					<!-- 상품목록 -->
					<div class="pd_list_wrapper">
						<ul>
							<c:forEach var="list" items="${list}" varStatus="status">
								<li>
									<div class="img">
										<img alt="${list.name}" src="${list.filePath}" />
									</div>
									<strong class="tit">${list.name}</strong>
									<span class="eng">${list.engname}</span>
									<span class="cal">${calList[status.index]} kcal</span>
									<div class="summary">
										<p>${list.content}</p>
									</div>
									<a onclick="javascript:menuDetail('${list.code}');" class="btn_view" href="#"></a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!--// 상품목록 -->
				</div>
				<!--// 메뉴소개 e -->
			</div>
			<!--// sub content e -->
		</div>
	</div>
	<input type="hidden" name="select" value="${select}">
</form>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>