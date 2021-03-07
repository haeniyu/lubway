<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 인증</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step02.css" />
<script type="text/javascript" src="${path}/resources/js/step02.js?v=1"></script>
</head>
<body>
	<!-- container s -->
	<div class="bg_type01" id="container">
		<!-- sub content -->
		<div id="content">
			<!-- 멤버십가입 -->
			<div class="joining_wrapper">
				<h2 class="subTitle_02">회원가입</h2>
				<h3 class="step_tit">
					<span>Step2.</span> 번호 인증
				</h3>
				<!-- step_cont_box -->
				<div class="step_cont_box">
					<!-- step03_cont -->
					<div class="step03_cont">
						<form action="#" method="post" class="form_box" name="certForm">
							<div class="write_info_wrap">
								<div class="input_set">
									<dl>
										<dt>
											휴대폰 번호<span class="ess"></span>
										</dt>
										<dd>
											<span class="form_text" style="width: 155px"> <input
												class="required-value" id="#" name="phone"
												placeholder="번호 입력" type="text" />
											</span>
											<div class="btn_input_in">
												<input class="required-val" id="#" type="hidden" value="N" />
												<a class="in_form_btn" href="javascript:void(0);" id="pop"
													onclick="phoneCheck()"><span>전송</span></a>
											</div>
										</dd>
									</dl>
									<dl>
										<dt>
											인증 번호<span class="ess"></span>
										</dt>
										<dd>
											<span class="form_text" style="width: 155px"> <input
												class="required-value" id="#" name="code"
												placeholder="인증번호 입력" type="text" />
											</span>
											<div class="btn_input_in">
												<input class="required-val" id="#" type="hidden" value="N" />
												<a class="in_form_btn" href="javascript:void(0);" id="pop"
													onclick="phoneCheck()"><span>확인</span></a>
											</div>
										</dd>
									</dl>
								</div>

								<!--// step03_cont -->
								<div class="btn_area">
									<a class="btn bgc_point i_reg" href="javascript:void(0);"
										id="submitBtn" style="width: 170px;"><span>인증 완료</span></a>
								</div>
							</div>
						</form>
						<!--// step_cont_box -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>