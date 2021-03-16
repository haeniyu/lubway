<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 페이지 등록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script>
	$(document).ready(function(){
		$("#registerBtn").on("click",function(){
					alert("등록되었습니다.");
		});
	});
</script>
<style type="text/css">
*{
	list-style: none;
}

li{
	padding: 5px;
}
</style>
</head>
<body id="page-top">

	<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<!-- 관리자 버전 화면 만들기  -->
	<!-- 이 jsp을 복사해서  container-fluid 안에 해당 화면의 내용으로 바꿔서 작성하시면 됩니다. -->
	<form action="/lubway/insertDB.mdo" method="post" enctype="multipart/form-data">
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">이벤트 등록</h1>
			<br>
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-warning">이벤트 등록</h6>
				</div>
				<div class="card-body">
					<!-- 전체 frame -->
					<ul>
						<!-- 제목 -->
						<li class="title">
							<div>
								<div class="index">제목</div>
								<input class="title_text" type="text" name="title"
									style="width: 80%" required />
							</div>
						</li>
						<!-- 썸네일 이미지 업로드 -->
						<li class="img">
							<div>
								<div class="index">썸네일 이미지</div>
								<input type="file" name="multipart" />
							</div>
						</li>
						<!-- 이벤트 이미지 업로드 -->
						<li class="img">
							<div>
								<div class="index">이벤트 이미지</div>
								<input type="file" name="multipart" multiple/>
							</div>
						</li>
						<!-- 기간 -->
						<li class="term">
							<div class="index">이벤트 기간</div>
							시작 : <input type="date" name="start"> ~ 종료 : <input type="date" name="end">
						</li>
					</ul>
					<div align="center">
						<input style="padding: 5px" class="btn btn-warning btn-icon-split"
							type="submit" id="registerBtn" value="등록하기" />
					</div>
					<div align="right">
						<a href="getEventList.mdo" class="btn btn-light btn-icon-split">
							<span class="text">목록가기</span>
						</a>
					</div>
				</div>
			</div>

		</div>
	</form>
	
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