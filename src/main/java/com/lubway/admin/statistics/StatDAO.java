package com.lubway.admin.statistics;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	/**	금일 매출 */
	public Integer getTodaySales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getTodaySales");
	}
	
	/**	월 매출 */
	public Integer getThisMonthSales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getThisMonthSales");
	}

	/**	연 매출 */
	public Integer getThisYearSales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getThisYearSales");
	}
	
	/**	주문내역 총 데이터 수 */
	public int getBasicStatCnt() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getBasicStatCnt");
	}
	
	/**	검색 주문내역 데이터 수 */
	public int getSearchStatCnt(StatPagination page) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getSearchStatCnt", page);
	}
	
	/**	총 데이터 Chart */
	public List<StatVO> getBasicStat() {
		return sqlSessionTemplate.selectList("StatisticsDAO.getBasicStat");
	}
	
	/**	총 데이터 정보 */
	public List<StatVO> getBasicOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getBasicOrderList", page);
	}
	
	/**	검색 주문내역 AreaChart */
	public List<StatVO> getSearchStat(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchStat", page);
	}
	
	/**	검색 데이터 정보 */
	public List<StatVO> getSearchOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchOrderList", page);
	}
	
	
	/**	품목별 주문내역 총 데이터 수 */
	public int getProductBasicStatCnt() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getProductBasicStatCnt");
	}

	/**	품목별 검색 주문내역 데이터 수 */
	public int getProductSearchStatCnt(StatPagination page) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getProductSearchStatCnt", page);
	}
	
	/** 매장관리자 대시보드 일매출  */
	public Integer getStoreTodaySales(String store_name) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getStoreTodaySales", store_name);
	}
	
	/** 매장관리자 대시보드 월매출  */
	public Integer getStoreMonthSales(String store_name) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getStoreMonthSales", store_name);
	}
	
	/** 매장관리자 대시보드 연매출  */
	public Integer getStoreYearSales(String store_name) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getStoreYearSales", store_name);
	}
	
	/** 매장별 검색X 데이터 수 */
	public int getNotSearchStatCnt(StatPagination page) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getNotSearchStatCnt", page);
	}
	
	/** 매장별 검색X 데이터 정보 */
	public List<StatVO> getNotSelectSerchOrderList(StatPagination page){
		return sqlSessionTemplate.selectList("StatisticsDAO.getNotSelectSerchOrderList",page);
	}
	
	/** 매장별 검색X 데이터 정보 */
	public List<StatVO> getNotSearchStat(StatPagination page){
		return sqlSessionTemplate.selectList("StatisticsDAO.getNotSearchStat",page);
	}
	
	/**	품목별 총 데이터 Chart */
	public List<StatVO> getProductBasicStat() {
		return sqlSessionTemplate.selectList("StatisticsDAO.getProductBasicStat");
	}
	
	/** 품목별 총 데이터 TypeChart */
	public StatVO getProductBasicTypeStat() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getProductBasicTypeStat");
	}
	
	/**	품목별 총 데이터 정보 */
	public List<StatVO> getProductBasicOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getProductBasicOrderList", page);
	}
	
	/**	품목별 검색 주문내역 LineChart */
	public List<StatVO> getProductSearchStat(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getProductSearchStat", page);
	}
	
	/**	품목별 검색 데이터 정보 */
	public List<StatVO> getProductSearchOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getProductSearchOrderList", page);
	}
	
	/**	품목별 검색 주문내역 TypeChart */
	public StatVO getProductSearchTypeStat(StatPagination page) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getProductSearchTypeStat", page);
	}

	/**	품목별 검색X 주문내역 데이터 수 */
	public int getNotProductSearchStatCnt(StatPagination page) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getNotProductSearchStatCnt", page);
	}
	
	/**	품목별 검색X 주문내역 LineChart */
	public List<StatVO> getNotProductSearchStat(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getNotProductSearchStat", page);
	}
	
	/**	품목별 검색X 데이터 정보 */
	public List<StatVO> getNotProductSearchOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getNotProductSearchOrderList", page);
	}
	
	/** 메뉴 타입 선택시 메뉴명 얻기 */
	public List<String> getMenuName(String select) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getMenuName", select);
	}
	
	/** 매장별 엑셀&PDF */
	public List<StatVO> getSearchOrderListForExcel(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchOrderListForExcel", page);
	}
	
	/** 매장별 검색X 엑셀&PDF */
	public List<StatVO> getNotSearchOrderListForExcel(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getNotSearchOrderListForExcel", page);
	}
	
	/** 품목별 엑셀&PDF */
	public List<StatVO> getProductSearchOrderListForExcel(StatPagination page){
		return sqlSessionTemplate.selectList("StatisticsDAO.getProductSearchOrderListForExcel", page);
	}
	
	/** 품목별 검색X 엑셀&PDF */
	public List<StatVO> getNotProductSearchOrderListForExcel(StatPagination page){
		return sqlSessionTemplate.selectList("StatisticsDAO.getNotProductSearchOrderListForExcel", page);
	}
}
