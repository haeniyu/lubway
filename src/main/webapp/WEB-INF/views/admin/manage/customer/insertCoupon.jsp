<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 > 쿠폰</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	function setDate() {
		var start = $("#start").val();
		var end = $("#end").val();

		var openField = document.createElement("input");
		openField.setAttribute("type", "hidden");
		openField.setAttribute("name", "start");
		openField.setAttribute("value", start);

		var closeField = document.createElement("input");
		closeField.setAttribute("type", "hidden");
		closeField.setAttribute("name", "end");
		closeField.setAttribute("value", end);

		document.form.appendChild(openField);
		document.form.appendChild(closeField);
		document.form.submit();
	}

});//end of document ready

	// 쿠폰코드 유효성 검사를 위한 데이터 설정
	var list = new Array();
	<c:forEach items="${couponList}" var="coupon">
		list.push("${coupon.code}");
	</c:forEach>

	//쿠폰 등록 유효성 검사
	function validate(){
		
		var code = $("#code").val().trim();
		var flag = true;
		
		for(var i=0; i<list.length; i++){
			if(list[i]==code){
				alert("이미 존재하는 쿠폰코드입니다.");
				flag = false;
				return;
			}
		}
		
		if(code==''){
			alert("쿠폰 코드를 입력해 주세요.");
			flag = false;
			return;
		}
		
		if($("#name").val()==''){
			alert("쿠폰 이름을 입력해 주세요.");
			flag = false;
			return;
		}
		
		if($("#dc").val()==''){
			alert("할인율을 입력해 주세요.");
			flag = false;
			return;
		}
		
		var regexp = /^[0-9]*$/;
		if(!regexp.test($("#dc").val())){ 
			alert("숫자만 입력해 주세요.");
			flag = false;
			return;
		}
		
		if($(":radio[name='type']:checked").length < 1){
			alert("쿠폰 사용처를 선택해주세요.");
			flag=false;
			return;
		}
		
		if($("#start").val()=='' || $("#end").val()==''){
			alert("쿠폰 사용 기간을 입력해 주세요.");
			flag = false;
			return;
		}
		
		if(flag) $("#insertForm").submit();
		
	}
</script>
<style type="text/css">
*{
	list-style: none;
}

li{
	padding: 5px;
}
</style>
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<form action="/insertedCoupon.mdo" method="post" id="insertForm">
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">쿠폰 관리</h1>
			<br>
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-warning">Coupon List</h6>
				</div>
				<div class="card-body">
					<!-- 전체 frame -->
					<ul>
						<!-- 쿠폰 코드 -->
						<li class="code">
							<div>
								<div class="index">쿠폰 코드</div>
								<input type="text" name="code" id="code" required/>
							</div>
						</li>
						<!-- 쿠폰 이름 -->
						<li class="name">
							<div>
								<div class="index">쿠폰 이름</div>
								<input class="title_text" type="text" name="name" id="name" />
							</div>
						</li>
						<!-- 쿠폰 할인율 -->
						<li class="dc">
							<div>
								<div class="index">쿠폰 할인율</div>
								<input type="text" name="dc" id="dc"/>&nbsp;%
							</div>
						</li>
						<!-- 쿠폰 사용 방식 -->
						<li class="type">
							<div>
								<div class="index">쿠폰 사용처 [HOME/FAST]</div>
								<input type="radio" name="type" id="home" value="home" required/> HOME&nbsp;&nbsp;
								<input type="radio" name="type" id="fast" value="fast" required/> FAST&nbsp;&nbsp;
								<input type="radio" name="type" id="all" value="all" required/> ALL
							</div>
						</li>
						<!-- 기간 -->
						<li class="term">
							<div class="index">쿠폰 사용 기간</div>
							시작 : <input type="date" name="start" id="start" required> ~ 종료 : <input type="date" id="end" name="end" required>
						</li>
					</ul>
					<div align="center">
						<input style="padding: 5px" class="btn btn-warning btn-icon-split"
							id="insterBtn" onclick="validate();" value="등록하기" />
					</div>
					<div align="right">
						<a href="/getCouponList.mdo" class="btn btn-light btn-icon-split">
							<span class="text">목록가기</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- End of Main Content -->
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>