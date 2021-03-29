package com.lubway.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.board.Pagination;
import com.lubway.user.order.OrderVO;
import com.lubway.user.order.service.OrderService;

@Controller
public class AdminOrderController {
	@Autowired
	private OrderService orderService;

	/** 검색 조건 목록 설정 */
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제품명", "MENUNAME");
		conditionMap.put("매장명", "STORE");
		return conditionMap;
	}

	/** 글목록 요청 */
	@GetMapping("/getOrderList.mdo")
	public String getOrderList(OrderVO vo, Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {

		System.out.println("글 목록 요청 처리");

		System.out.println("page : " + page);
		System.out.println("range : " + range);

		/** 전체 게시글 개수 */
		int listCnt = orderService.getPageListCnt();

		System.out.println("listCnt : " + listCnt);

		/** Pagination */
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		List<OrderVO> pageList = orderService.getPageList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("noticeList", pageList);

		return "getOrderList";
	}

	@RequestMapping(value = "/orderCnt.mdo", method = RequestMethod.GET)
	public String getPageListCnt() {

		System.out.println(orderService.getPageListCnt());

		return "getOrderList";
	}

	/** 검색기능 */
	@GetMapping("/orderSearch.mdo")
	public String searchPagingList(Model model, OrderVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam("searchKeyword") String searchKeyword) {

		Pagination pagination = new Pagination();
		int listCnt = orderService.getSearchTitleCnt(vo.getSearchKeyword());

		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("MENUNAME");
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");

		System.out.println(listCnt);
		pagination.pageInfoList(page, range, listCnt, searchKeyword);

		List<OrderVO> pageList = orderService.getSearchPagingList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("orderList", pageList);
		return "getOrderList";
	}

}
