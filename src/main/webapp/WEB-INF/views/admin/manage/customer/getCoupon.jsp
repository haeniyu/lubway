<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 > 쿠폰</title>
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
   <form action="/updateCoupon.mdo" enctype="multipart/form-data">
      <input name="no" type="hidden" value="${coupon.no }">
      <div class="container-fluid">

         <!-- Page Heading -->
         <h1 class="h3 mb-2 text-gray-800">쿠폰 정보</h1>
         <br>
         <!-- DataTales Example -->
         <div class="card shadow mb-4">
            <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-warning">쿠폰 정보</h6>
            </div>
            <div class="card-body">
              <!-- 전체 frame -->
					<ul>
						<!-- 쿠폰 코드 -->
						<li class="code">
							<div>
								<div class="index">쿠폰 코드</div>
								<input class="title_text" value="${coupon.code }" type="text" name="code" disabled="disabled" />
							</div>
						</li>
						<!-- 쿠폰 이름 -->
						<li class="name">
							<div>
								<div class="index">쿠폰 이름</div>
								<input class="text" value="${coupon.name }" type="text" name="name" disabled="disabled" />
							</div>
						</li>
						<!-- 쿠폰 할인율 -->
						<li class="dc">
							<div>
								<div class="index">쿠폰 할인율</div>
								<input type="text" name="dc"  value="${coupon.discount }"  required/>&nbsp;%
							</div>
						</li>
						<!-- 쿠폰 사용 방식 -->
						<li class="type">
							<div>
								<div class="index">쿠폰 사용처 [HOME/FAST]</div>
								<input type="radio" name="type" id="home" value="home" required/> HOME&nbsp;&nbsp;
								<input type="radio" name="type" id="fast" value="fast" required/> FAST&nbsp;&nbsp;
								<input type="radio" name="type" id="all" value="all" required/> ALL
							</div>
						</li>
						<!-- 기간 -->
						<li class="term">
							<div class="index">쿠폰 사용 기간</div>
							시작 : <fmt:formatDate value="${coupon.regdate }" pattern="yyyy-MM-dd" />
							 ~ 종료 : <fmt:formatDate value="${coupon.enddate }" pattern="yyyy-MM-dd" /><br>
							시작 : <input type="date" name="start" id="start"> ~ 종료 : <input type="date" id="end" name="end">
						</li>
					</ul>
               <div align="center">
                  <input style="padding: 5px" class="btn btn-warning btn-icon-split"
                     type="submit" value="수정하기" id="registerBtn" />
               </div>
               <div align="right">
                  <a href="insertCoupon.mdo" class="btn btn-warning btn-icon-split">
                     <span class="text">등록하기</span>
                  </a>&nbsp;&nbsp;&nbsp; <a href="/deleteCoupon.mdo?no=${coupon.no}"
                     class="btn btn-danger btn-icon-split" id="deleteBtn"> <span class="text">삭제하기</span>
                  </a>&nbsp;&nbsp;&nbsp; <a href="/getCouponList.mdo"
                     class="btn btn-light btn-icon-split"> <span class="text">목록가기</span>
                  </a>
               </div>
            </div>
         </div>
      </div>
   </form>
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>