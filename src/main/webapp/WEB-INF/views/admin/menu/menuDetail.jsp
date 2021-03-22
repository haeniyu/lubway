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
	
	var selected = '${select}';
	console.log(selected);

	if(selected == "sandwich") {
		$(".price").remove();
	} else if(selected == "wrap"){
		$(".price15").remove();
		$(".price30").remove();
	} else if(selected == "morning"){
		$(".price15").remove();
		$(".price30").remove();
	} else if(selected == "salad"){
		$(".price15").remove();
		$(".price30").remove();
	} else if(selected == "cookie"){
		$(".category").remove();
		$(".price15").remove();
		$(".price30").remove();
	} else if(selected == "was"){
		$(".category").remove();
		$(".price15").remove();
		$(".price30").remove();
	} else if(selected == "drink"){ 
		$(".form").remove();
		$(".category").remove();
		$(".price15").remove();
		$(".price30").remove();
	}


	
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
				action="menuUpdate.mdo" enctype="multipart/form-data">
				<input type="hidden" value="${select}" id="select" name="select"/>
				<div class="card-body">
				<c:if test="${select == 'sandwich'}">
						<div class="price15">
						<div class="mb-3" id="hyunah">
							<label for="price15">15cm 가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="price15" id="price15" value="${update.price15}">
							</div>
						</div>
						</div>
						<div class="price30">
						<div class="mb-3" id="hyunah">
							<label for="price30">30cm 가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="price30" id="price30" value="${update.price30}">
							</div>
						</div>
					</div>
				</c:if>
					
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
								<c:if test="${select != 'sandwich'}">
									<input type="text" class="form-control" name="price" id="price" value="${update.price}">
								</c:if>
							</div>
						</div>
					</div>

					<div class="category">
					<div class="mb-3" id="hyunah">
							<label for="category">카테고리</label>
							<div class="col-sm-3">
							<c:if test="${select == 'sandwich' || select == 'salad' || select == 'morning' || select == 'wrap'}">
								<input type="text" class="form-control" name="category" id="category" value="${update.category}">
							</c:if>
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
				<c:if test="${select != 'drink'}">
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
									id="pro" value="${nutrient.pro}">
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
					</c:if>
					<div class="mb-3">
						
                     <div>
                        <div class="index">이미지</div>
                        <input type="file" name="uploadImg" id="uploadImg" multiple/>
                        <img src="${update.filePath}">
                     </div>
              
					</div>

					<div>
						<button type="submit" class="btn btn-big btn-primary" id="updateBtn">수정</button>
						<button type="button" class="btn btn-danger btn-primary" id="deleteBtn">삭제</button>
					</div>
				</form>
			</div>
		</div>
	
	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>

