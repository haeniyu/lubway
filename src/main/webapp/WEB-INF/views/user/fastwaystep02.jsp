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
      $(document).ready(function() {
		var selected = $("#sand").val();
		console.log(selected);
		
          //When page loads...
          $("ul.select li:first").addClass("active").show(); //Activate first tab
          $(".order_con:first").show(); //Show first tab content
          
          //On Click Event
          $("ul.select li").click(function() {
	          $("ul.select li").removeClass("active"); //Remove any "active" class
	          $(this).addClass("active"); //Add "active" class to selected tab
            
              update();
              return false;
          });
              function update(){
            	  var select = selected;
            	  $.ajax({
        				url : '/lubway/fastway/step02Tab.do?select=' + select,
        				type : 'post',
        				success : function(data) {
        				},
        				error : function(data) {
        					alert("인증에 실패하였습니다.");
        				}
        		});
              }

      });
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
						<h3>Fast-Sub</h3>
						<p>온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</p>
					</div>
					<div class="tab02">
						<ul class="select" id="select" >
							<li class="" ><a href="step02Tab.do" onclick="update();">샌드위치<input id="sand" type="hidden" value="sandwich"></a></li>
							<li ><a href="step02Tab.do" onclick="update();" >찹샐러드<input id="sand" type="hidden" value="salad"></a></li>
							<li ><a href="step02Tab.do" onclick="update();">사이드ㆍ음료<input id="sand" type="hidden" value="side"></a></li>
							<li ><a href="step02Tab.do" onclick="update();">랩ㆍ기타<input id="sand" type="hidden" value="wrap"></a></li>
						</ul>
					</div>
					
					<!-- 컨텐츠 리스트 -->
					<div class="order_con" id="itemListMst">
					<div class="pd_list_wrapper" id="list_wrapper">
						<ul>
							<c:forEach var="update" items="${update}" varStatus="status">
								<li>
								<a onclick="javascript:menuDetail('${update.code}');" class="btn_view" href="#" style="display:block;">
								<div class="img">
								<img alt="${update.name}" src="${update.filePath}" />
								</div> 
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
			<!-- 메뉴리스트 -->
		</div>
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>

</body>
</html>