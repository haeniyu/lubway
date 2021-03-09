<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<body id="page-top">

	<%@ include file="/WEB-INF/views/admin/header.jsp"%>

	<!-- 관리자 버전 화면 만들기  -->
	<!-- 이 jsp을 복사해서  container-fluid 안에 해당 화면의 내용으로 바꿔서 작성하시면 됩니다. -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">공지사항 등록</h1>
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-warning">공지사항 등록</h6>
			</div>
			<div class="card-body">
				<form action="noticeList.mdo" method="post">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<tr>
								<td>제목</td>
								<td colspan="2"><input type="text" name="title"
									style="width: 80%" /></td>
							</tr>
							<tr>
								<td>이미지 첨부</td>
								<td colspan="2"><input type="text" name="add_file"
									style="width: 80%" /><input style="margin: 5px; padding: 3px"
									class="btn btn-warning btn-icon-split" type="button"
									value="파일찾기" /></td>
							</tr>
							<tr>
								<td>원본 이미지 첨부</td>
								<td colspan="2"><input type="text" name="add_file"
									style="width: 80%" /><input style="margin: 5px; padding: 3px"
									class="btn btn-warning btn-icon-split" type="button"
									value="파일찾기" /></td>
							</tr>
							<tr>
								<td colspan="3">내용</td>
							</tr>
							<tr>
								<td colspan="3"><textarea style="width: 100%" rows="15"
										name="content"></textarea></td>
							</tr>
							<tr>
								<td colspan="3">
									<div align="center">
										<input style="padding: 3px"
											class="btn btn-warning btn-icon-split" type="submit"
											value="등록하기">
									</div>
								</td>
							</tr>
						</table>
					</div>
				</form>
				<div align="right">
					<a href="noticeList.mdo" class="btn btn-light btn-icon-split">
						<span class="text">목록가기</span>
					</a>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${path}/resources/js/sb-admin-2.js"></script>

	<!-- Page level plugins -->
	<script src="${path}/resources/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="${path}/resources/js/demo/chart-area-demo.js"></script>
	<script src="${path}/resources/js/demo/chart-pie-demo.js"></script>
</body>
</html>