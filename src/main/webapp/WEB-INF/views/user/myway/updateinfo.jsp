<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<title>개인 정보 수정</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<div class="bg_gray" id="container">
		<!-- sub content s -->
		<div id="content">
			<!-- 내정보관리 > 정보변경 -->
			<div class="manage_wrapper">
				<h2 class="subTitle_02">정보변경</h2>
				<div class="manage_cont_box">
					<section class="form_box">
						<div class="write_info_wrap">
							<div class="write_info_wrap">
								<h2>회원가입 정보</h2>
								<div class="input_set">
									<dl class="info_dl">
										<dt>이름</dt>
										<dd>${user.name }</dd>
									</dl>
									<dl class="info_dl">
										<dt>이메일 주소</dt>
										<dd>${user.id }</dd>
									</dl>
									<dl class="info_dl">
										<dt>휴대전화</dt>
										<dd>${user.tel }</dd>
									</dl>
								</div>
								<div class="input_set">
									<dl>
										<dt>비밀번호</dt>
										<dd>
											<div class="pass_num_wrap">
												<span class="form_text">
												<input name="Changepass" type="password" placeholder="변경할 비밀번호를 입력하세요" />
												</span>
											</div>
											<div class="btn_input_in">
												<button class="in_form_btn cpNoChange" id="checkBtn" type="button">
													<span>비밀번호 변경</span>
												</button>
											</div>

										</dd>
									</dl>
								</div>
								<h2>추가 정보 입력</h2>
								<div class="input_set">
									<dl>
										<dt>마케팅 동의</dt>
										<dd>
											<div class="marketing_agree_box">
												<label class="form_checkbox">
												<input class="sns-value cd-value" id="sms_recep" name="sms_recep" type="checkbox" />
													<span class="icon"></span>
													<span>SMS/LMS/MMS 수신 동의</span>
												</label> <label class="form_checkbox">
												<input class="sns-value cd-value" id="email_recep" name="email_recep" type="checkbox" />
													<span class="icon"></span>
													<span>E-mail 수신 동의</span>
												</label>
											</div>
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</section>

					<div class="btn_area">
						<a class="btn bgc_white" href="javascript:void(0);" id="withdrawal" style="width: 126px;"><span>회원탈퇴</span></a>
						<a class="btn bgc_point " href="javascript:void(0);" id="modInfo" style="width: 197px;"><span>회원정보 변경</span></a>
					</div>
				</div>
			</div>
			<!--// 내정보관리 > 정보변경 -->
		</div>
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>