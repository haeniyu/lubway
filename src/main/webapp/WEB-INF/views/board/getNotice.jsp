<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<body id="page-top">

	<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<form action="/lubway/insertNotice.bdo" method="post">
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
				
				<input name="no" type="hidden" value="${notice.no} }">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<tr>
								<td>제목</td>
<<<<<<< HEAD
								<td colspan="2" align="left"><input type="text" name="title" width="80%" value="${notice.title}" /></td>
=======
								<td colspan="2" align="left"><input type="text" name="title"
									style="width: 80%" value="title" /></td>
>>>>>>> 723e012167d9703d32cd58000fe690904105037f
							</tr>
							<tr>
								<td>이미지 첨부</td>
								<td colspan="2" align="left"><input type="file" name="upload_img" width="80%" value="${notice.img }" />
								<input style="margin: 5px; padding: 3px" class="btn btn-warning btn-icon-split" type="button" value="파일찾기" /></td>
							</tr>
							<!-- 
							<tr>
								<td>원본 이미지 첨부</td>
								<td colspan="2" align="left"><input type="file" name="upload_originimg"
									style="width: 80%" value="${notice.originimg }" /><input style="margin: 5px; padding: 3px"
									class="btn btn-warning btn-icon-split" type="button"
									value="파일찾기" /></td>
							</tr>
							-->
							<tr>
								<td colspan="3">내용</td>
							</tr>
							<tr>
<<<<<<< HEAD
								<td colspan="3" align="left"><textarea width="100%" rows="15" name="content">${notice.content }</textarea></td>
=======
								<td colspan="3" align="left"><textarea style="width: 100%" rows="15"
										name="content" value="content">${notice.content }</textarea></td>
>>>>>>> 723e012167d9703d32cd58000fe690904105037f
							</tr>
							<tr>
								<td colspan="3">
									<div align="center">
										<input style="padding: 5px" class="btn btn-warning btn-icon-split" type="submit" value="수정하기">
									</div>
								</td>
							</tr>
						</table>
					</div>
				</form>
				<div align="right">
<<<<<<< HEAD
					<a href="insertNotice.bdo" class="btn btn-warning btn-icon-split">
						<span class="text">등록하기</span>
					</a>&nbsp;&nbsp;&nbsp;
=======
				<script>
					<input class="yesno" type="submit" style="padding: 7px" class="btn btn-warning btn-icon-split" value="등록하기">
					
$('.yesno').click(function(){
    if(confirm("정말 등록하시겠습니까 ?") == true){
        alert("등록되었습니다");
    }
    else{
        return ;
    }
});
</script>			
					&nbsp;&nbsp;&nbsp;
					<!-- 삭제할때 href 다시보기 -->
>>>>>>> 723e012167d9703d32cd58000fe690904105037f
					<a href="deleteNotice.bdo?no=${notice.no }" class="btn btn-danger btn-icon-split">
						<span class="text">삭제하기</span>
					</a>&nbsp;&nbsp;&nbsp;
					<a href="noticeList.bdo" class="btn btn-light btn-icon-split">
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