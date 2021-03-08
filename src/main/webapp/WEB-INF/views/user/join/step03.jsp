<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step03.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/step03.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<!-- container s -->
	<div class="bg_type01" id="container">
		<!-- sub content -->
		<div id="content">
			<!-- 멤버십가입 -->
			<div class="joining_wrapper">
				<h2 class="subTitle_02">회원가입</h2>
				<h3 class="step_tit">
					<span>Step3.</span> 정보입력
				</h3>
				<!-- step_cont_box -->
				<div class="step_cont_box">
					<!-- step03_cont -->
					<div class="step03_cont">
						<section class="form_box">
							<input id="mbrYn" name="mbrYn" type="hidden" /> <input
								id="mbrLgnId" name="mbrLgnId" type="hidden" />

							<h2>기본 정보 (필수 입력)</h2>
							<div class="write_info_wrap">
								<div class="input_set">
									<dl>
										<dt>
											아이디(이메일)<span class="ess"></span>
										</dt>
										<dd>
											<span class="form_text" style="width: 155px"> <input
												class="required-value" id="mbrLgnId1" name="mbrLgnId1"
												placeholder="이메일 아이디 입력" type="text" />
											</span> @ <span class="form_text" style="width: 155px"> <input
												class="required-value" id="mbrLgnId2" name="mbrLgnId2"
												placeholder="이메일 도메인 입력" type="text" />
											</span> <span class="form_select" style="width: 155px"> <select
												id="mbrLgnId3" name="mbrLgnId3">
													<option value="">직접 입력</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="gmail.com">gmail.com</option>
													<option value="icloud.com">icloud.com</option>
													<option value="nate.com">nate.com</option>
											</select>
											</span>
											<div class="btn_input_in">
												<input class="required-val" id="duplicationYn-mbrLgnId"
													type="hidden" value="N" /> <a class="in_form_btn"
													href="javascript:void(0);" id="pop"
													onclick="view.checkId('N');return false;"><span>중복확인</span></a>
											</div>
											<span class="pw_check miss" id="worng-msg-email"
												style="display: none;">이메일 주소를 입력해주세요.</span>
										</dd>
									</dl>
								</div>
								<div class="input_set input_name_div">
									<dl>
										<dt>
											이름<span class="ess"></span>
										</dt>
										<dd>
											<span class="form_text" style="width: 235px"> <input
												class="required-value input_name" id="inname" name="inname"
												placeholder="이름 입력" type="text" /><span class="pw_check miss worng-msg-id" id="idMsg"></span>
											</span>
										</dd>
									</dl>
								</div>
								<div class="input_set input_pw_div">
									<dl>
										<dt>
											비밀번호<span class="ess"></span>
										</dt>
										<dd>
											<span class="form_text" style="width: 235px"> <input
												class="required-value input_pw" id="pw" name="pw"
												placeholder="비밀번호 입력" type="password" />
											</span> <span class="pw_check miss worng-msg-pw" id="pwdMsg1"></span>
										</dd>
									</dl>
								</div>
								<div class="input_set input_pw_div">
									<dl>
										<dt>
											비밀번호 확인<span class="ess"></span>
										</dt>
										<dd>
											<span class="form_text" style="width: 235px"> 
												<input class="required-value input_pw" id="subPw"
												name="subPw" placeholder="비밀번호 입력" type="password" /> 
											</span> <span class="pw_check miss worng-msg-pw" id="pwdMsg2"></span>
										</dd>
									</dl>
								</div>
								<div class="input_set input_pw_div">
									<dl>
										<dt>
											전화번호<span class="ess"></span>
										</dt>
										<dd>
											<span class="form_text" style="width: 235px"> 여기에 전화번호가 뜹니다 </span> 
										</dd>
									</dl>
								</div>
							</div>
						</section>
					</div>
				</div>
				<!--// step03_cont -->
				<div class="btn_area">
					<a class="btn bgc_point i_reg" onclick="joinform_check();"
						id="submitBtn" style="width: 170px;"><span>회원가입 완료</span></a>
				</div>
			</div>
			<!--// step_cont_box -->
		</div>
		<!--// 멤버십가입 -->
	</div>
	<!--// sub content -->
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>