<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 인증</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step03.css?v=1" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//인증 받았는지 확인하는 변수
		var check = false;
		
		//전송 버튼 눌렀을 때
		$("#sendBtn").on("click", function() {
				var phoneNum = $('#phoneNum').val();
				if (phoneNum != '') {					
					$.ajax({
						url : '/lubway/sendSms.do?tell=' + phoneNum,
						type : 'post',
						success : function(data) {
							$("#codeNum").val(data);
							$("#checkBtn").on("click", function() {
								if($("#codeNum").val() == data) {
									alert("인증에 성공하였습니다.");
									check = true;
								}
							});
						},
						error : function(data) {
							alert("인증에 실패하였습니다.");
							check = false;
						}
					});
				}
		});
		
		//인증 완료 버튼 눌렀을 때
		$("#submitBtn").on("click",function(){
			if(check){
				console.log("다음페이지로 가자");
				document.location.href="step03.do";
			}else
				alert("인증을 진행해주세요.");
		});
		
		
	});
</script>
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
					<span>Step2.</span> 번호 인증
				</h3>
				<!-- step_cont_box -->
				<div class="step_cont_box">
					<!-- step03_cont -->
					<div class="step03_cont">
						<form action="step03.do" method="post" class="form_box" id="certForm">
							<div class="write_info_wrap">
								<div class="input_set">
									<dl>
										<dt>
											휴대폰 번호<span class="ess"></span>
										</dt>
										<dd>
											<span class="form_text" style="width: 155px"> <input
												class="required-value" id="phoneNum" name="tel"
												placeholder="번호 입력" type="text" />
											</span>
											<div class="btn_input_in">
												
												<a class="in_form_btn" href="javascript:void(0);" id="sendBtn"
													><span>전송</span></a>
											</div>
										</dd>
									</dl>
									<dl>
										<dt>
											인증 번호<span class="ess"></span>
										</dt>
										<dd>
											<span class="form_text" style="width: 155px"> <input
												class="required-value" id="codeNum" 
												placeholder="인증번호 입력" type="text" />
											</span>
											<div class="btn_input_in">
			
												<a class="in_form_btn" href="javascript:void(0);" id="checkBtn"
													><span>확인</span></a>
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
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>