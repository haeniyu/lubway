<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가맹 신청·문의</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/subway_favicon.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/writeInquiry.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/header.jsp"%>
 <!-- container s -->
 <div class="bg_type01" id="container">
	<!-- sub content s -->
	<div id="content">
		<div class="inquiry_wrapper">
			<h2 class="subTitle">가맹신청ㆍ문의</h2>
			<div class="content">
				<form action="insertInquiry.do" name="form" method="post">
					<h3 class="h_title">문의 작성하기</h3>
					<!-- board list s -->
					<div class="board_write_wrapper">
						<p class="rt_note">
							필수입력사항<span class="ess"></span>
						</p>
						<table>
							<caption>문의 작성하기 테이블</caption>
							<colgroup>
								<col width="130px" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="col">이름<span class="ess"></span></th>
									<td>${user.name }
									<input type="hidden" name="name" value="${user.name }"></td>
								</tr>
								<tr>
									<th scope="col">연락처<span class="ess"></span></th>
									<td>${user.tel }<input type="hidden" name="tel" value="${user.tel }"></td>
								</tr>
								<c:if test="${kuser == null}">
									<tr>
										<th scope="col">이메일<span class="ess"></span></th>
											<td>${user.id }<input type="hidden" name="email" value="${user.id }"></td>
									</tr>
								</c:if>
								<tr>
									<th scope="col">지역<span class="ess"></span></th>
									<td>
										<div class="form_select" style="width: 196px;">
											<select name="area" >
												<option value="">시/도</option>
												<option value="서울특별시">서울특별시</option>
												<option value="경기도">경기도</option>
												<option value="인천광역시">인천광역시</option>
												<option value="대전광역시">대전광역시</option>
												<option value="세종특별자치시">세종특별자치시</option>
												<option value="충청남도">충청남도</option>
												<option value="경상남도">경상남도</option>
												<option value="울산광역시">울산광역시</option>
												<option value="부산광역시">부산광역시</option>
												<option value="대구광역시">대구광역시</option>
												<option value="제주특별자치도">제주특별자치도</option>
												<option value="전라북도">전라북도</option>
												<option value="충청북도">충청북도</option>
												<option value="광주광역시">광주광역시</option>
												<option value="전라남도">전라남도</option>
												<option value="경상북도">경상북도</option>
												<option value="강원도">강원도</option>
											</select>
										</div>
					
									</td>
								</tr>
								<tr>
									<th scope="col">제목<span class="ess"></span></th>
									<td><span class="form_text" style="width: 100%"> <input
											maxlength="50" name="title" placeholder="제목을 입력해주세요" type="text"/>
									</span></td>
								</tr>
								<tr>
									<th scope="col">내용<span class="ess"></span></th>
									<td><span class="form_textarea" style="width: 100%">
											<textarea cols="5" maxlength="500" name="content"
												placeholder="가맹점 신청과 관련된 문의사항을 작성해 주세요. &#13;&#10;문의하실 내용을 구체적으로 작성해 주시면 더욱 빠르고 정확한 답변을 드릴 수 있습니다."
												rows="10" style="height: 230px;"></textarea>
									</span></td>
								</tr>
								
							</tbody>
						</table>

						<div class="agree_info">
							<p>신청·문의사항에 대한 답변은 입력하신 연락처로 개별 연락드립니다. 동의하시겠습니까?</p>
							<!-- checkbox -->
							<label class="form_checkbox"> <input name="agree3"
								type="checkbox" required/> <span class="icon"></span>예, 동의합니다.
							</label>
							<!--// checkbox -->
						</div>

						<div class="inquiry_notice">
							<ul>
								<li>· 문의가 집중되거나 주말의 경우 답변이 지연될 수 있습니다. 최대한 빠르게 답변 드리도록
									하겠습니다.</li>
								<li>· 욕설, 비속어, 비방성 등의 부적절한 단어 포함되어 있는 경우, 답변 진행이 어려울 수
									있습니다.</li>
							</ul>
						</div>
					</div>
					<div class="btns_wrapper">
						<a class="btn bgc_point i_reg" href="javascript:void(0);" id="submitBtn" style="width: 170px;"><span>등록하기</span></a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--// sub content e -->
</div>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>