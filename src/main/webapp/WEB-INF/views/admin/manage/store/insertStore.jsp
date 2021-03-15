<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<title>매장 등록</title>
<script type="text/javascript">
$(document).ready(function(){
	$('.timepicker').timepicker({
	    timeFormat: 'HH:mm',
	    interval: 30,
	    startTime: '00:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	
	$("#saveBtn").on("click",function(){
		var open = $("#open").val();
		var close = $("#close").val();
		
		var openField = document.createElement("input");
		openField.setAttribute("type", "hidden");
		openField.setAttribute("name", "openTime");
	    openField.setAttribute("value", open);
	    
		var closeField = document.createElement("input");
		closeField.setAttribute("type", "hidden");
		closeField.setAttribute("name", "closeTime");
	    closeField.setAttribute("value", close);
	    
	    document.form.appendChild(openField);
	    document.form.appendChild(closeField);
	    document.form.submit();
	    
	});
	
});

</script>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">매장 관리</h1>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">매장 등록</h6>
			</div>
			<form name="form" id="form" role="form" method="post" action="insertstoreproc.mdo">
			<div class="card-body">
					<div class="mb-3">
						<label for="area">지역구</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="area"
								id="area" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="storename">점포명</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="storename" id="storename" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="code">매장코드</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="code" id="code" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="id">아이디</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="id" id="id" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="password">비밀번호</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="password" id="password" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="store_tel">전화번호</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="store_tel"
								id="store_tel" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="open">오픈시간</label>
						<div class="col-sm-3">
							<input type="text" class="form-control timepicker" id="open" required>
						</div>
						<label for="close">마감시간</label>
						<div class="col-sm-3">
							<input type="text" class="form-control timepicker" id="close" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="parking">주차정보</label>
						<div class="form-group row">
							<div class="col-sm-1">
								<input type="radio" name="parking"
									id="parking" style="width:20px;height:20px;" value="가능">
									<label for="가능">가능</label>
							</div>
							<div class="col-sm-1">
								<input type="radio" name="parking" style="width:20px;height:20px;" value="불가능">
									<label for="불가능">불가능</label>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="address_load">주소</label>
						<div class="form-group row" style="margin-right:10px">
							<div class="col-sm-3">
								<input type="text" class="form-control" name="zipcode"
									id="zipcode" placeholder="우편번호" required>
							</div>
							<button type="button" class="btn btn-sm btn-primary" id="findBtn">우편번호 찾기</button>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="address_load"
								id="address_load" placeholder="도로명주소" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="address_detail">상세주소</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="address_detail"
								id="address_detail" required>
						</div>
					</div>
					<br>
					<hr>
				<div>
					<button type="button" class="btn btn-sm btn-primary" id="saveBtn">저장</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>

