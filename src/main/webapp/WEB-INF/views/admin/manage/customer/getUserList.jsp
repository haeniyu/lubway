<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

	function deleteRow(r) {
		var flag = confirm("해당 계정을 정지 처리 하시겠습니까?");
		if (flag) {
			alert("해당 계정을 정지했습니다.");
			var i = r.parentNode.parentNode.rowIndex;	//버튼이 눌러진 테이블의 로우넘버 저장
			var id = document.getElementById("userTable").rows[i].cells[0].innerHTML;	//해당 로우넘버의 아이디가 있는 칼럼 값 저장
			
			var form = document.createElement("form");
			form.setAttribute("method", "Post");
			form.setAttribute("action", "/lubway/blockuser.mdo");
			
			var idField = document.createElement("input");
			idField.setAttribute("type", "hidden");
			idField.setAttribute("name", "id");
			idField.setAttribute("value", id);
			
			form.appendChild(idField);
			document.body.appendChild(form);
			form.submit();	// 컨트롤러로 아이디값 전송

		}
	}
	
	function activateRow(r) {
		var flag = confirm("해당 계정을 활성화 하시겠습니까?");
		if (flag) {
			alert("해당 계정을 활성화했습니다.");
			var i = r.parentNode.parentNode.rowIndex;	//버튼이 눌러진 테이블의 로우넘버 저장
			var id = document.getElementById("userTable").rows[i].cells[0].innerHTML;	//해당 로우넘버의 아이디가 있는 칼럼 값 저장
			
			var form = document.createElement("form");
			form.setAttribute("method", "Post");
			form.setAttribute("action", "/lubway/activateuser.mdo");
			
			var idField = document.createElement("input");
			idField.setAttribute("type", "hidden");
			idField.setAttribute("name", "id");
			idField.setAttribute("value", id);
			
			form.appendChild(idField);
			document.body.appendChild(form);
			form.submit();	// 컨트롤러로 아이디값 전송

		}
	}
</script>
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
					<table class="table table-bordered" id="userTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>이메일 아이디</th>
								<th>이름</th>
								<th>휴대전화</th>
								<th>SMS 수신</th>
								<th>Email 수신</th>
								<th>계정 상태</th>
								<th>계정 상태 변경</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="user" items="${list }" varStatus="num">
							<tr>
								<td>${user.id }</td>
								<td>${user.name }</td>
								<td>${user.tel }</td>
								<td>${user.sms_usable }</td>
								<td>${user.email_usable }</td>
								<td>
									<c:if test="${user.status eq 0}">정상</c:if>
									<c:if test="${user.status eq 1}">정지</c:if>
								</td>
								<td>
									<c:if test="${user.status eq 0}">
									<a href="javascript:void(0);"
										class="btn btn-danger btn-icon-split btn-sm" onclick="deleteRow(this)" >
											<span class="icon text-white-50"> <i class="fas fa-trash"></i>
										</span> <span class="text">정지</span>
									</a>
									</c:if>
									<c:if test="${user.status eq 1}">
									<a href="javascript:void(0);"
										class="btn btn-success btn-icon-split btn-sm" onclick="activateRow(this)" >
											<span class="icon text-white-50"> <i class="fas fa-info"></i>
										</span> <span class="text">활성화</span>
									</a>
									</c:if>
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