<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/salesStatus.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
   //이전 버튼 이벤트
   function fn_prev(page, range, rangeSize, searchKeyword) {
      var page = ((range - 2) * rangeSize) + 1;
      var range = range - 1;
      var url = "${pageContext.request.contextPath}/search.mdo";
      url = url + "?page=" + page;
      url = url + "&range=" + range;
      url = url + "&searchKeyword=" + searchKeyword;
      location.href = url;
   }

   //페이지 번호 클릭
   function fn_pagination(page, range, rangeSize, searchKeyword, fix) {
      var url = "${pageContext.request.contextPath}/search.mdo";
      url = url + "?page=" + page;
      url = url + "&range=" + range;
      url = url + "&searchKeyword=" + searchKeyword;
      location.href = url;
   }
   
   //다음 버튼 이벤트
   function fn_next(page, range, rangeSize, searchKeyword) {
      var page = parseInt((range * rangeSize)) + 1;
      var range = parseInt(range) + 1;
      var url = "${pageContext.request.contextPath}/search.mdo";
      url = url + "?page=" + page;
      url = url + "&range=" + range;
      url = url + "&searchKeyword=" + searchKeyword;
      location.href = url;
   }
</script>
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/store/header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">
    	<!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">매출 현황</h1>
        <p class="mb-4"></p>
        <div class="card shadow mb-4">
        	<div class="card-header py-3">
            	<h6 class="m-0 font-weight-bold text-warning">Sales Status</h6>
            </div>
            <div class="card-body">
               	<div class="chart chart1">차트  들어가는 자리</div><div class="chart chart2">차트 두개 들오가욤</div>
                     	
				<!-- 기간, 메뉴 타입, 메뉴 선택 및 검색 시작 -->
				<div class="searchDate">
					<!-- 날짜 선택 -->
					<strong>날짜 선택 : </strong>
					<input type="date" name="start" class="selectDate start" style="margin-left: 5px;">
					<strong> - </strong>
					<input type="date" name="end" class="selectDate end">
				</div>
				<div class="searchMenu">
					<!-- 메뉴 타입 선택 -->
					<strong>메뉴 선택 : </strong>
					<select class="btn btn-primary dropdown-toggle" style="margin: 5px 5px 10px 5px">
						<option>메뉴 카테고리</option>
						<option>샌드위치</option>
						<option>샐러드</option>
						<option>랩 기타</option>
						<option>사이드 음료</option>
					</select>
					<!-- 선택한 메뉴 타입에 따른 메뉴명 선택 -->
					<select class="btn btn-primary dropdown-toggle" style="margin: 5px 0 10px 0">
						<option>메뉴명 선택</option>
					</select>
					<input style="margin: 5px 0 10px 0; padding: 5px" class="btn btn-warning btn-icon-split" type="submit" value="search" />
				</div>
				<span class="num">총<strong> 0 </strong>건</span>
				<!-- 기간, 메뉴 타입, 메뉴 선택 및 검색  종료 -->
				
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th style="width: 15%">주문 날짜</th>
                                <th style="width: 20%">매뉴 타입</th>
                                <th style="width: 20%">메뉴명</th>
                                <th style="width: 20%">수령 방식</th>
                                <th style="width: 25%">결제 방식</th>
                                <th style="width: 25%">결제 금액</th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- 메뉴별로 띄워주세욤 -->
                            <tr>
                                <td>SDW001</td>
                                <td>로스트 치킨</td>
                                <td>프레쉬&라이트</td>
                                <td>5</td>
                                <td>29,500</td>
                                <td>29,500</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
				<!-- 페이지 네비게이션 (페이지 알고리즘 관련) 출력 -->
				<div align="center">
					<ul class="pagination">
						<c:if test="${pagination.prev}">
							<li class="page-item">
								<a class="page-link" href="#" onClick="fn_prev('${pagination.page}','${pagination.range}',
									'${pagination.rangeSize}','${pagination.searchKeyword }')">Prev</a>
							</li>
						</c:if>
						<c:forEach begin="${pagination.startPage}"
							end="${pagination.endPage}" var="idx">
							<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
								<a class="page-link" href="#" onClick="fn_pagination('${idx}','${pagination.range}',
									'${pagination.rangeSize}','${pagination.searchKeyword }','${pagination.fix }')"> ${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${pagination.next}">
							<li class="page-item">
								<a class="page-link" href="#" onClick="fn_next('${pagination.page}','${pagination.range}', 
									'${pagination.rangeSize}','${pagination.searchKeyword }')">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/store/footer.jsp"%>
</body>
</html>