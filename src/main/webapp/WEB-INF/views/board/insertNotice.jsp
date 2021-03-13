<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script>
	체크 -> 체크 된걸 읽고 -> db에서 fix 를 true로 바꿔야 함
	$(document).ready(function(){
		$("#btn-icon-split").on("click",function(){
			
		});
	});
</script>
<style type="text/css">
* {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

ul {
	padding: 0px;
	margin: 0px;
}

.wrap {
	padding: 20px;
}

.title, .contents {
	border: 1px solid lightgray;
	padding: 20px;
}

.img {
	border-left: 1px solid lightgray;
	border-right: 1px solid lightgray;
	padding: 20px;
}

.index {
	width: 150px;
	display: inline-block;
}

.index_con {
	width: 150px;
	display: inline-block;
}

.index_text {
	display: inline-flex;
	width: 80%;
	height: 300px;
}

.fix_notice {
	margin-bottom: 10px;
}
</style>
</head>
<body id="page-top">

	<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<!-- 관리자 버전 화면 만들기  -->
	<!-- 이 jsp을 복사해서  container-fluid 안에 해당 화면의 내용으로 바꿔서 작성하시면 됩니다. -->
	<form action="/lubway/insertDB.bdo" method="post" enctype="multipart/form-data">
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
					<!-- 전체 frame -->
					<ul>
						<!-- 제목 -->
						<li class="title">
							<div>
								<div class="index">제목</div>
								<input class="title_text" type="text" name="title"
									style="width: 80%" />
							</div>
						</li>
						<!-- 이미지 업로드 -->
						<li class="img">
							<div>
								<div class="index">이미지</div>
								<input type="file" name="uploadImg" multiple />
							</div>
						</li>
						<!-- 내용 -->
						<li class="contents">
							<div class="index">
								<div class="index_con">내용</div>
							</div>
							<div class="index_text">
								<textarea name="content" rows="15" style="width: 100%"></textarea>
							</div>
						</li>
					</ul>
					<div align="center">
						<div class="fix_notice">
							<input type="checkbox" name="fix" id="fixCheck" /><span>상단에 고정하기</span>
						</div>
						<input style="padding: 5px" class="btn btn-warning btn-icon-split"
							type="submit" value="등록하기" />
					</div>
					<div align="right">
						<a href="getNoticeList.bdo" class="btn btn-light btn-icon-split">
							<span class="text">목록가기</span>
						</a>
					</div>
				</div>
			</div>

		</div>
	</form>

	<!-- /.container-fluid -->

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