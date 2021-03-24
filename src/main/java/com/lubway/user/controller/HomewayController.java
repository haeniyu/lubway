package com.lubway.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lubway.store.StoreInfoVO;
import com.lubway.user.service.HomewayService;

/** 홈웨이 주문 컨트롤러 */
@Controller
@RequestMapping("/homeway/")
public class HomewayController {
	
	@Autowired
	HomewayService homewayService;
	
	/** 홈웨이 step01 - 매장 찾기 및 선택 페이지 이동 */
	@GetMapping("step01.do")
	public String homewayView() {
		return "homeway";
	}
	
	/** 홈웨이가 가능한 매장 리스트 추출하여 배열로 리턴 */
	@PostMapping("searchStore.do")
	@ResponseBody
	public StoreInfoVO[] homewayStore(String keyword) {
	
		List<StoreInfoVO> info = homewayService.homewayStore(keyword);
		
		StoreInfoVO[] arr = new StoreInfoVO[info.size()];
		for(int i=0; i<arr.length; i++) {
			arr[i] = info.get(i);
			System.out.println(arr[i].toString());
		}
		
		return arr;
	}

	/** 주소 값 확인용 */
	@PostMapping("orderStart.do")
	public String order(String fullAddr, String basicAddr, String detailAddr, String whatWay, String franchiseNo) {
		
		System.out.println("기본 주소 : " + basicAddr);
		System.out.println("상세 주소 : " + detailAddr);
		System.out.println("전체 주소 : " + fullAddr);
		
		System.out.println("주문 방식 : " + whatWay);
		System.out.println("no : " + franchiseNo);
		
		return "main";
	}
	
}
