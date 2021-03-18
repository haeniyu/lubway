<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가맹 문의·신청</title>
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

.index {
   width: 150px;
   display: inline-block;
   color: #025e2c;
   font-weight: bold
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
</style>
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/admin/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">가맹 문의·신청</h1>
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-warning">Franchise Inquiry Board</h6>
			</div>
				<div class="card-body">
               <!-- 전체 frame -->
               <ul>
                  <li class="title">
                     <div>
                        <div class="index">제목</div>
                        <span>${inquiry.title }</span>
                     </div>
                  </li>
                 <li class="title">
                     <div>
                        <div class="index">이름</div>
                        <span>${inquiry.name }</span>
                     </div>
                  </li>
                  <li class="title">
                     <div>
                        <div class="index">연락처</div>
                        <span>${inquiry.tel }</span>
                     </div>
                  </li>
                  <li class="title">
                     <div>
                        <div class="index">이메일</div>
                        <span>${inquiry.email }</span>
                     </div>
                  </li>
                  <li class="title">
                     <div>
                        <div class="index">지역구</div>
                        <span>${inquiry.area }</span>
                     </div>
                  </li>
                  <!-- 내용 -->
                  <li class="contents">
                     <div class="index">
                        <div class="index_con">내용</div>
                     </div>
                     <div class="index_text">
                        <p>${inquiry.content}</p>
                     </div>
                  </li>
               </ul>
               <div align="right">
                  <a href="getInquiryList.mdo" class="btn btn-light btn-icon-split"> <span class="text">목록가기</span></a>
               </div>
            </div>
         </div>
      </div>
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>