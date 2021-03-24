<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LUBWAY - 찹샐러드</title>
<link rel="stylesheet" href="resources/css/step01.css">
<link rel="stylesheet" href="resources/css/menu.css">
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
							<li><a href="/lubway/menuSandwich.do">샌드위치</a></li>
							<li><a href="/lubway/menuWrap.do">랩ㆍ기타</a></li>
							<li class="active"><a href="/lubway/menuSalad.do">찹샐러드</a></li>
							<li><a href="/lubway/menuMorning.do">아침메뉴</a></li>
							<li><a href="/lubway/menuSmileWay.do">스마일 웨이</a></li>
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
					<div class="visual salad">
						<h2>Chopped Salad</h2>
						<p>
							양은 더 많이! 칼로리는 더 적게! <br /> 신선한 야채와 다양한 소스로 가볍게 찹샐러드를 즐겨보세요!
						</p>
						<div class="img01"></div>
						<div class="img02"></div>
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
