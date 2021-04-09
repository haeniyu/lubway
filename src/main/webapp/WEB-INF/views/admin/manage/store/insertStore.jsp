<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 등록</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('.timepicker').timepicker({
	    timeFormat: 'HH:mm',
	    interval: 30,
	    startTime: '00:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	
	function setTime() {
		var open = $("#open").val();
		var close = $("#close").val();
		var addr = $("#address").val();

		var openField = document.createElement("input");
		openField.setAttribute("type", "hidden");
		openField.setAttribute("name", "openTime");
		openField.setAttribute("value", open);

		var closeField = document.createElement("input");
		closeField.setAttribute("type", "hidden");
		closeField.setAttribute("name", "closeTime");
		closeField.setAttribute("value", close);

		var addrField = document.createElement("input");
		addrField.setAttribute("type", "hidden");
		addrField.setAttribute("name", "addr");
		addrField.setAttribute("value", addr);

		document.form.appendChild(openField);
		document.form.appendChild(closeField);
		document.form.appendChild(addrField);
		document.form.submit();
	}

	$("#saveBtn").on("click", function() {
		if ($("#area").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#area").focus();
			return;
		} else if ($("#store_tel").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#store_tel").focus();
			return;
		} else if ($("#code").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#code").focus();
			return;
		} else if ($("#id").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#id").focus();
			return;
		} else if ($("#password").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#password").focus();
			return;
		} else if ($("#storename").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#storename").focus();
			return;
		} else if ($("#close").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#close").focus();
			return;
		} else if ($("#open").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#open").focus();
			return;
		} else if ($("#parking").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#parking").focus();
			return;
		} else if ($("#postcode").val().trim() == '') {
			alert("모든 정보를 기입해주세요.");
			$("#postcode").focus();
			return;
		}
		setTime();
	});
	
});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
<style type="text/css">
.addr{
	border: 1px solid #D3D4E3;
	border-radius: 5px;
	height: 35px;
}
</style>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/views/admin/header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">매장 관리</h1>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">매장 등록</h6>
			</div>
			<form name="form" id="form" role="form" method="post" action="insertstoreproc.mdo">
			<div class="card-body">
					<div class="mb-3">
						<label for="area">지역구</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="area" id="area" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="storename">점포명</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="storename" id="storename" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="code">매장코드</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="code" id="code" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="id">아이디</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="id" id="id" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="password">비밀번호</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="password" id="password" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="store_tel">전화번호</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="store_tel"
								id="store_tel" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="open">오픈시간</label>
						<div class="col-sm-3">
							<input autocomplete="off" type="text" class="form-control timepicker" id="open" required>
						</div>
						<label for="close">마감시간</label>
						<div class="col-sm-3">
							<input autocomplete="off" type="text" class="form-control timepicker" id="close" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="parking">주차정보</label>
						<div class="form-group row">
							<div class="col-sm-1">
								<input type="radio" name="parking"
									id="parking" style="width:20px;height:20px;" value="가능">
									<label for="가능">가능</label>
							</div>
							<div class="col-sm-1">
								<input type="radio" name="parking" style="width:20px;height:20px;" value="불가능">
									<label for="불가능">불가능</label>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label>주소</label><br>
						<input type="text" id="postcode" class="addr" name="zipcode" placeholder="우편번호">
						<input type="button" onclick="execDaumPostcode()" class="btn btn-sm btn-primary" value="우편번호 찾기"><br>
						<input type="text" id="address" name="address_load" class="addr" style="width: 500px; margin: 10px 0;" placeholder="주소"><br>
						<input type="text" id="detailAddress" class="addr" name="address_detail" placeholder="상세주소">
						<input type="text" id="extraAddress" class="addr" placeholder="참고항목">
					</div>
					<br>
					<hr>
				<div>
					<button type="button" class="btn btn-sm btn-primary" id="saveBtn">저장</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>

