<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Franchise</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.mypage.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ui.common.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/step01.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/franchise.css" />
</head>
<body>
<!-- sub content s -->
<%@ include file="/WEB-INF/views/user/header.jsp"%>
			<div id="content">
				<h2 class="subTitle">러브웨이 프랜차이즈</h2>

				<div class="franchise_wrapper">
					<p class="summary">
						미국 프랜차이즈 1위! 러브웨이는 매장수 및 분포지역 기준, <br />
						Quick Service Restaurant(QSR) 부분 No.1 프랜차이즈입니다.
					</p>
					<!-- 전세계 매장수 -->
					<div class="store_wrapper">
						<div class="nation hover">
							<div class="inner">
								<p><span>전세계</span></p>
								<strong>106</strong>개국
							</div>
						</div>
						<div class="store">
							<div class="inner">
								<p><span>매장수</span></p>
								<strong>40,906</strong>개
							</div>
						</div>
					</div>
					<!--// 전세계 매장수 -->

					<!-- 써브웨이 브랜드 경쟁력 -->
					<div class="barnd_comp">
						<h3 class="h_title">러브웨이 브랜드 경쟁력</h3>
						<ul>
							<li>
								<div class="img"><img alt=">BRAND POWER" src="${path}/resources/images/franchise/img_barnd_comp01.jpg" /></div>
								<h4>BRAND<br />POWER</h4>
								<ul>
									<li>· 세계 1위 프랜차이즈로서의 브랜드가치</li>
									<li>· 전세계 4만 1천여 개 매장으로 검증된 안정성</li>
									<li>· 글로벌 브랜드 관리 및 지원 - 신제품 개발, 브랜드 가치<br />향상, 스탠더드 관리</li>
								</ul>
							</li>
							<li>
								<div class="img"><img alt="WELL-BEING" src="${path}/resources/images/franchise/img_barnd_comp02.jpg" /></div>
								<h4>WELL<br />-BEING</h4>
								<ul>
									<li>· 건강한 식재료 공급을 통한 균형잡힌 메뉴 제공</li>
									<li>· 아이들에게도 안심하고 먹을 수 있는 영양식</li>
									<li>· 신뢰할 수 있는 영양정보 제공</li>
								</ul>
							</li>
							<li>
								<div class="img"><img alt="MADE FRESH" src="${path}/resources/images/franchise/img_barnd_comp03.jpg" /></div>
								<h4>MADE<br />FRESH</h4>
								<ul>
									<li>· Fresh Baked Bread - 매장에서 매일 갓 구워낸 빵 제공</li>
									<li>· Made To Order - 취향대로 재료 선택 가능</li>
									<li>· Fresh Vegetable - 매장에서 매일 준비되는 신선한 야채</li>
								</ul>
							</li>
							<li>
								<div class="img"><img alt="SMART INVESTMENT" src="${path}/resources/images/franchise/img_barnd_comp04.jpg" /></div><!-- 20180213 -->
								<h4>SMART<br />INVESTMENT</h4><!-- 20180213 -->
								<ul>
									<li>· 빠른 ROI - 최적의 비지니스 모델 제공</li>
									<li>· 체계적인 오퍼레이션 - 용이한 직원 교육 가능</li>
									<li>· 효율적인 인력 운영 - 인력 운영 시스템 및 체계적인 교육 제공</li>
									<li>· 빠른 테이블 회전율과 엄격한 재고 관리</li>
								</ul>
							</li>
						</ul>
					</div>
					<!--// 써브웨이 브랜드 경쟁력 -->

					<!-- 가맹점 개설 절차 -->
					<div class="franchise_process">
						<h3> 가맹점 개설 절차</h3>
						<p class="summary">높은 수익성과 탁월한 안정성이 전세계 106개국, 41,000여개 매장으로 검증된 글로벌 No.1 프랜차이즈 러브웨이<br />체계화된 성공 노하우와 함께 새로운 비즈니스의 시작을 준비하십시오.</p>

						<div class="step_wrapper">
							<ol>
								<li>
									<div class="step">
										<em>STEP1</em>
										<strong>신청서 작성 및 상담</strong>
									</div>
									<ul>
										<li>· 가맹과 경영에 대한<br />정보 상담</li>
									</ul>
								</li>
								<li>
									<div class="step">
										<em>STEP2</em>
										<strong>가맹계약 체결</strong>
									</div>
									<ul>
										<li>· 계약서 작성</li>
										<li>· 가맹비 입금</li>
									</ul>
								</li>
								<li>
									<div class="step">
										<em>STEP3</em>
										<strong>상권분석 및 선정</strong>
									</div>
									<ul>
										<li>· 상권조사 / 입지분석</li>
										<li>· 매장 결정</li>
										<li>· 공사일정 협의</li>
									</ul>
								</li>
								<li>
									<div class="step">
										<em>STEP4</em>
										<strong>오픈 준비</strong>
									</div>
									<ul>
										<li>· 설계도 확정 / 장비주문</li>
										<li>· 인테리어 공사</li>
										<li>· 가맹교육 / 매장 실습</li>
									</ul>
								</li>
								<li>
									<div class="step">
										<em>STEP5</em>
										<strong>매장 오픈</strong>
									</div>
									<ul>
										<li>· 직원교육</li>
										<li>· 운영테스트</li>
										<li>· 그랜드오픈</li>
									</ul>
								</li>
							</ol>
							<p class="text">※ 가맹 신청부터 매장 오픈까지 최소 2달 이상 소요됩니다.</p>
						</div>
					</div>
					<!--// 가맹점 개설 절차 -->

					<!-- 예상 투자비용 -->
					<div class="invertment_expense">
						<h3 class="h_title">예상 투자비용</h3>
						<!-- board list s -->
						<div class="board_list_wrapper">
							<div class="content">
								<div class="cont_right">
									<p>VAT 별도, 25평 기준</p>
								</div>

								<table>
									<caption>예상 투자비용 테이블</caption>
									<colgroup>
										<col width="270px" />
										<col width="270px" />
										<col width="*" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">항목</th>
											<th scope="col">금액</th>
											<th scope="col" style="text-align:center;">내용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">가맹비</th>
											<td>14,889,000원</td>
											<td>소멸성</td>
										</tr>
										<tr>
											<th scope="row">교육비</th>
											<td>없음</td>
											<td>교육에 대한 추가 비용 없음</td>
										</tr>
										<tr>
											<th scope="row">장비 및 기자재</th>
											<td>12,000만원</td>
											<td>샌드위치 유니트, 브래드 오븐, 스피드 오븐, 전자레인지, 냉장냉동시설, 주방설비 및 집기, 커피머신, CCTV, 음향장비, 가구 및 인테리어 소품 등</td>
										</tr>
										<tr>
											<th scope="row">인테리어<br />(간판 및 철거비용 제외)</th>
											<td>200만원~210만원/평당</td>
											<td>가설, 전기, 바닥, 벽체, 천정, 설비, 출입문 철거 및 조성, 장비세팅, 기본덕트, 스프링쿨러 등</td>
										</tr>
										<tr>
											<th scope="row">간판</th>
											<td>410만원</td>
											<td>H:450mm / 1면 기준, 어닝 포함</td>
										</tr>
										<tr>
											<th scope="row">전기증설</th>
											<td>150만원</td>
											<td>10KW증설</td>
										</tr>
										<tr>
											<th scope="row">냉난방</th>
											<td>450만원</td>
											<td>32평형 시스템1, 벽걸이(냉난방)1, 배관비</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<th scope="row">합계</th>
											<td>약 2억 원~2억 1천만원</td>
											<td>총 비용은 경우에 따라 변동 될 수 있습니다.</td>
										</tr>
									</tfoot>
								</table>

								<ul class="notice">
									<li>※ 일반 매장 최소 전용면적은 25평이며, 공항, 백화점, 병원 등 특수상권 매장은 25평 이하로 선택적 입점 가능</li>
									<li>※ 별도 비용 : 외부공사(갈바, 데크 등), 추가공사(철거, 자동문 등), 전기 간선작업, 건물의 공사 준수사항에 따른 비용 등 매장 여건에 따라 투자비용이 달라질 수 있습니다</li>
								</ul>

								<div class="btns_wrapper">
									<a class="btn bgc_point i_arr" href="/lubway/franchiseInquiry.do" style="width:160px;"><span>가맹신청/문의</span></a>
								</div>
							</div>
						</div>
						<!-- board list e -->
					</div>
					<!--// 예상 투자비용 -->

				</div>
			</div>
			<!--// sub content e -->
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>