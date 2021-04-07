package com.lubway.admin.statistics.excel;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
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

		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("매출 현황");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		
		if(sp.getStore_name().equals("매장명 선택")) sp.setStore_name("");
		if(sp.getOrder_type().equals("수령 방식 선택")) sp.setOrder_type("");
		if(sp.getPayment_list().equals("결제 방식 선택")) sp.setPayment_list("");
		
		if(sp.getStart().equals("")) sp.setStart("1000-01-01 00:00:00");
		else sp.setStart(sp.getStart() + " 00:00:00");
		if(sp.getEnd().equals("")) sp.setEnd("3000-12-31 23:59:59");
		else sp.setEnd(sp.getEnd() + " 23:59:59");
		List<StatVO> list = statservice.getSearchOrderListForExcel(sp);
		for(StatVO v : list) v.setRequest(new SimpleDateFormat("yyyy-MM-dd").format(v.getOrder_time()));

		row = sheet.createRow(rowNum++);
		
		String[] headerKey = { "주문 날짜", "매장명", "수령 방식", "결제 방식", "결제 금액", "실 결제 금액", "쿠폰 결제 금액", "포인트 결제 금액" };
		
		for (int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}

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
			cell.setCellValue(vo.getTotal_price());
			
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
    public void excelDownload(@RequestParam("start")String start, @RequestParam("end")String end, @RequestParam("order_type")String order_type,
    		@RequestParam("payment_list")String payment_list, @RequestParam("store_name")String store_name,
    		HttpServletResponse response,StatPagination sp) throws Exception {
       
		try {
			sp.setStore_name(store_name);
			sp.setEnd(end);
			sp.setStart(start);
			sp.setOrder_type(order_type);
			sp.setPayment_list(payment_list);
			
            Workbook workbook = makeExcel(sp);
            
            //String fileName = new SimpleDateFormat("yyyy-MM-dd").format(start) + "-" + new SimpleDateFormat("yyyy-MM-dd").format(end);
            
            response.setContentType("ms-vnd/excel");
            //response.setHeader("Content-Disposition", "attachment;filename="+ fileName +".xlsx");
            response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");
            
            workbook.write(response.getOutputStream());
            workbook.close();
        } catch (Exception e) {
        	System.out.println("실패!!!");
        }
    }

}
