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
	
		var select = $("#mbrLgnId3").val();
	//setTime();



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
		<div class="card shadow mb-4" >
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">메뉴 정보 수정</h6>
			</div>
			<form name="form" id="form" role="form" method="post"
				action="menuInsert.mdo">
				<div class="card-body">
				
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
								<input type="text" class="form-control" name="name" id="name"
									value="${update.name}">
							</div>
						</div>
						<div class="mb-3">
							<label for="engname">제품명(english)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="engname" id="engname"
									value="${update.engname}">
							</div>
						</div>
						<div class="mb-3" id="hyunah">
							<label for="code">제품 코드</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="code"
									id="code" value="${update.code}">
							</div>
						</div>
						<div class="price">
						<div class="mb-3" id="hyunah">
							<label for="price">가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="price"
									id="price" value="${update.price}">
							</div>
						</div>
					</div>
					<div class="category">
					<div class="mb-3" id="hyunah">
							<label for="category">카테고리</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="category"
									id="category" >
							</div>
						</div>
						</div>
						<div class="content">
					<div class="mb-3" id="hyunah">
							<label for="content">내용</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="content"
									id="content" value="${update.content}">
							</div>
						</div>
						</div>

					<div class="form">
						<div class="mb-3">
							<label for="ttl">총 중량(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="ttl"
									id="ttl" value="${nutrient.ttl}">
							</div>
						</div>
						<div class="mb-3">
							<label for="cal">열량(kcal)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="cal" id="cal"
									value="${nutrient.cal}">
							</div>
						</div>
						<div class="mb-3">
							<label for="sug">당류(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="sug" id="sug"
									value="${nutrient.sug}">
							</div>
						</div>
						<div class="mb-3">
							<label for="pro">단백질(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="pro"
									id="pro" value="${update.pro}">
							</div>
						</div>
						<div class="mb-3">
							<label for="fat">포화지방(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="fat"
									id="fat" value="${nutrient.fat}">
							</div>
						</div>
						<div class="mb-3">
							<label for="sod">나트륨(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="sod"
									id="sod" value="${nutrient.sod}">
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
						<button type="button" class="btn btn-sm btn-primary" id="updateBtn">수정</button>
						<button type="button" class="btn btn-danger btn-icon-split" id="deleteBtn">삭제</button>
					</div>
				</form>
			</div>
		</div>
	
	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>

