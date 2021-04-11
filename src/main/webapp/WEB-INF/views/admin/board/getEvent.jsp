<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	list-style: none;
}

li{
	padding: 5px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script>
$(document).ready(function(){
	var start = $("#start").val();
	var end = $("#end").val();

	var openField = document.createElement("input");
	openField.setAttribute("type", "hidden");
	openField.setAttribute("name", "start");
	openField.setAttribute("value", start);

	var closeField = document.createElement("input");
	closeField.setAttribute("type", "hidden");
	closeField.setAttribute("name", "end");
	closeField.setAttribute("value", end);

	document.form.appendChild(openField);
	document.form.appendChild(closeField);
	document.form.submit();
});
</script>

</head>
<body id="page-top">

   <%@ include file="/WEB-INF/views/admin/header.jsp"%>
   <form action="/updateEvent.mdo" method="post" enctype="multipart/form-data">
      <input name="no" type="hidden" value="${event.no }">
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
              <!-- 전체 frame -->
					<ul>
						<!-- 제목 -->
						<li class="title">
							<div>
								<div class="index">제목</div>
								<input class="title_text" value="${event.title }" type="text" name="title"
									style="width: 80%" required />
							</div>
						</li>
						<!-- 썸네일 이미지 업로드 -->
						<li class="img">
							<div>
								<div class="index">썸네일 이미지</div>
								<input type="file" name="thumb" id="thumb">
								<img src="${event.thumbnail }">
							</div>
						</li>
						<!-- 이벤트 이미지 업로드 -->
						<li class="img">
							<div>
								<div class="index">이벤트 이미지</div>
								<input type="file" name="conimg" id="conimg"/>
								<img src="${event.contimg }">
							</div>
						</li>
						<!-- 기간 -->
						<li class="term">
							<div class="index">이벤트 기간</div>
							시작일 : <fmt:formatDate value="${event.regdate }" pattern="yyyy-MM-dd" />
							 - 마감일 : <fmt:formatDate value="${event.enddate }" pattern="yyyy-MM-dd" /><br>
							시작 : <input type="date" name="start" id="start"> ~ 종료 : <input type="date" id="end" name="end">
						</li>
					</ul>
               <div align="center">
                  <input style="padding: 5px" class="btn btn-warning btn-icon-split"
                     type="submit" value="수정하기" id="registerBtn" />
               </div>
               <div align="right">
                  <a href="insertEvent.mdo" class="btn btn-warning btn-icon-split">
                     <span class="text">등록하기</span>
                  </a>&nbsp;&nbsp;&nbsp; <a href="/deleteEvent.mdo?no=${event.no}"
                     class="btn btn-danger btn-icon-split" id="deleteBtn"> <span class="text">삭제하기</span>
                  </a>&nbsp;&nbsp;&nbsp; <a href="/getEventList.mdo"
                     class="btn btn-light btn-icon-split"> <span class="text">목록가기</span>

                  </a>
               </div>
            </div>
         </div>

      </div>
   </form>
<!-- /.container-fluid -->
<!-- End of Main Content -->
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>