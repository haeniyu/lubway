<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Point</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/point.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<!-- sub content s -->
	<div id="content">
		<!-- 멤버십 > 포인트현황 -->
		<div class="membership">
			<h2 class="subTitle">포인트 현황</h2>
			<div class="tab02">
				<ul>
					<li class="active" id="mypoint">포인트 현황</li>
				</ul>
			</div>
			<section class="tab_content" style="background-color:white;">
				<div class="point_status">
					<div class="level_copy">
						<h3>
							<span>${user.name }</span>님의 포인트 현황입니다.
						</h3>
					</div>

					<section class="form_box">
						<div class="write_info_wrap">
							<div class="input_set">
								<dl class="info_dl">
									<dt>보유 포인트</dt>
									<dd>
										<p class="txt_point">
											<span>${user.point }</span>P
										</p>
									</dd>
								</dl>
							</div>
						</div>
					</section>
					<div class="inquiry_notice">
						<ul>
							<li>포인트 적립 오류시 : 오류 발생 후 30일 이내에 회사 또는 매장에 보정을 신청하실 수 있습니다.
								보정 신청 시에는 영수증을 제출하셔야 합니다.</li>
						</ul>
					</div>
				</div>
			</section>

		</div>
		<!--// 멤버십 > 포인트현황 -->
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>