<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입완료</title>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/joining.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />

</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<div class="bg_type01" id="container">
		<div id="content">
			<div class="joining_wrapper">
				<h2 class="subTitle_02">회원가입</h2>
				<h3 class="step_tit">
					<span>Step4.</span> 가입완료
				</h3>
				<div class="step_cont_box">
					<div class="step04_cont">
						<h3 class="cont_tit">
							러브웨이에 가족이 되신 것을<br> 환영합니다.
						</h3>
						<ul class="order_gobtn">
							<li class="fast"><a href="login.do"> <strong>FAST-WAY</strong>
									<i class="icon"></i>
									<p class="txt">
										온라인 주문 후 매장에서<br> 픽업/시식하는 서비스입니다.
									</p>
							</a></li>
							<li class="home"><a href="login.do"> <strong>HOME-WAY</strong>
									<i class="icon"></i>
									<p class="txt">
										온라인 주문 시 배달되는<br> 서비스입니다.
									</p>
							</a></li>
						</ul>
					</div>
					<div class="btn_area">
						<a class="btn bgc_point i_reg" href="main.do" style="width: 170px;">
							<span>홈으로</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>