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
		var check = "";
		$("#mbrLgnId3").on("change", function() {
			var selected = $(this).val();
			
			if(selected == "sandwich") {
				$(".cm").show();
				$(".price").hide();
				
			}  else { 
				$(".cm").hide();
				$(".price").show();
			}
			
			if(selected == "drink"){
				$(".form").hide();
			}else {
				$(".form").show();
			}
			check = selected;
		});
	
	$("#saveBtn").on("click", function() {
		var select = check;
		if(select == "sandwich") {
			if ($("#size").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#price15").val().trim() == '') {
				return;
			} else if ($("#price30").val().trim() == '') {
				return;
			} else if ($("#name").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#code").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
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
			} //else if ($("#img").val().trim() == '') {
				//alert("모든 정보를 기입해주세요.");
		//	$("#img").focus();
			//	return;
			//}
		} else if(select == "drink"){
			$("#price15").remove();
			$("#price30").remove();
			$("#cal").remove();
			$("#pro").remove();
			$("#sug").remove();
			$("#sod").remove();
			$("#ttl").remove();
			$("#fat").remove();
			if ($("#name").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#code").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#price").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			}
		} else{
			$("#price15").remove();
			$("#price30").remove();
			if ($("#name").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#code").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
				return;
			} else if ($("#price").val().trim() == '') {
				alert("모든 정보를 기입해주세요.");
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
			//else if ($("#img").val().trim() == '') {
			//	alert("모든 정보를 기입해주세요.");
			//	$("#img").focus();
			//	return;
			//}
		}
			
		//setTime();
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
				action="menuInsert.mdo" enctype="multipart/form-data">
				<div class="card-body">


					<div class="mb-3">
						<label for="open">제품 카테고리</label>
						<div class="col-sm-3">
							<div class="small mb-1"></div>
							<div class="dropdown mb-4">
								<span class="form_select" style="width: 300px"> <select
									class="btn btn-primary dropdown-toggle" id="mbrLgnId3"
									name="category" style="width: 150px">
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
							<label for="size">15cm/30cm</label>
							<div class="form-group row">
								<div class="col-sm-1">
									<input type="radio" name="size" id="size"
										style="width: 20px; height: 20px;" value="15cm"> <label
										for="15cm">15cm</label>
								</div>
								<div class="col-sm-1">
									<input type="radio" name="size"
										style="width: 20px; height: 20px;" value="30cm"> <label
										for="30cm">30cm</label>
								</div>
							</div>
						</div>
						<div class="mb-3" id="hyunah">
							<label for="price15">15cm 가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="price15"
									id="price15" required>
							</div>
						</div>
						<div class="mb-3" id="hyunah">
							<label for="price30">30cm 가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="price30"
									id="price30" required>
							</div>
						</div>
					</div>

					
						<div class="mb-3">
							<label for="name">제품명</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="name" id="name"
									required>
							</div>
						</div>
						<div class="mb-3" id="hyunah">
							<label for="code">제품 코드</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="code"
									id="code" required>
							</div>
						</div>
						<div class="price">
						<div class="mb-3" id="hyunah">
							<label for="price">가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="price"
									id="price" required>
							</div>
						</div>
					</div>

					<div class="form">
						<div class="mb-3">
							<label for="ttl">총 중량(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="ttl"
									id="ttl" required>
							</div>
						</div>
						<div class="mb-3">
							<label for="cal">열량(kcal)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="cal" id="cal"
									required>
							</div>
						</div>
						<div class="mb-3">
							<label for="sug">당류(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="sug" id="sug"
									required>
							</div>
						</div>
						<div class="mb-3">
							<label for="pro">단백질(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="pro"
									id="pro" required>
							</div>
						</div>
						<div class="mb-3">
							<label for="fat">포화지방(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="fat"
									id="fat" required>
							</div>
						</div>
						<div class="mb-3">
							<label for="sod">나트륨(g)</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="sod"
									id="sod" required>
							</div>
						</div>
					</div>

					<div class="mb-3">
						
                     <div>
                        <div class="index">이미지</div>
                        <input type="file" name="uploadImg" multiple/>
                     </div>
              
					</div>

					<div>
						<button type="submit" class="btn btn-sm btn-primary" id="saveBtn" >저장</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>

