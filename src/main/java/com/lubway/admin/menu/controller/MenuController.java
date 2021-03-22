package com.lubway.admin.menu.controller;

import java.io.IOException;
import java.io.InputStream;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lubway.admin.AwsS3;
import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.MorningVO;
import com.lubway.admin.menu.NutrientVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;
import com.lubway.admin.menu.service.MenuService;

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
		String bucket = "lubway/menu";
		awss3.upload(is, key, contentType, contentLength, bucket);

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
		model.addAttribute("select", "sandwich");
		return "menu/menuList";
	}

	@PostMapping("/menuListTab.mdo")
	public String selectList(Model model, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo,
			MorningVO mvo, DrinkVO dvo, String select) {
		model.addAttribute("select", select);
		if (select.equals("cookie")) {
			model.addAttribute("List", menuservice.selectCookieList(cvo));
		} else if (select.equals("sandwich")) {
			model.addAttribute("List", menuservice.selectSandwichList(Svo));
		} else if (select.equals("wrap")) {
			model.addAttribute("List", menuservice.selectWrapList(wvo));
		} else if (select.equals("was")) {
			model.addAttribute("List", menuservice.selectWASList(wasvo));
		} else if (select.equals("morning")) {
			model.addAttribute("List", menuservice.selectMorningList(mvo));
		} else if (select.equals("drink")) {
			model.addAttribute("List", menuservice.selectDrinkList(dvo));
		} else if (select.equals("salad")) {
			model.addAttribute("List", menuservice.selectSaladList(svo));
		}

		return "menu/menuList";
	}

	@RequestMapping("/menuDetail.mdo")
	public String content(Model model, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo,
			MorningVO mvo, DrinkVO dvo ,NutrientVO nvo, String code, String select) {

		System.out.println("select : " + select);
		model.addAttribute("select", select);
		
		switch (select) {
		case "sandwich" : model.addAttribute("update", menuservice.selectSandwich(Svo));
						  model.addAttribute("nutrient", menuservice.selectNutrient(nvo));
						  System.out.println(menuservice.selectSandwich(Svo).getFilePath());
						  break;
		case "wrap"     : model.addAttribute("update", menuservice.selectWrap(wvo)); 
						  model.addAttribute("nutrient", menuservice.selectNutrient(nvo));
						  break;
		case "salad"    : model.addAttribute("update", menuservice.selectSalad(svo));
						  model.addAttribute("nutrient", menuservice.selectNutrient(nvo));
						  break;
		case "drink"    : model.addAttribute("update", menuservice.selectDrink(dvo));
						  model.addAttribute("nutrient", menuservice.selectNutrient(nvo));
						  break;
		case "morning"  : model.addAttribute("update", menuservice.selectMorning(mvo));
						  model.addAttribute("nutrient", menuservice.selectNutrient(nvo));
						  break;
		case "cookie"   : model.addAttribute("update", menuservice.selectCookie(cvo));
						  model.addAttribute("nutrient", menuservice.selectNutrient(nvo));
						  break;
		case "was"      : model.addAttribute("update", menuservice.selectWAS(wasvo));
						  model.addAttribute("nutrient", menuservice.selectNutrient(nvo));
						  break;
		default         : break;
		}

		return "menu/menuDetail";
	}
}
