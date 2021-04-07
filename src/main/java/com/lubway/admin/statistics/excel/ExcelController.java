package com.lubway.admin.statistics.excel;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.statistics.StatPagination;
import com.lubway.admin.statistics.StatVO;
import com.lubway.admin.statistics.service.StatService;

@Controller
public class ExcelController {
	
	@Autowired
	private StatService statservice;

	//엑셀을 만드는 함수
	public Workbook makeExcel(StatPagination sp) throws Exception {

		//액셀 생성
		Workbook workbook = new XSSFWorkbook();
		//시트 생성
		Sheet sheet = workbook.createSheet("매출 현황");
		// 행,열 생성
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		
		//검색 조건 설정
		if(sp.getStore_name().equals("매장명 선택")) sp.setStore_name("");
		if(sp.getOrder_type().equals("수령 방식 선택")) sp.setOrder_type("");
		if(sp.getPayment_list().equals("결제 방식 선택")) sp.setPayment_list("");
		if(sp.getStart().equals("")) sp.setStart("1000-01-01 00:00:00");
		else sp.setStart(sp.getStart() + " 00:00:00");
		if(sp.getEnd().equals("")) sp.setEnd("3000-12-31 23:59:59");
		else sp.setEnd(sp.getEnd() + " 23:59:59");
		
		//검색 조건에 맞는 통계 결과를 가져옵니다.
		List<StatVO> list = statservice.getSearchOrderListForExcel(sp);
		//날짜 형식 변환
		for(StatVO v : list) v.setRequest(new SimpleDateFormat("yyyy-MM-dd").format(v.getOrder_time()));

		//시트 내 대표문구 설정
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,7)); //셀 병합
		cell.setCellValue("러브웨이 매장별 매출 현황");
		
		//스타일 설정
		XSSFCellStyle headerStyle = (XSSFCellStyle) workbook.createCellStyle();
		headerStyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(255,206,50)));
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setBorderBottom(BorderStyle.THIN);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);
		headerStyle.setBorderTop(BorderStyle.THIN);
		
		//폰트 설정
		Font headerFont = workbook.createFont();
	    headerFont.setFontName("맑은 고딕");
	    headerFont.setFontHeight((short)300);
	    headerFont.setBold(true);
	    headerStyle.setFont(headerFont);
		
	    //헤더에 스타일 적용
	    cell.setCellStyle(headerStyle);
		
	    //헤더 컨텐트 설정
		String[] headerKey = { "주문 날짜", "매장명", "수령 방식", "결제 방식", "결제 금액", "실 결제 금액", "쿠폰 결제 금액", "포인트 결제 금액" };
		row = sheet.createRow(rowNum++);
		for (int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		// 셀 너비 설정
		for (int i=0; i<=headerKey.length; i++){
		    sheet.autoSizeColumn(i);
		    sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+(short)1024);
		}

		// 검색 결과 엑셀에 삽입
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(rowNum++);
			StatVO vo = list.get(i);

			cell = row.createCell(0);
			cell.setCellValue(vo.getRequest());

			cell = row.createCell(1);
			cell.setCellValue(vo.getStore_name());

			cell = row.createCell(2);
			cell.setCellValue(vo.getOrder_type());

			cell = row.createCell(3);
			cell.setCellValue(vo.getPayment_list());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getTotal());
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getReal_total());
			
			cell = row.createCell(6);
			cell.setCellValue(vo.getCoupon());
			
			cell = row.createCell(7);
			cell.setCellValue(vo.getPoint());

		}
		return workbook;
	}

	//위에서 만들어진 엑셀을 다운로드하는 함수
	@RequestMapping(value="/excelDownload.mdo")
    public void excelDownload(@RequestParam("start")String start, @RequestParam("end")String end, 
    		@RequestParam("order_type")String order_type,
    		@RequestParam("payment_list")String payment_list,
    		@RequestParam("store_name")String store_name,
    		HttpServletResponse response, StatPagination sp) throws Exception {
       
		try {
			//검색 조건 설정
			sp.setStore_name(store_name);
			sp.setEnd(end);
			sp.setStart(start);
			sp.setOrder_type(order_type);
			sp.setPayment_list(payment_list);
			
			//액셀 생성
            Workbook workbook = makeExcel(sp);

            //파일명 설정
            String fileName = "매장별_매출현황";
            if(!start.trim().equals("") && !end.trim().equals("")) fileName = start + "_" + end + "_매출현황";
            System.out.println(fileName);
            response.setContentType("ms-vnd/excel");
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8") + ".xlsx");
            
            //다운로드 실행
            workbook.write(response.getOutputStream());
            workbook.close();
        } catch (Exception e) {
        	System.out.println("실패!!! " + e);
        }
    }

}
