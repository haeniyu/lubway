<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
  
$(document).ready(function(){
	
	$("#saveBtn").on("click", function() {
		if ($("#area").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#area").focus();
			return;
		} else if ($("#store_tel").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#store_tel").focus();
			return;
		} else if ($("#code").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#code").focus();
			return;
		} else if ($("#id").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#id").focus();
			return;
		} else if ($("#password").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#password").focus();
			return;
		} else if ($("#storename").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#storename").focus();
			return;
		} else if ($("#close").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#close").focus();
			return;
		} else if ($("#open").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#open").focus();
			return;
		} else if ($("#parking").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#parking").focus();
			return;
		} else if ($("#postcode").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#postcode").focus();
			return;
		}
		setTime();
	});
});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#mbrLgnId3").on("change", function() {
			var select = $(this).val();
			
			if(select == "sandwich") {
				$(".cm").show();
			}  else { 
				$(".cm").hide();
			}
			if(select == "drink"){
				$(".form").hide();
			}else {
				$(".form").show();
			}
			
			
		});
	});
</script>
<style type="text/css">
.addr {
	border: 1px solid #D3D4E3;
	border-radius: 5px;
	height: 35px;
}
</style>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">메뉴 정보 입력</h1>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">메뉴 등록</h6>
			</div>
			<form name="form" id="form" role="form" method="post"
				action="menuInsert.mdo">
				<div class="card-body">


					<div class="mb-3">
						<label for="open">제품 카테고리</label>
						<div class="col-sm-3">
							<div class="small mb-1"></div>
							<div class="dropdown mb-4">
								<span class="form_select" style="width: 300px"> <select
									class="btn btn-primary dropdown-toggle" id="mbrLgnId3"
									name="domain" style="width: 150px">
										<option value="sandwich">샌드위치</option>
										<option value="wrap">랩&파니니</option>
										<option value="salad">찹샐러드</option>
										<option value="morning">아침메뉴</option>
										<option value="smail">스마일 썹</option>
										<option value="drink">음료</option>
								</select>
								</span>
							</div>
						</div>
					</div>

					<div class="cm">
						<div class="mb-3" id="hyunah">
							<label for="parking">15cm/30cm</label>
							<div class="form-group row">
								<div class="col-sm-1">
									<input type="radio" name="parking" id="parking"
										style="width: 20px; height: 20px;" value="가능"> <label
										for="가능">15cm</label>
								</div>
								<div class="col-sm-1">
									<input type="radio" name="parking"
										style="width: 20px; height: 20px;" value="불가능"> <label
										for="불가능">30cm</label>
								</div>
							</div>
						</div>
						<div class="mb-3" id="hyunah">
							<label for="storename">15cm 가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="storename"
									id="storename" required>
							</div>
						</div>
						<div class="mb-3" id="hyunah">
							<label for="storename">30cm 가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="storename"
									id="storename" required>
							</div>
						</div>
					</div>

					
						<div class="mb-3">
							<label for="area">제품명</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="area" id="area"
									required>
							</div>
						</div>
						<div class="mb-3" id="hyunah">
							<label for="storename">제품 코드</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="storename"
									id="storename" required>
							</div>
						</div>
						<div class="mb-3" id="hyunah">
							<label for="storename">가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="storename"
									id="storename" required>
							</div>
						</div>
					

					<div class="form">
						<div class="mb-3">
							<label for="storename">총 중량(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="storename"
									id="storename" required>
							</div>
						</div>
						<div class="mb-3">
							<label for="code">열량(kcal)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="code" id="code"
									required>
							</div>
						</div>
						<div class="mb-3">
							<label for="id">당류(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="id" id="id"
									required>
							</div>
						</div>
						<div class="mb-3">
							<label for="password">단백질(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="password"
									id="password" required>
							</div>
						</div>
						<div class="mb-3">
							<label for="store_tel">포화지방(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="store_tel"
									id="store_tel" required>
							</div>
						</div>
						<div class="mb-3">
							<label for="store_tel">나트륨(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="store_tel"
									id="store_tel" required>
							</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="store_tel">이미지</label>
						<div class="col-sm-3">
							<input type="file" name="multipart" required />
						</div>
					</div>

					<div>
						<button type="button" class="btn btn-sm btn-primary" id="saveBtn">저장</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>

