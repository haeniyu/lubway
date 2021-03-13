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

	function deleteRow(r) {
		var flag = confirm("해당 계정을 탈퇴 처리 하시겠습니까?");
		if (flag) {
			alert("해당 계정을 삭제했습니다.");
			var i = r.parentNode.parentNode.rowIndex;	//버튼이 눌러진 테이블의 로우넘버 저장
			var id = document.getElementById("userTable").rows[i].cells[0].innerHTML;	//해당 로우넘버의 아이디가 있는 칼럼 값 저장
			
			var form = document.createElement("form");
			form.setAttribute("method", "Post");
			form.setAttribute("action", "/lubway/deleteuser.mdo");
			
			var idField = document.createElement("input");
			idField.setAttribute("type", "hidden");
			idField.setAttribute("name", "id");
			idField.setAttribute("value", id);
			
			form.appendChild(idField);
			document.body.appendChild(form);
			form.submit();	// 컨트롤러로 아이디값 전송
			
			document.getElementById("userTable").deleteRow(i);	//화면에서 해당열 삭제
		}
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
					<table class="table table-bordered" id="userTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>지역구</th>
								<th>매장명</th>
								<th>매장 계정</th>
								<th>비밀번호</th>
								<th>계정정보</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
						<!--<c:forEach var="store" items="${list }" varStatus="num"> -->
							<tr>
								<td>매장</td>
								<td>매장</td>
								<td>매장</td>
								<td>매장</td>
								<td><a href="javascript:void(0);"
										class="btn btn-danger btn-icon-split btn-sm" onclick="#" >
											<span class="icon text-white-50"> <i class="fas fa-trash"></i>
										</span> <span class="text">수정</span>
									</a>
									</td>
								<td>
									<a href="javascript:void(0);"
										class="btn btn-danger btn-icon-split btn-sm" onclick="deleteRow(this)" >
											<span class="icon text-white-50"> <i class="fas fa-trash"></i>
										</span> <span class="text">폐점</span>
									</a>
									</td>
							</tr>
						<!--</c:forEach>-->
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