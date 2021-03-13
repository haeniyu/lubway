<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<title>매장 등록</title>
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
			<div class="card-body">
				<form name="form" id="form" role="form" method="post" action="#">
					<div class="mb-3">
						<label for="district">지역구</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="district"
								id="district">
						</div>
					</div>
					<div class="mb-3">
						<label for="name">점포명</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="name" id="name">
						</div>
					</div>
					<div class="mb-3">
						<label for="store_tel">전화번호</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="store_tel"
								id="store_tel">
						</div>
					</div>
					<div class="mb-3">
						<label for="open">오픈시간</label>
						<div class="col-sm-3">
							<input type="time" class="form-control" name="open" id="open">
						</div>
						<label for="close">마감시간</label>
						<div class="col-sm-3">
							<input type="time" class="form-control" name="close" id="close">
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
								<input type="radio" name="parking"
									id="parking" style="width:20px;height:20px;" value="불가능">
									<label for="불가능">불가능</label>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="address_load">주소</label>
						<div class="form-group row" style="margin-right:10px">
							<div class="col-sm-3">
								<input type="text" class="form-control" name="zipcode"
									id="zipcode" placeholder="우편번호" >
							</div>
							<button type="button" class="btn btn-sm btn-primary" id="findBtn"
								onclick="#">우편번호 찾기</button>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="address_load"
								id="address_load" placeholder="도로명주소">
						</div>
					</div>
					<div class="mb-3">
						<label for="content">상세주소</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="address_detail"
								id="address_detail">
						</div>
					</div>
					<br>
					<hr>
				</form>
				<div>
					<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>

