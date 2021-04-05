<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LUBWAY - 러브웨이 이용방법</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/point.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
</head>
<body>
   <%@ include file="/WEB-INF/views/user/header.jsp"%>
   <!-- sub content s -->
   <div id="content">
      <div class="membership">
         <h2 class="subTitle">러브웨이 이용방법</h2>
         <div class="tab02">
            <ul>
               <li class="active" id="mypoint">매장에서 주문하기</li>
            </ul>
         </div>
         <section class="tab_content">
         	<div class="infospace">
	            <div class="usingStep">
		            <img src="${path}/resources/images/sub/howto.jpg" />
	            </div>
            </div>
         </section>
      </div>
   </div>
   <%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>