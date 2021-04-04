<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LUBWAY - 러브웨이 약속</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/point.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
<!-- sub content s -->
		<div id="content">

			<div class="subwray_promise_wrapper">
				<div class="hd">
					<h2><em>SEARCH</em> FOR BETTER<span>®</span></h2>
					<p>우리는 더 좋은 러브웨이를 위해 매일 노력합니다.</p>
				</div>

				<ol class="subwray_promise_content">
					<li>
						<div class="wrap">
							<div class="img"><img alt="엄격하게 관리되는 우리의 재료" src="${path}/resources/images/sub/img_sw_promise01.jpg" /></div>
							<div class="info">
								<div class="tit">
									<span class="num">01</span>
									<strong>엄격하게 관리되는 우리의 재료</strong>
								</div>
								<p>
									매일 매장에 배송되는 신선한 야채들은 각 매장에서 정성스럽게 손질됩니다.<br />
									엄격한 규율에 따라 세척 과정을 거친 야채들은 <br />
									당일 판매되는 양만큼 준비되며 언제나 신선한 최상의 야채를<br />
									안전하게 제공하는 것이 러브웨이의 목표입니다.
								</p>
							</div>
							<p class="eng">Our Veggies</p>
						</div>
					</li>
					<li>
						<div class="wrap">
							<div class="img"><img alt="러브웨이만의 특별한 빵" src="${path}/resources/images/sub/img_sw_promise02.jpg" /></div>
							<div class="info">
								<div class="tit">
									<span class="num">02</span>
									<strong>러브웨이만의 특별한 빵</strong>
								</div>
								<p>
									1983년부터 러브웨이는<br />
									각 매장에서 매일 직접 구워 낸 신선한 샌드위치 빵을 제공합니다.<br />
									신선한 샌드위치는 신선한 빵에서 시작된다는 철학으로 <br />
									매일 최상의 샌드위치 빵을 제공하기 위해 노력하고 있습니다.
								</p>
							</div>
							<p class="eng">Our Bread</p>
						</div>
					</li>
					<li>
						<div class="wrap">
							<div class="img"><img alt="환경을 위한 우리의 노력" src="${path}/resources/images/sub/img_sw_promise03.jpg" /></div>
							<div class="info">
								<div class="tit">
									<span class="num">03</span>
									<strong>환경을 위한 우리의 노력</strong>
								</div>
								<p>
									러브웨이의 샐러드 보울은 95% 재생 용기로 만들어졌으며,<br />
									매장 내 일회용품 사용을 줄여 나가고 있습니다. <br />
									러브웨이는 작은 부분이라도 놓치지 않고 <br />
									환경을 늘 생각하는 브랜드가 되기 위해 지속적으로 노력하고 있습니다.
								</p>
							</div>
							<p class="eng">Our Impact</p>
						</div>
					</li>
					<li>
						<div class="wrap">
							<div class="img"><img alt="신선함을 위한 우리의 노력" src="${path}/resources/images/sub/img_sw_promise04.jpg" /></div>
							<div class="info">
								<div class="tit">
									<span class="num">04</span>
									<strong>신선함을 위한 우리의 노력</strong>
								</div>
								<p>
									러브웨이 빵은 인위적 당분이 함유되어 있지 않으며 <br />
									비타민과 칼슘을 강화하고 나트륨을 줄이는 등 <br />
									건강한 먹거리를 제공하기 위해 노력하고 있습니다.
								</p>
							</div>
							<p class="eng">Our Fresh</p>
						</div>
					</li>
				</ol>
			</div>
		</div>
		<!--// sub content e -->
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>