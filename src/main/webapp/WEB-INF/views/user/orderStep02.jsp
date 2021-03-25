<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/fastway.css" />
<head>
<meta charset="UTF-8">
<title>fastway/Step02</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

	var select = "";
	
	$(document).ready(function() {

		//When page loads...
		$("ul.select li:first").addClass("active").show(); //Activate first tab
		$(".order_con:first").show(); //Show first tab content

		// 최초 페이지 접근시 sandwich 정보 출력
		select = "sandwich";
		update(select);
		
		//On Click Event
		$("ul.select li").click(function() {
			select = $(this).attr("id");
			
			$("ul.select li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			
			update(select);

		});//end click function
			
	});//end document.ready
	
	function update(select) {
		$.ajax({
			url : '/lubway/changeCategory.do?select=' + select,
			type : 'post',
			success : function(data) {
//			console.log("ajax : 통신 성공");
				console.log("=== Ajax result data ===");
				console.log(data);
				insertInfo(data);
			},
			error : function(data, status, opt) {
		        alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+opt);
		    }
		});//end ajax
		
	}//end update
	
	function insertInfo(data) {
		var elem = "";

		if(data.length == 5) {
			var menu = data[0];
			var menu2 = data[1];
			var menu3 = data[2];
			var nutrient = data[3];
			var nutrient2 = data[4];
		} else {
			var menu = data[0];
			var nutrient = data[1];
		}
		
		
		for(var i=0; i<menu.length; i++) {
			elem += '<li><a onclick="javascript:selectDetail(';
			elem += "'" + menu[i].code + "'";
			elem += ');" class="btn_view" href="#" style="display:block;">';
			elem += '<div class="img"><img alt="' + menu[i].name + '" src="' + menu[i].filePath + '"/></div><p>';
			elem += '<strong class="mainname">' + menu[i].name + '</strong>';
			elem += '<span class="eng_name">' + menu[i].engname + '</span>';
			elem += '<span class="kcal"><em>' + nutrient[i] + ' kcal</em></span></p></a></li>';
			document.getElementById("getList").innerHTML = elem;
		}
		
		if(data.length == 5) {
			for(var i=0; i<menu2.length; i++) {
				elem += '<li><a onclick="javascript:selectSide(';
				elem += "'" + menu2[i].code + "'";
				elem += ');" class="btn_view" href="#" style="display:block;">';
				elem += '<div class="img"><img alt="' + menu2[i].name + '" src="' + menu2[i].filePath + '"/></div><p>';
				elem += '<strong class="mainname">' + menu2[i].name + '</strong>';
				elem += '<span class="eng_name">' + menu2[i].engname + '</span>';
				elem += '<span class="kcal"><em>' + nutrient2[i] + ' kcal</em></span></p></a></li>';
				document.getElementById("getList").innerHTML = elem;
			}
			
			for(var i=0; i<menu3.length; i++) {
				elem += '<li><a onclick="javascript:selectDetail(';
				elem += "'" + menu3[i].code + "'";
				elem += ');" class="btn_view" href="#" style="display:block;">';
				elem += '<div class="img"><img alt="' + menu3[i].name + '" src="' + menu3[i].filePath + '"/></div><p>';
				elem += '<strong class="mainname">' + menu3[i].name + '</strong>';
				elem += '<span class="eng_name">' + menu3[i].engname + '</span>';
				elem += '</p></a></li>';
				document.getElementById("getList").innerHTML = elem;
				
			}
		}
		
	}//end insertInfo function
	
	// 메뉴 선택시 실행되는 함수
	function selectDetail(data,whatWay,franchiseNo) {
		console.log("=== [function] selectDetail ===");
		
		// data는 선택된 메뉴의 code값임
		console.log("선택 메뉴 종류 : " + select);
		console.log("선택 메뉴 code : " + data);
		$("#code").val(data);
		$("#orderForm").submit();
		
	}//end selectDetail function
	
	// 사이드 메뉴 선택시 실행되는 함수 ( 쿠키제외 - 추가적으로 처리해야 함 )
	function selectSide(data, whatWay, franchiseNo) {
		console.log("=== [function] selectSide ===");
		
		
		// data는 선택된 메뉴의 code값임
		console.log("선택 메뉴 종류 : " + select);
		console.log("선택 메뉴 code : " + data);
		$("#code").val(data);
		$("#orderForm").submit();
	}//end selectSide function
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
	<div class="content">
		<!-- container s -->
		<div id="container">
			<div id="content" class="order  fast_sub">
				<!-- fast_sub / home_sub -->
				<!-- index -->
				<div class="menu_list">
					<div class="order_title">
						<h3>Fast-Way</h3>
						<p>온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</p>
					</div>
					<div class="tab02">
						<ul class="select" id="select" >
							<li id="sandwich"><a href="#">샌드위치</a></li>
							<li id="wrap"><a href="#">랩ㆍ기타</a></li>
							<li id="salad"><a href="#">찹샐러드</a></li>
							<li id="side"><a href="#">사이드ㆍ음료</a></li>
						</ul>
					</div>			
					<!-- 컨텐츠 리스트 -->
					<div class="order_con" id="itemListMst">
						<div class="pd_list_wrapper" id="list_wrapper">
							<ul id="getList">
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
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
	<!-- 주문 상세 페이지 이동 -->
	<form action="orderStep02Detail.do" method="post" id="orderForm" style="display: none;">
		<input type="hidden" id="code" name="code" value="">
		<input type="hidden" name="whatWay" value="${whatWay}">
		<input type="hidden" id="franchiseNo" name="franchiseNo" value="${franchiseNo}">
	</form> 
</body>
</html>