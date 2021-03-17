<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- footer -->
	<div id="footer">
		<div class="content">
			<!-- util menu -->
			<div class="util_menu">
				<ul>
					<li><a href="/agreement">이용약관</a></li>
					<li><a href="/privacy"><strong>개인정보처리방침</strong></a></li>
					<li><a href="/lubway/login.sdo" target="_blank">점주관리자</a></li>
				</ul>
			</div>
			<!--// util menu -->

			<span class="addr">서울시 서초구 강남대로 535 프린스빌딩 15층</span> <span
				class="rep">대표 : 콜린클락</span> <span class="tel">전화 :
				02-797-5036</span> <span class="rep">사업자등록번호 : 101-84-04143</span>
			<p class="copyright">SUBWAY® is a Registered Trademark of Subway
				IP LLC. © 2021 Subway IP LLC. All Rights Reserved.</p>
			<a class="sns_area instagram"
				href="https://www.instagram.com/subwaykorea" target="_blank">instagram</a>
			<a class="sns_area fackbook" href="https://www.facebook.com/Subwaykr"
				target="_blank">facebook</a>
		</div>
	</div>
	<script type="text/javascript"
		src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript"
		src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="${path}/resources/slick/slick.min.js"></script>
	<script type="text/javascript">
		$('.banner').slick({
			slidesToShow : 1,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 2000,
		});
	</script>
</body>
</html>