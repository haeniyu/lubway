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
		var morning = $("#morning_usable").is(":checked");
		var fastway = $("#fastway_usable").is(":checked");
		var homeway = $("#homeway_usable").is(":checked");
		
		var openField = document.createElement("input");
		openField.setAttribute("type", "hidden");
		openField.setAttribute("name", "openTime");
	    openField.setAttribute("value", open);
	    
		var closeField = document.createElement("input");
		closeField.setAttribute("type", "hidden");
		closeField.setAttribute("name", "closeTime");
	    closeField.setAttribute("value", close);
	    
        var morField = document.createElement("input");
        morField.setAttribute("type", "hidden");
        morField.setAttribute("name", "morning_usable");
        morField.setAttribute("value", morning);

        var fastField = document.createElement("input");
        fastField.setAttribute("type", "hidden");
        fastField.setAttribute("name", "fastway_usable");
        fastField.setAttribute("value", fastway);

        var homeField = document.createElement("input");
        homeField.setAttribute("type", "hidden");
        homeField.setAttribute("name", "homeway_usable");
        homeField.setAttribute("value", homeway);
	    
        document.form.appendChild(openField);
        document.form.appendChild(closeField);
        document.form.appendChild(morField);
        document.form.appendChild(fastField);
        document.form.appendChild(homeField);
	    
	    
	    alert("수정되었습니다.");
	    
	    document.form.submit();
	    
	});
	
});

</script>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/views/store/header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">매장 관리</h1>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">매장 정보 수정</h6>
			</div>
			<form name="form" id="form" role="form" method="post" action="update.sdo">
			<div class="card-body">
					<div class="mb-3">
						<label for="area">지역구</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="area"
								id="area" value="${storeinfo.area }" disabled="disabled">
						</div>
					</div>
					<div class="mb-3">
						<label for="storename">점포명</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="storename" id="storename" value="${storeinfo.storename }" disabled="disabled">
						</div>
					</div>
					<div class="mb-3">
						<label for="code">매장코드</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="code" id="code" value="${storeinfo.code }" disabled="disabled">
						</div>
					</div>
					<div class="mb-3">
						<label for="store_tel">전화번호</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="store_tel"
								id="store_tel" value="${storeinfo.store_tel }" disabled="disabled">
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
						<label for="service">가능한 서비스 (가능한 항목에 체크)</label>
						<div>
						<input type="checkbox" id="morning_usable" name="service" value="morning_usable">
							<label for="morning_usable">아침메뉴</label>&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="fastway_usable" name="service" value="fastway_usable">
							<label for="morning_usable">FASTWAY</label>&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="homeway_usable" name="service" value="homeway_usable">
							<label for="morning_usable">HOMEWAY</label>
						</div>
					</div>
					<hr>
				<div>
					<button type="button" class="btn btn-sm btn-primary" id="saveBtn">저장</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/store/footer.jsp"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>

