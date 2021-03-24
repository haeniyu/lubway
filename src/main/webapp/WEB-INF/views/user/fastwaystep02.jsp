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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
      $(document).ready(function() {
		var select = $("#sand").val();
		console.log(select);
		
          //When page loads...
         
          $("ul.select li:first").addClass("active").show(); //Activate first tab
          $(".order_con:first").show(); //Show first tab content
              

          //On Click Event
          $("ul.select li").click(function() {
        	  var select = $("#sand").val();
              
        	  $("ul.select li").removeClass("active"); //Remove any "active" class
              $(this).addClass("active"); //Add "active" class to selected tab
              update();
              
              
              
              
              
           	  
              
              return false;
          });
              
              function update(){
            	  var select = $("#sand").val();
            	  $.ajax({
        				url : '/lubway/fastway/fastwaystep02.do?select=' + select,
        				type : 'post',
        				success : function() {
        					alert("성공");
        					$("#itemListMst").load(window.location.href + "#itemListMst");
        				},
        				error : function() {
        					alert("인증에 실패하였습니다.");
        					
        				}
        		});
              }
          
          function menuDetail(code){
        	  var code = $(this).val();
          }

      });
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/header.jsp"%>
<<<<<<< HEAD

	<div class="content">
		<!-- container s -->
		<div id="container">
			<div id="content" class="order  fast_sub">
				<!-- fast_sub / home_sub -->
=======
	<form action="">
    <div class="content">
            <!-- container s -->
        <div id="container">
			<div id="content" class="order  fast_sub"> <!-- fast_sub / home_sub -->
>>>>>>> 2c97ff9794195b5626cc97f4fba17033931b31af
				<!-- index -->
				<div class="menu_list">
					<div class="order_title">
						<h3>Fast-Sub</h3>
						<p>온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</p>
					</div>
					<div class="tab02">
<<<<<<< HEAD
						<ul class="select" id="select" >
							<li class="" ><a href="step02Tab.do" onclick="update();">샌드위치<input id="sand" type="hidden" value="sandwich"></a></li>
							<li ><a href="step02Tab.do" >찹샐러드<input type="hidden" value="salad"></a></li>
							<li ><a href="step02Tab.do" >사이드ㆍ음료<input type="hidden" value="side"></a></li>
							<li ><a href="step02Tab.do" >랩ㆍ기타<input type="hidden" value="wrap"></a></li>
=======
						<ul class="list_menu">

							<li><a href="#">샌드위치</a></li>
							<li><a href="#">랩ㆍ기타</a></li>
							<li><a href="#">찹샐러드</a></li>
							<li><a href="#">사이드ㆍ음료</a></li>
>>>>>>> 2c97ff9794195b5626cc97f4fba17033931b31af
						</ul>
					</div>
					
					<!-- 컨텐츠 리스트 -->
					
					<div class="order_con" id="itemListMst">
<<<<<<< HEAD
					<div class="pd_list_wrapper" id="list_wrapper">
=======
						<div class="pd_list_wrapper">
						
>>>>>>> 2c97ff9794195b5626cc97f4fba17033931b31af
						<ul>
							<c:forEach var="list" items="${list}" varStatus="status">
							
								<li>
<<<<<<< HEAD
								<a onclick="javascript:menuDetail('${list.code}');" class="btn_view" href="#" style="display:block;">
								<div class="img">
								<img alt="${list.name}" src="${list.filePath}" />
								</div> 
								<strong class="tit">${list.name}</strong>
								<span class="eng">${list.engname}</span> <span class="cal">${calList[status.index]} kcal</span> 
								</a>
								</li>
							</c:forEach>
						</ul>
					</div>
=======
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
>>>>>>> 2c97ff9794195b5626cc97f4fba17033931b31af
					</div>
					 
				</div>
				<!--// index -->
			</div>
			<!--// sub content e -->
			<!-- 메뉴리스트 -->
		</div>
<<<<<<< HEAD
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
=======

		</div>
			<input type="hidden" name="select" value="${select}">
	</form>	
		
		
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
>>>>>>> 2c97ff9794195b5626cc97f4fba17033931b31af


</body>
</html>