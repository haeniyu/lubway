<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".pd_list_wrapper").hide();
		$("ul.list_menu li:first").addClass("active").show();
		$(".pd_list_wrapper:first").show();
		
		$("ul.list_menu li").click(function(){
			$("ul.list_menu li").removeClass("active");
			$("this").addClass("active");
			$(".pd_list_wrapper").hide();
			
			var activeTab = $(this).find("a").attr("href");
			$(activeTab).fadeIn();
			return false;
		});

	});


</script>
<head>
<meta charset="UTF-8">
<title>fastway/Step02</title>

</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<form action="">
    <div class="content">
            <!-- container s -->
        <div id="container">
			<div id="content" class="order  fast_sub"> <!-- fast_sub / home_sub -->
				<!-- index -->
				<div class="menu_list">
					<div class="order_title">
						<h3>Fast-Sub</h3>
						<p>
							온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.
							
						</p>
					</div>
					<div class="tab02">
						<ul class="list_menu">

							<li><a href="#">샌드위치</a></li>
							<li><a href="#">랩ㆍ기타</a></li>
							<li><a href="#">찹샐러드</a></li>
							<li><a href="#">사이드ㆍ음료</a></li>
						</ul>
					</div>
					<!-- 컨텐츠 리스트 -->
					
					<div class="order_con" id="itemListMst">
						<div class="pd_list_wrapper">
						
						<ul>
							<c:forEach var="list" items="${list}" varStatus="status">
							
								<li>
									<a onclick="javascript:menuDetail('${list.code}');" class="btn_view" href="#" style="display:block;">
									<div class="img">
										<img alt="${list.name}" src="${list.filePath}" />
									</div>
									<strong class="tit">${list.name}</strong>
									<span class="eng">${list.engname}</span>
									<span class="cal">${calList[status.index]} kcal</span>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>	
					</div>
					 
				</div>
				<!--// index -->
			</div>
			<!--// sub content e -->
			<!-- 메뉴리스트 -->
		</div>

		</div>
			<input type="hidden" name="select" value="${select}">
	</form>	
		
		
<%@ include file="/WEB-INF/views/user/footer.jsp"%>


</body>
</html>