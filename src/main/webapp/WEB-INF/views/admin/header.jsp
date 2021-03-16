<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>LUBWAY ADMIN</title>

    <!-- Custom fonts for this template-->
    <link href="${path}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${path}/resources/css/sb-admin-2.css" rel="stylesheet">
</head>
<body>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center"
				href="main.mdo">
				<div class="sidebar-brand-icon">
					<img class="img-profile rounded-circle" src="${path}/resources/images/logo.png">
				</div>
				<div class="sidebar-brand-text mx-3">LUBWAY</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="main.mdo"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">메뉴</div>

			<!-- Nav Item - 회원관리 Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>회원관리</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Manage Customer:</h6>
						<a class="collapse-item" href="/lubway/getuserlist.mdo">회원 관리</a>
						<a class="collapse-item" href="buttons.html">쿠폰</a> <a
							class="collapse-item" href="cards.html">포인트</a>
					</div>
				</div></li>

			<!-- Nav Item - 매장관리 Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>매장관리</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Manage Store:</h6>
						<a class="collapse-item" href="/lubway/getstorelist.mdo">매장 관리</a> 
						<a class="collapse-item" href="/lubway/insertstore.mdo">매장 계정 등록</a>
					</div>
				</div></li>

			<!-- Nav Item - 주문조회  -->
			<li class="nav-item"><a class="nav-link" href="#">
					<i class="fas fa-fw fa-chart-area"></i> <span>주문조회</span>
			</a></li>

			<!-- Nav Item - 매출현황 -->
			<li class="nav-item"><a class="nav-link" href="#">
					<i class="fas fa-fw fa-chart-area"></i> <span>매출현황</span>
			</a></li>

			<!-- Nav Item - 메뉴관리 -->
			<li class="nav-item"><a class="nav-link" href="#">
					<i class="fas fa-fw fa-table"></i> <span>메뉴관리</span>
			</a></li>

			<!-- Nav Item - 가맹점 문의 조회 -->
			<li class="nav-item"><a class="nav-link" href="#">
					<i class="fas fa-fw fa-table"></i> <span>가맹점 문의 조회</span>
			</a></li>

			<!-- Nav Item - 사이트관리 Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseThree"
				aria-expanded="true" aria-controls="collapseThree"> <i
					class="fas fa-fw fa-cog"></i> <span>사이트관리</span>
			</a>
				<div id="collapseThree" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Manage Site:</h6>
						<a class="collapse-item" href="#">배너</a> <a class="collapse-item"
							href="#">이벤트</a> <a class="collapse-item" href="/lubway/getNoticeList.mdo">공지사항</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</ul>
		<!-- End of Sidebar -->
		
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자 계정</span>
                                <img class="img-profile rounded-circle"
                                    src="${path}/resources/images/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
		
		
</body>
</html>