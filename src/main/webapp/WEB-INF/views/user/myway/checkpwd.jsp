<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY-WAY > 비밀번호 확인</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>	
<script type="text/javascript">
$(document).ready(function() {
	var checkPassword = false;
	
	$("#submitBtn").on("click", function() {
		var inputPwd = $("#pw").val().trim();
		
		var form = document.createElement("form");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "/lubway/checkpwdproc.do");
		
		//사용자가 입력한 비밀번호 값 저장
		var passField = document.createElement("input");
		passField.setAttribute("type", "hidden");
		passField.setAttribute("name", "pw");
	    passField.setAttribute("value", inputPwd);
	    
	    form.appendChild(passField);
	    document.body.appendChild(form);
	    form.submit();
		
	});
	
});	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<!-- container s -->
	<div class="bg_gray" id="container">
		<!-- sub content s -->
		<div id="content">
			<!-- 내정보관리 > 비밀번호 확인 -->
			<div class="manage_wrapper pw_manage">
				<h2 class="subTitle_02">비밀번호 확인</h2>
				<p class="tit_sub_copy">회원가입 시 등록한 비밀번호를 재입력 해주세요.</p>

				<div class="manage_cont_box">
					<section class="form_box">
						<div class="write_info_wrap">
							<!-- 입력1세트 -->
							<div class="input_set">
								<dl>
									<dt>
										이메일 주소<span class="ess"></span>
									</dt>
									<dd>
										<span class="form_text" style="width: 500px"> <input
											readonly="" type="text" value="${user.id }" />
										</span>
									</dd>
								</dl>
							</div>
							<!--// 입력1세트 -->
							<div class="input_set">
								<dl>
									<dt>
										비밀번호<span class="ess"></span>
									</dt>
									<dd>
										<span class="form_text"> <input class="chk-value"
											id="pw" name="password" placeholder="비밀번호 입력" type="password" />
										</span>
									</dd>
								</dl>
							</div>
						</div>
					</section>
					<div class="inquiry_notice">
						<ul>
							<li>개인정보 보호를 위해 주기적으로 비밀번호를 변경해 주시고, 타인에게 비밀번호가 노출되지 않도록 주의해
								주세요.</li>
						</ul>
					</div>
					<div class="btn_area square bt_bottom_fix">
						<a class="btn bgc_point" href="javascript:void(0);" id="submitBtn"
							style="width: 170px;"><span>확인</span></a>
					</div>
				</div>
			</div>
			<!--// 내정보관리 > 비밀번호 확인 -->
		</div>
		<!--// sub content e -->
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>