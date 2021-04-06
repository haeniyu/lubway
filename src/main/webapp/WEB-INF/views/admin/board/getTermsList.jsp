<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">약관동의 관리</h1>
		<br>
		<div class="row" style="padding-left:50px; text-align:center;">
		<form action="updateTerms.mdo" method="post">
			<c:forEach items="${list }" var="terms">
	        <div class="card shadow mb-6">
	            <div class="card-header py-3">
	                <h6 class="m-0 font-weight-bold text-primary">${terms.title }</h6>
	            </div>
	            <div class="card-body">
	                <input type="hidden" name="no" value="${terms.no }">
	                <textarea class="form-control" rows="10" cols="130" id="terms" name="content${terms.no }">${terms.content}</textarea>
	            </div>
	        </div>
	        <br>
	        </c:forEach>
	        <div class="my-2"></div>
	    	<button class="btn btn-primary" type="submit">수정</button>
	        <div class="my-2"></div>
	    </form>
        </div>
	</div>
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
</body>
</html>