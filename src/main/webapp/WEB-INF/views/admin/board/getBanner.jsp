<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 수정 페이지</title>
<style type="text/css">
*{
	list-style: none;
	margin: 0px;
	padding: 0px;
}
ul {
	padding: 0px;
	margin: 0px;
}
li{
	padding: 5px;
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
</style>
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<form action="/lubway/updateBanner.mdo" enctype="multipart/form-data">
		<input name="no" type="hidden" value="${banner.no }">
		<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">배너 수정/삭제</h1>
			<br>
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-warning">배너 수정/삭제</h6>
				</div>
				<div class="card-body">
					<!-- 전체 frame -->
					<ul>
						<!-- 제목 -->
						<li class="title">
							<div>
								<div class="index">제목</div>
								<input class="title_text" type="text" name="title" style="width: 50%" value="${banner.title }" required />
							</div>
						</li>
						<!-- 베너 이미지 업로드 -->
						<li class="img">
							<div>
								<div class="index">배너 이미지</div>
								<input type="file" name="filepath"/>
								<img src="${banner.filepath }" width="850px">
							</div>
						</li>
						<!-- 베너 내용 -->
						<li class="contents">
							<div>
								<div class="index">내용</div>
								<input type="text" name="contents" style="width: 50%;" value="${banner.contents }" required/>
							</div>
						</li>
					</ul>
					<div align="center">
                  		<input style="padding: 5px" class="btn btn-warning btn-icon-split" type="submit" value="수정하기" id="registerBtn" />
               		</div>
              		<div align="right">
		                <a href="insertBanner.mdo" class="btn btn-warning btn-icon-split">
		                	<span class="text">등록하기</span>
		               	</a>&nbsp;&nbsp;&nbsp; 
		               	<a href="deleteBanner.mdo?no=${banner.no}" class="btn btn-danger btn-icon-split" id="deleteBtn"> 
		               		<span class="text">삭제하기</span>
		                </a>&nbsp;&nbsp;&nbsp; 
		                <a href="getBannerList.mdo" class="btn btn-light btn-icon-split"> 
			                <span class="text">목록가기</span>
		                </a>
            	   </div>
				</div>
			</div>

		</div>
	</form>
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>