<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAST-WAY > 메뉴 선택</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.order.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/menu.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/jquery-ui-1.12.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".m_salad").hide();
	$(".m_wrap").hide();
	$(".m_side").hide();
	
	$("input:radio[name=selectmenu]").click(function(){
		var temp = $(this).val();
		console.log(temp);
	    if(temp == "sandwich") {
	      $(".m_sandwich").show();
	      $(".m_salad").hide();
	      $(".m_wrap").hide();
	      $(".m_side").hide();
	    }else if(temp == "salad"){
	    	$(".m_salad").show();
	        $(".m_sandwich").hide();
	        $(".m_wrap").hide();
	        $(".m_side").hide();
	   }else if(temp == "wrap"){
	    	$(".m_wrap").show();
	        $(".m_sandwich").hide();
	        $(".m_salad").hide();
	        $(".m_side").hide();
	   }else if(temp == "side"){
	    	$(".m_side").show();
	        $(".m_sandwich").hide();
	        $(".m_wrap").hide();
	        $(".m_salad").hide();
	   }
	});
});
</script>
<style type="text/css">
input[type="radio"]{display: none;}
input[type="radio"] + label {display: block; cursor: pointer; padding: 25px;}
input[type="radio"]:checked + label {background-color: #009223; color: #FFF;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
<!-- container s -->
<div id="container">
	<!-- sub content s -->
	<div class="order fast_sub" id="content">
		<!-- index -->
				<div class="menu_list">
					<div class="order_title">
						<h3>Fast-Way</h3>
						<p>온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</p>
					</div>
					<div class="tab02">
						<ul class="selectMenu">
							<li><input type="radio" name="selectmenu" value="sandwich" id="sandwich" checked="checked"><label for="sandwich">샌드위치</label></li>
							<li><input type="radio" name="selectmenu" value="salad" id="salad"><label for="salad">샐러드</label></li>
							<li><input type="radio" name="selectmenu" value="wrap" id="wrap"><label for="wrap">랩ㆍ기타</label></li>
							<li><input type="radio" name="selectmenu" value="side" id="side"><label for="side">사이드ㆍ음료</label></li>
						</ul>
					</div>
					<!-- 컨텐츠 리스트 -->
					<div class="order_con" id="itemListMst">
						<div class="pd_list_wrapper m_sandwich" id="list_wrapper">
						<ul>
							<c:forEach var="sandwich" items="${sandwich}" varStatus="status">
								<li>
								<a onclick="javascript:menuDetail('${sandwich.code}');" class="btn_view" href="#" style="display:block;">
								<span class="img">
								<img src="${sandwich.filePath}" />
								</span> 
								<strong class="tit">${sandwich.name}</strong>
								<span class="eng">${sandwich.engname}</span> <span class="cal">${calSand[status.index]} kcal</span> 
								</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="pd_list_wrapper m_salad" id="list_wrapper">			
						<ul>
							<c:forEach var="salad" items="${salad}" varStatus="status">
								<li>
								<a onclick="javascript:menuDetail('${salad.code}');" class="btn_view" href="#" style="display:block;">
								<span class="img">
								<img alt="${salad.name}" src="${salad.filePath}" />
								</span> 
								<strong class="tit">${salad.name}</strong>
								<span class="eng">${salad.engname}</span> <span class="cal">${calSal[status.index]} kcal</span> 
								</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="pd_list_wrapper m_wrap" id="list_wrapper">	
						<ul>
							<c:forEach var="wrap" items="${wrap}" varStatus="status">
								<li>
								<a onclick="javascript:menuDetail('${wrap.code}');" class="btn_view" href="#" style="display:block;">
								<span class="img">
								<img alt="${wrap.name}" src="${wrap.filePath}" />
								</span> 
								<strong class="tit">${wrap.name}</strong>
								<span class="eng">${wrap.engname}</span> <span class="cal">${calWrap[status.index]} kcal</span> 
								</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="pd_list_wrapper m_side" id="list_wrapper">
						<ul>
							<c:forEach var="update" items="${update}" varStatus="status">
								<li>
								<a onclick="javascript:menuDetail('${update.code}');" class="btn_view" href="#" style="display:block;">
								<span class="img">
								<img alt="${update.name}" src="${update.filePath}" />
								</span> 
								<strong class="tit">${update.name}</strong>
								<span class="eng">${update.engname}</span> <span class="cal">${calList[status.index]} kcal</span> 
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
		</div>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>