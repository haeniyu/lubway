package com.lubway.admin.statistics.pdf;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.lubway.admin.statistics.StatPagination;
import com.lubway.admin.statistics.StatVO;
import com.lubway.admin.statistics.service.StatService;

@Controller
public class PDFController {
	
	@Autowired
	private StatService statservice;
	
	/** 매장별 - PDF 생성 */
	private Document makePdf(StatPagination sp, String fileName, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			Document document = null;
			
		try {
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
			
			//PDF 생성
			document = new Document();
			
	        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8") + ".pdf");
	        
			PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
	 		writer.setInitialLeading(12.5f);
			document.setMargins(10, 10, 20, 20);
			document.open();
			
			//폰트 설정
			BaseFont baseFont = BaseFont.createFont(request.getServletContext().getRealPath("resources/font/NanumGothic.ttf"),
					BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
			Font font = new Font(baseFont,10);
			
			//테이블 생성
			PdfPTable table = new PdfPTable(8);
			table.setWidths(new int[]{3, 2, 2, 2, 2, 2, 2, 2});
			
			//타이틀 설정
			Chunk chunk = new Chunk("러브웨이 매장별 매출 현황", font); // 타이틀 객체를 생성 (타이틀의 이름을 장바구니로 하고 위에 있는 font를 사용)
            Paragraph ph = new Paragraph(chunk);
            ph.setAlignment(Element.ALIGN_CENTER);
            document.add(ph); // 문단을 만들어서 가운데 정렬 (타이틀의 이름을 가운데 정렬한다는 뜻)
 
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE); // 줄바꿈 (왜냐하면 타이틀에서 두줄을 내린후에 셀(테이블)이 나오기 때문)
 
            
            PdfPCell cell1 = new PdfPCell(new Phrase("주문 날짜", font)); // 셀의 이름과 폰트를 지정해서 셀을 생성한다.
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER); // 셀의 정렬방식을 지정한다. (가운데정렬)
            cell1.setPadding(3);

            PdfPCell cell2 = new PdfPCell(new Phrase("매장명", font));
            cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            PdfPCell cell3 = new PdfPCell(new Phrase("수령 방식", font));
            cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            PdfPCell cell4 = new PdfPCell(new Phrase("결제 방식", font));
            cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            PdfPCell cell5 = new PdfPCell(new Phrase("결제 금액", font));
            cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            PdfPCell cell6 = new PdfPCell(new Phrase("실 결제 금액", font));
            cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            PdfPCell cell7 = new PdfPCell(new Phrase("쿠폰 결제 금액", font));
            cell7.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            PdfPCell cell8 = new PdfPCell(new Phrase("포인트 결제 금액", font));
            cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            //테이블에 생성된 셀 삽입
            table.addCell(cell1);
            table.addCell(cell2);
            table.addCell(cell3);
            table.addCell(cell4);
            table.addCell(cell5);
            table.addCell(cell6);
            table.addCell(cell7);
            table.addCell(cell8);

            
           //검색 결과 데이터를 삽입
            for (int i=0; i< list.size(); i++) {
            	StatVO vo = list.get(i);
            	
            	PdfPCell cellOrderDate = new PdfPCell(new Phrase(vo.getRequest(), font));
            	PdfPCell cellStoreName = new PdfPCell(new Phrase(vo.getStore_name(), font));
            	PdfPCell cellOrderType = new PdfPCell(new Phrase(vo.getOrder_type(), font));
            	PdfPCell cellPaymentList = new PdfPCell(new Phrase(vo.getPayment_list(), font));
            	PdfPCell cellTotal = new PdfPCell(new Phrase(String.valueOf(vo.getTotal()), font));
            	PdfPCell cellRealTotal = new PdfPCell(new Phrase(String.valueOf(vo.getReal_total()), font));
            	PdfPCell cellCoupon = new PdfPCell(new Phrase(String.valueOf(vo.getCoupon()), font));
            	PdfPCell cellPoint = new PdfPCell(new Phrase(String.valueOf(vo.getPoint()), font));	
            	
            	table.addCell(cellOrderDate);
            	table.addCell(cellStoreName);
            	table.addCell(cellOrderType);
            	table.addCell(cellPaymentList);
            	table.addCell(cellTotal);
            	table.addCell(cellRealTotal);
            	table.addCell(cellCoupon);
            	table.addCell(cellPoint);
            	
            }
			document.add(table);
			document.close();
		}catch (Exception e) {
			System.out.println("만드는거부터 실패!!!~!~!~!" +  e);
		}
		return document;
	}
	
	
	/** 매장별 - PDF 다운로드 */
	@RequestMapping(value="/pdfDownload.mdo")
    public void pdfDownload(@RequestParam("start")String start, @RequestParam("end")String end, 
    		@RequestParam("order_type")String order_type, @RequestParam("payment_list")String payment_list,
    		@RequestParam("store_name")String store_name,
    		HttpServletRequest request, HttpServletResponse response,
    		StatPagination sp) throws Exception {
       
		try {
			//검색 조건 설정
			sp.setStore_name(store_name);
			sp.setEnd(end);
			sp.setStart(start);
			sp.setOrder_type(order_type);
			sp.setPayment_list(payment_list);
			
			//파일명 설정
	        String fileName = "매장별_매출현황";
	        if(!start.trim().equals("") && !end.trim().equals("")) fileName = start + "_" + end + "_매출현황";
            
            //PDF 생성
            makePdf(sp, fileName, request, response);
	        
        } catch (Exception e) {
        	System.out.println("실패!!! " + e);
        }
    }
	
	
	
	/** 품목별 - PDF 생성 */
	private Document makePdfForMenu(StatPagination sp, String fileName, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Document document = null;
		
		try {
			//검색 조건 설정
			if(sp.getMenu_type().equals("메뉴 카테고리")) sp.setMenu_type("");
			if(sp.getMenu_name().equals("메뉴명 선택")) sp.setMenu_name("");
			if(sp.getOrder_type().equals("수령 방식 선택")) sp.setOrder_type("");
			if(sp.getPayment_list().equals("결제 방식 선택")) sp.setPayment_list("");
			if(sp.getStart().equals("")) sp.setStart("1000-01-01 00:00:00");
			else sp.setStart(sp.getStart() + " 00:00:00");
			if(sp.getEnd().equals("")) sp.setEnd("3000-12-31 23:59:59");
			else sp.setEnd(sp.getEnd() + " 23:59:59");
			
			//검색 조건에 맞는 통계 결과를 가져옵니다.
			List<StatVO> list = statservice.getProductSearchOrderListForExcel(sp);
			//날짜 형식 변환
			for(StatVO v : list) v.setRequest(new SimpleDateFormat("yyyy-MM-dd").format(v.getOrder_time()));
			
			//PDF 생성
			document = new Document();
			
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8") + ".pdf");
			
			PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
			writer.setInitialLeading(12.5f);
			document.setMargins(0, 0, 20, 20);
			document.open();
			
			//폰트 설정
			BaseFont baseFont = BaseFont.createFont(request.getServletContext().getRealPath("resources/font/NanumGothic.ttf"),
					BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
			Font font = new Font(baseFont,10);
			
			//테이블 생성
			PdfPTable table = new PdfPTable(9);
			table.setWidths(new int[]{3, 3, 3, 2, 3, 2, 2, 2, 2});
			
			//타이틀 설정
			Chunk chunk = new Chunk("러브웨이 품목별 매출 현황", font); // 타이틀 객체를 생성 (타이틀의 이름을 장바구니로 하고 위에 있는 font를 사용)
			Paragraph ph = new Paragraph(chunk);
			ph.setAlignment(Element.ALIGN_CENTER);
			document.add(ph); // 문단을 만들어서 가운데 정렬 (타이틀의 이름을 가운데 정렬한다는 뜻)
			
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE); // 줄바꿈 (왜냐하면 타이틀에서 두줄을 내린후에 셀(테이블)이 나오기 때문)
			
			
			PdfPCell cell1 = new PdfPCell(new Phrase("주문 날짜", font)); // 셀의 이름과 폰트를 지정해서 셀을 생성한다.
			cell1.setHorizontalAlignment(Element.ALIGN_CENTER); // 셀의 정렬방식을 지정한다. (가운데정렬)
			cell1.setPadding(3);
			
			PdfPCell cell2 = new PdfPCell(new Phrase("메뉴 타입", font));
			cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
			
			PdfPCell cell3 = new PdfPCell(new Phrase("메뉴명", font));
			cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			
			PdfPCell cell4 = new PdfPCell(new Phrase("수령 방식", font));
			cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
			
			PdfPCell cell5 = new PdfPCell(new Phrase("결제 방식", font));
			cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
			
			PdfPCell cell6 = new PdfPCell(new Phrase("결제 금액", font));
			cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			
			PdfPCell cell7 = new PdfPCell(new Phrase("세트 금액", font));
			cell7.setHorizontalAlignment(Element.ALIGN_CENTER);
			
			PdfPCell cell8 = new PdfPCell(new Phrase("토핑 금액", font));
			cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
			
			PdfPCell cell9 = new PdfPCell(new Phrase("단품 금액", font));
			cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			
			//테이블에 생성된 셀 삽입
			table.addCell(cell1);
			table.addCell(cell2);
			table.addCell(cell3);
			table.addCell(cell4);
			table.addCell(cell5);
			table.addCell(cell6);
			table.addCell(cell7);
			table.addCell(cell8);
			table.addCell(cell9);
			
			
			//검색 결과 데이터를 삽입
			for (int i=0; i< list.size(); i++) {
				StatVO vo = list.get(i);
				
				PdfPCell cellOrderDate = new PdfPCell(new Phrase(vo.getRequest(), font));
				PdfPCell cellMenuType = new PdfPCell(new Phrase(vo.getMenu_type(), font));
				PdfPCell cellMenuName = new PdfPCell(new Phrase(vo.getMenu_name(), font));
				PdfPCell cellOrderType = new PdfPCell(new Phrase(vo.getOrder_type(), font));
				PdfPCell cellPaymentList = new PdfPCell(new Phrase(vo.getPayment_list(), font));
				PdfPCell cellTotalPrice = new PdfPCell(new Phrase(String.valueOf(vo.getTotal_price()),font));
				PdfPCell cellSetPrice = new PdfPCell(new Phrase(String.valueOf(vo.getSet_price()),font));
				PdfPCell cellToppingPrice = new PdfPCell(new Phrase(String.valueOf(vo.getTopping_price()),font));
				PdfPCell cellSinglePrice = new PdfPCell(new Phrase(String.valueOf(vo.getSingle_price()),font));
				
				table.addCell(cellOrderDate);
				table.addCell(cellMenuType);
				table.addCell(cellMenuName);
				table.addCell(cellOrderType);
				table.addCell(cellPaymentList);
				table.addCell(cellTotalPrice);
				table.addCell(cellSetPrice);
				table.addCell(cellToppingPrice);
				table.addCell(cellSinglePrice);
				
			}
			document.add(table);
			document.close();
		}catch (Exception e) {
			System.out.println("만드는거부터 실패!!!~!~!~!" +  e);
		}
		return document;
	}
	
	
	/** 품목별 - PDF 다운로드 */
	@RequestMapping("/pdfDownloadForMenu.mdo")
	public void pdfDownloadForMenu(@RequestParam("start")String start, @RequestParam("end")String end, 
    		@RequestParam("order_type")String order_type,
    		@RequestParam("payment_list")String payment_list,
    		@RequestParam("menu_type")String menu_type,
    		@RequestParam("menu_name")String menu_name,
    		HttpServletResponse response, HttpServletRequest request,
    		StatPagination sp) throws Exception {
		
		try {
			//검색 조건 설정
			sp.setEnd(end);
			sp.setStart(start);
			sp.setOrder_type(order_type);
			sp.setPayment_list(payment_list);
			sp.setMenu_type(menu_type);
			sp.setMenu_name(menu_name);
			
			//파일명 설정
			String fileName = "품목별_매출현황";
			if(!start.trim().equals("") && !end.trim().equals("")) fileName = start + "_" + end + "_매출현황";
			
			//PDF 생성
			makePdfForMenu(sp, fileName, request, response);
			
		} catch (Exception e) {
			System.out.println("실패!!! " + e);
		}
	}

}
