<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#mbrLgnId3").val("sandwich").prop("selected", true);
		console.log($("#mbrLgnId3").val());
		$(".price").hide();
		var check = "";
		$("#mbrLgnId3").on("change", function() {
			var selected = $(this).val();
			console.log(selected);
			if(selected == "sandwich") {
				$(".form").show();
				$(".price").hide();
				$(".category").show();
				$(".price15").show();
				$(".price30").show();
			}  else if(selected == "drink"){ 
				$(".form").hide();
				$(".price").show();
				$(".category").hide();
				$(".price15").hide();
				$(".price30").hide();
			} else if(selected == "wrap"){
				$(".category").show();
				$(".price").show();
				$(".form").show();
				$(".price15").hide();
				$(".price30").hide();
			} else if(selected == "morning"){
				$(".category").show();
				$(".price").show();
				$(".form").show();
				$(".price15").hide();
				$(".price30").hide();
			} else if(selected == "salad"){
				$(".category").show();
				$(".price").show();
				$(".form").show();
				$(".price15").hide();
				$(".price30").hide();
			} else {
				$(".category").hide();
				$(".form").show();
				$(".price").show();
				$(".price15").hide();
				$(".price30").hide();
			}
			check = selected;
		});
		
	$("#saveBtn").on("click", function() {
		var select = check;
		
		console.log($("#mbrLgnId3").val());
		if($("#mbrLgnId3").val() == "sandwich") {
			if ($("#price15").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#price15").focus();
				return;
			} else if ($("#price30").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#price30").focus();
				return;
			} else if ($("#name").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#name").focus();
				return;
			} else if ($("#engname").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#engname").focus();
				return;
			} else if ($("#code").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#code").focus();
				return;
			} else if ($("#category").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#category").focus();
				return;
			} else if ($("#ttl").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#ttl").focus();
				return;
			} else if ($("#cal").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#cal").focus();
				return;
			} else if ($("#pro").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#pro").focus();
				return;
			} else if ($("#fat").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#fat").focus();
				return;
			} else if ($("#sod").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#sod").focus();
				return;
			} 

		} else if($("#mbrLgnId3").val() == "drink"){

			if ($("#name").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#name").focus();
				return;
			} else if ($("#engname").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#engname").focus();
				return;
			} else if ($("#code").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#code").focus();
				return;
			} else if ($("#price").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#price").focus();
				return;
			}
			

		} else if($("#mbrLgnId3").val() == "wrap"){
			
			if ($("#name").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#engname").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#code").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#price").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#category").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#ttl").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#pro").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#pro").focus();
				return;
			} else if ($("#cal").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#fat").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#sod").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} 

		} else if ($("#mbrLgnId3").val() == "morning"){

			if ($("#name").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#engname").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#code").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#price").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#category").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#pro").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#pro").focus();
				return;
			} else if ($("#ttl").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#cal").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#fat").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#sod").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} 

		} else if ($("#mbrLgnId3").val() == "salad"){

			if ($("#name").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#engname").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#code").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#price").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#category").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#pro").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#pro").focus();
				return;
			} else if ($("#ttl").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#cal").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#fat").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#sod").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} 

		} else if($("#mbrLgnId3").val() == "was" || $("#mbrLgnId3").val() == "cookie") {

			if ($("#name").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#engname").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#code").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#price").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#pro").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				$("#pro").focus();
				return;
			} else if ($("#ttl").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#cal").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#fat").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#sod").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} 
		} 
		
			var select = $("#mbrLgnId3").val();
			console.log(select);
			$("input[name=typeSelect]").val(select);
			console.log($("input[name=typeSelect]").val());
			
			var form = document.getElementById("insert");
			form.submit();
			
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
	<form action="menuInsert.mdo" method="post" id="insert" enctype="multipart/form-data">
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">메뉴 정보 입력</h1>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">메뉴 등록</h6>
			</div>
			
				<div class="card-body">
					<div class="mb-3">
						<label for="open">제품 카테고리</label>
						<div class="col-sm-3">
							<div class="small mb-1"></div>
							<div class="dropdown mb-4">
								<span class="form_select" style="width: 300px"> <select
									class="btn btn-primary dropdown-toggle" id="mbrLgnId3"
									name="select" style="width: 150px">
										<option value="sandwich">샌드위치</option>
										<option value="wrap">랩&파니니</option>
										<option value="salad">찹샐러드</option>
										<option value="morning">아침메뉴</option>
										<option value="cookie">쿠키</option>
										<option value="was">웻지&스프</option>
										<option value="drink">음료</option>
								</select>
								</span>
							</div>
						</div>
					</div>
						<div class="price15">
						<div class="mb-3" id="hyunah">
							<label for="price15">15cm 가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="price15"
									id="price15" >
							</div>
						</div>
						</div>
						<div class="price30">
						<div class="mb-3" id="hyunah">
							<label for="price30">30cm 가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="price30"
									id="price30" >
							</div>
						</div>
					</div>
						<div class="mb-3">
							<label for="name">제품명</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="name" id="name">
							</div>
						</div>
						<div class="mb-3">
							<label for="engname">제품명(english)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="engname" id="engname">
							</div>
						</div>
						<div class="mb-3" id="hyunah">
							<label for="code">제품 코드</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="code" id="code" >
							</div>
						</div>
						<div class="price">
						<div class="mb-3" id="hyunah">
							<label for="price">가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="price" id="price" >
							</div>
						</div>
					</div>
					<div class="category">
					<div class="mb-3" id="hyunah">
							<label for="category">카테고리</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="category" id="category" >
							</div>
						</div>
						</div>
						<div class="content">
					<div class="mb-3" id="hyunah">
							<label for="content">내용</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="content" id="content" >
							</div>
						</div>
						</div>
					<div class="form">
						<div class="mb-3">
							<label for="ttl">총 중량(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="ttl" id="ttl" >
							</div>
						</div>
						<div class="mb-3">
							<label for="cal">열량(kcal)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="cal" id="cal">
							</div>
						</div>
						<div class="mb-3">
							<label for="sug">당류(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="sug" id="sug">
							</div>
						</div>
						<div class="mb-3">
							<label for="pro">단백질(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="pro" id="pro" >
							</div>
						</div>
						<div class="mb-3">
							<label for="fat">포화지방(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="fat" id="fat" >
							</div>
						</div>
						<div class="mb-3">
							<label for="sod">나트륨(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="sod" id="sod">
							</div>
						</div>
					</div>
					<div class="mb-3">
                     <div>
                        <div class="index">이미지</div>
                        <input type="file" name="uploadImg" id="uploadImg" multiple/>
                     </div>
					</div>
					<div>
						<button type="button" class="btn btn-sm btn-primary" id="saveBtn" >저장</button>
					</div>
				</div>
		
		</div>
	</div>
	<input type="hidden" name="typeSelect" value="">
	</form>
	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>

