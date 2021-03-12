<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/views/admin/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">회원 관리</h1>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>이름</th>
								<th>이메일 아이디</th>
								<th>휴대전화</th>
								<th>SMS 수신</th>
								<th>Email 수신</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>여기다 DB 끌어와서</td>
								<td>회원</td>
								<td>정보</td>
								<td>쫘라라</td>
								<td>보여주기</td>
								<td><a href="#"
									class="btn btn-danger btn-icon-split btn-sm"> <span
										class="icon text-white-50"> <i class="fas fa-trash"></i>
									</span> <span class="text">삭제</span>
								</a></td>
							</tr>
						</tbody>

					</table>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>