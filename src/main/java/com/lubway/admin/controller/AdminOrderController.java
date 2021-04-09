package com.lubway.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.TotalOrderVO;
import com.lubway.admin.board.Pagination;
import com.lubway.admin.service.TotalOrderService;
import com.lubway.user.order.OrderCodeVO;

@Controller
public class AdminOrderController {
	@Autowired
	private TotalOrderService totalOrderService;

	/** 주문 목록 요청  */
	@GetMapping("/getOrderList.mdo")
	public String getOrderList(OrderCodeVO vo, Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {

		/** 전체 게시글 개수  */
		int listCnt = totalOrderService.getTotalListCnt();

		/** Pagination */
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		List<TotalOrderVO> pageList = totalOrderService.getTotalList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("orderList", pageList);
		model.addAttribute("cnt", listCnt);

		return "getOrderList";
	}

	
	/**
	 * 검색 결과 페이지 이동
	 */
	@GetMapping("searchOrderByName.mdo")
	public String searchOrderByName(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam("searchKeyword") String searchKeyword,
			Model model, TotalOrderVO vo) {
		
		Pagination pagination = new Pagination();
		int cnt = totalOrderService.getSearchCnt(vo.getSearchKeyword());
		
		pagination.pageInfoList(page, range, cnt, searchKeyword);

		List<TotalOrderVO> pageList = totalOrderService.getSearchPagingList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("orderList", pageList);
		model.addAttribute("cnt", cnt);
		
		return "getOrderList";
	}
	
	
}
