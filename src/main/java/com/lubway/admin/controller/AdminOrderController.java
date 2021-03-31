package com.lubway.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.board.Pagination;
import com.lubway.user.order.OrderCodeVO;
import com.lubway.user.order.service.OrderService;

@Controller
public class AdminOrderController {
	@Autowired
	private OrderService orderService;

	/** 글목록 요청  */
	@GetMapping("/getOrderList.mdo")
	public String getOrderList(OrderCodeVO vo, Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {

		System.out.println("글 목록 요청 처리");

		System.out.println("page : " + page);
		System.out.println("range : " + range);

		/** 전체 게시글 개수  */
		int listCnt = orderService.getPageListCnt();

		System.out.println("listCnt : " + listCnt);

		/** Pagination */
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		List<OrderCodeVO> pageList = orderService.getPageList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("orderList", pageList);

		return "getOrderList";
	}

	@RequestMapping(value = "/orderCnt.mdo", method = RequestMethod.GET)
	public String getPageListCnt() {

		System.out.println(orderService.getPageListCnt());

		return "getOrderList";
	}

	
}
