<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 관리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

function shutdown(r) {
	var flag = confirm("해당 매장을 폐점 처리 하시겠습니까?");
	if (flag) {
		alert("해당 매장을 폐점 처리 했습니다.");
		var i = r.parentNode.parentNode.rowIndex;	//버튼이 눌러진 테이블의 로우넘버 저장
		var storename = document.getElementById("storeTable").rows[i].cells[1].innerHTML;	//해당 로우넘버의 아이디가 있는 칼럼 값 저장
		
		var form = document.createElement("form");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "/lubway/shutdown.mdo");
		
		var storenameField = document.createElement("input");
		storenameField.setAttribute("type", "hidden");
		storenameField.setAttribute("name", "storename");
		storenameField.setAttribute("value", storename);
		
		form.appendChild(storenameField);
		document.body.appendChild(form);
		form.submit();	// 컨트롤러로 아이디값 전송
	}
}

function update(r) {
		alert("해당 매장 계정 비밀번호를 수정하였습니다.");
		var i = r.parentNode.parentNode.rowIndex;	//버튼이 눌러진 테이블의 로우넘버 저장
		var storename = document.getElementById("storeTable").rows[i].cells[1].innerHTML;	//해당 로우넘버의 아이디가 있는 칼럼 값 저장
		var password = document.getElementById("storeTable").rows[i].cells[3].innerHTML;
		console.log(password);
		
		var form = document.createElement("form");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "/lubway/updatestorepwd.mdo");
		
		var storenameField = document.createElement("input");
		storenameField.setAttribute("type", "hidden");
		storenameField.setAttribute("name", "storename");
		storenameField.setAttribute("value", storename);
		
		var passwordField = document.createElement("input");
		passwordField.setAttribute("type", "hidden");
		passwordField.setAttribute("name", "password");
		passwordField.setAttribute("value", password);
		
		form.appendChild(storenameField);
		form.appendChild(passwordField);
		document.body.appendChild(form);
		form.submit();
	}

</script>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/views/admin/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">점포 관리</h1>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">점포 목록</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="storeTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>지역구</th>
								<th>매장명</th>
								<th>매장 계정</th>
								<th>비밀번호</th>
								<th>매장 상태</th>
								<th>매장 정보 수정</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="store" items="${list }" varStatus="num">
							<tr>
								<td>${store.area}</td>
								<td>${store.storename }</td>
								<td>${store.id }</td>
								<td><input type="text" name="password" value="${store.password }"></td>
								<td>
									<c:if test="${store.status eq 0 }">운영중</c:if>
									<c:if test="${store.status eq 1 }">폐점</c:if>
								</td>
								<td><a href="javascript:void(0);"
										class="btn btn-success btn-icon-split btn-sm" onclick="update(this)" >
											<span class="icon text-white-50"> <i class="fas fa-check"></i>
										</span> <span class="text">수정</span>
									</a>
									<a href="javascript:void(0);"
										class="btn btn-danger btn-icon-split btn-sm" onclick="shutdown(this)" >
											<span class="icon text-white-50"> <i class="fas fa-trash"></i>
										</span> <span class="text">폐점</span>
									</a>
								</td>
							</tr>
						</c:forEach>
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