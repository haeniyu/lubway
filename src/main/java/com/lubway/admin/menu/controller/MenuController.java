package com.lubway.admin.menu.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lubway.admin.AwsS3;
import com.lubway.admin.board.NoticeVO;
import com.lubway.admin.board.Pagination;
import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.MorningVO;
import com.lubway.admin.menu.NutrientVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;
import com.lubway.admin.menu.service.CookieService;
import com.lubway.admin.menu.service.MenuService;
import com.lubway.admin.menu.service.SandwichService;

@Controller
public class MenuController {

	@Autowired
	private MenuService menuservice;

	public AwsS3 awss3 = AwsS3.getInstance();

	@GetMapping("/menu.mdo")
	public String menu() {
		return "menu/menu";
	}

	@PostMapping("/menuInsert.mdo")
	public String insertMenu(NutrientVO nvo, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo,
			SaladVO svo, MorningVO mvo, DrinkVO dvo, @RequestParam("select") String select,
			@RequestParam("uploadImg") MultipartFile multipart, RedirectAttributes rttr) throws IOException, PSQLException {

		// aws s3 파일 업로드 처리
		InputStream is = multipart.getInputStream();
		String key = multipart.getOriginalFilename();
		String contentType = multipart.getContentType();
		long contentLength = multipart.getSize();
		awss3.upload(is, key, contentType, contentLength);

		String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/menu/" + key;

		if (select.equals("cookie")) {
			System.out.println(filePath.toString());
			cvo.setFilePath(filePath);
			menuservice.insertCookie(nvo, cvo);
		} else if (select.equals("sandwich")) {
			System.out.println(Svo.toString());
			Svo.setFilePath(filePath);
			menuservice.insertSandwich(nvo, Svo);
		} else if (select.equals("wrap")) {
			wvo.setFilePath(filePath);
			menuservice.insertWrap(nvo, wvo);
		} else if (select.equals("was")) {
			wasvo.setFilePath(filePath);
			menuservice.insertWAS(nvo, wasvo);
		} else if (select.equals("salad")) {
			svo.setFilePath(filePath);
			menuservice.insertSalad(nvo, svo);
		} else if (select.equals("morning")) {
			mvo.setFilePath(filePath);
			menuservice.insertMorning(nvo, mvo);
		} else if (select.equals("drink")) {
			dvo.setFilePath(filePath);
			menuservice.insertDrink(dvo);
		}
		
		rttr.addFlashAttribute("select","select");
		return "redirect:/menuList.mdo";
	}

	@GetMapping("/menuList.mdo")
	public String sandwichList(Model model, SandwichVO vo) throws IOException, PSQLException {
		model.addAttribute("List", menuservice.selectSandwichList(vo));
		return "menu/menuList";
	}

	@PostMapping("/menuListTab.mdo")
	public String selectList(Model model, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo,
			MorningVO mvo, DrinkVO dvo, @RequestParam("select") String select) {
		if (select.equals("cookie")) {
			menuservice.selectCookieList(cvo);
			model.addAttribute("List", menuservice.selectCookieList(cvo));
		} else if (select.equals("sandwich")) {
			menuservice.selectSandwichList(Svo);
			model.addAttribute("List", menuservice.selectSandwichList(Svo));
		} else if (select.equals("wrap")) {
			menuservice.selectWrapList(wvo);
			model.addAttribute("List", menuservice.selectWrapList(wvo));
		} else if (select.equals("was")) {
			menuservice.selectWASList(wasvo);
			model.addAttribute("List", menuservice.selectWASList(wasvo));
		} else if (select.equals("morning")) {
			menuservice.selectMorningList(mvo);
			model.addAttribute("List", menuservice.selectMorningList(mvo));
		} else if (select.equals("drink")) {
			menuservice.selectDrinkList(dvo);
			model.addAttribute("List", menuservice.selectDrinkList(dvo));
		} else if (select.equals("salad")) {
			menuservice.selectSaladList(svo);
			model.addAttribute("List", menuservice.selectSaladList(svo));
		}
		return "menu/menuList";
	}
}
