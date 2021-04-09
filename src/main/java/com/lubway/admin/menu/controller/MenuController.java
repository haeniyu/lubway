package com.lubway.admin.menu.controller;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.logging.LogException;
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

	/** 관리자 메뉴 등록 페이지 */
	@GetMapping("/menu.mdo")
	public String menu() {
		return "menu/menu";
	}

	/** 관리자 메뉴 등록 */
	@PostMapping("/menuInsert.mdo")
	public String insertMenu(NutrientVO nvo, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo,
			SaladVO svo, MorningVO mvo, DrinkVO dvo, @RequestParam("typeSelect") String select,
			MultipartFile uploadImg, RedirectAttributes rttr, String price15) throws IOException, PSQLException {

		System.out.println(uploadImg);
		
		/** aws s3 파일 업로드 처리 */
		InputStream is = uploadImg.getInputStream();
		String key = uploadImg.getOriginalFilename();
		String contentType = uploadImg.getContentType();
		long contentLength = uploadImg.getSize();
		
		/** 파일 업로드 경로 지정 */
		String bucket = "lubway/menu";
		awss3.upload(is, key, contentType, contentLength, bucket);

		String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/menu/" + key;

		/** select 비교해서 DB에 넣기 */
		if (select.equals("cookie")) {
			System.out.println(filePath.toString());
			cvo.setFilePath(filePath);
			System.out.println(cvo.toString());
			menuservice.insertCookie(nvo, cvo);
		} else if (select.equals("sandwich")) {
			System.out.println(Svo.toString());
			Svo.setFilePath(filePath);
			Svo.setPrice(price15);
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

	/** 관리자 메뉴 목록 default-sandwich */
	@GetMapping("/menuList.mdo")
	public String sandwichList(Model model, String select) throws IOException, PSQLException {
		model.addAttribute("select", select);
		model.addAttribute("List", menuservice.selectSandwichList());
		model.addAttribute("select", "sandwich");
		return "menu/menuList";
	}

	/** select-메뉴별 리스트 보여주기 */
	@PostMapping("/menuListTab.mdo")
	public String selectList(Model model, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo,
			MorningVO mvo, DrinkVO dvo, String select) {
		model.addAttribute("select", select);
		if (select.equals("cookie")) {
			model.addAttribute("List", menuservice.selectCookieList(cvo));
		} else if (select.equals("sandwich")) {
			model.addAttribute("List", menuservice.selectSandwichList());
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
	
	/** 관리자 메뉴 상세 페이지 */
	@RequestMapping("/menuDetail.mdo")
	public String content(Model model, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo,
			MorningVO mvo, DrinkVO dvo ,NutrientVO nvo, String code, String select) {

		System.out.println("select : " + select);
		System.out.println("code : " + code);
		model.addAttribute("select", select);
		model.addAttribute("code",code);
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
						  System.out.println(menuservice.selectSalad(svo).toString());
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
	
	/** 관리자 메뉴 수정 */
	@PostMapping("/menuUpdate.mdo")
	String update(Model model, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo,
			MorningVO mvo, DrinkVO dvo ,NutrientVO nvo, String code,String select,String filepath, MultipartFile uploadImg) throws PSQLException, LogException, IOException {
		
		switch (select) {
		case "sandwich" : 
						SandwichVO sand = menuservice.selectSandwich(Svo);
						if(Svo.getFilePath() == null) Svo.setFilePath(sand.getFilePath());
						
						int sandIndex = sand.getFilePath().indexOf("/", 20);
						String sandKey = sand.getFilePath().substring(sandIndex+1);
						
						if(!uploadImg.getOriginalFilename().equals("")) {
							if(!sandKey.equals("menu/" + uploadImg)) {
								awss3.delete(sandKey);
								
								InputStream is = uploadImg.getInputStream();
								String uploadKey = uploadImg.getOriginalFilename();
								String contentType = uploadImg.getContentType();
								long contentLength = uploadImg.getSize();
								
								String bucket = "lubway/menu";
								
								awss3.upload(is, uploadKey, contentType, contentLength, bucket);
								
								String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/menu/" + uploadKey;
								
								Svo.setFilePath(filePath);
							}
						}
						  menuservice.updateSandwich(nvo, Svo);
						  System.out.println("sandwich: 들어옴");
						  break;
						  
		case "wrap"     : WrapVO wrap = menuservice.selectWrap(wvo);
						  if(wvo.getFilePath() == null) wvo.setFilePath(wrap.getFilePath());
						  
						  int wrapIndex = wrap.getFilePath().indexOf("/", 20);
							String wrapKey = wrap.getFilePath().substring(wrapIndex+1);
							
							if(!uploadImg.getOriginalFilename().equals("")) {
								if(!wrapKey.equals("menu/" + uploadImg)) {
									awss3.delete(wrapKey);
									
									InputStream is = uploadImg.getInputStream();
									String uploadKey = uploadImg.getOriginalFilename();
									String contentType = uploadImg.getContentType();
									long contentLength = uploadImg.getSize();
									
									String bucket = "lubway/menu";
									
									awss3.upload(is, uploadKey, contentType, contentLength, bucket);
									
									String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/menu/" + uploadKey;
									
									wvo.setFilePath(filePath);
								}
							}
						  
						  menuservice.updateWrap(nvo, wvo);
						  System.out.println("wrap: 들어옴");
						  break;
						  
		case "salad"    : SaladVO salad = menuservice.selectSalad(svo);
						  if(svo.getFilePath() == null) svo.setFilePath(salad.getFilePath());
						  
						  int saladIndex = salad.getFilePath().indexOf("/", 20);
							String saladKey = salad.getFilePath().substring(saladIndex+1);
							
							if(!uploadImg.getOriginalFilename().equals("")) {
								if(!saladKey.equals("menu/" + uploadImg)) {
									awss3.delete(saladKey);
									
									InputStream is = uploadImg.getInputStream();
									String uploadKey = uploadImg.getOriginalFilename();
									String contentType = uploadImg.getContentType();
									long contentLength = uploadImg.getSize();
									
									String bucket = "lubway/menu";
									
									awss3.upload(is, uploadKey, contentType, contentLength, bucket);
									
									String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/menu/" + uploadKey;
									
									svo.setFilePath(filePath);
								}
							}
						  
						  menuservice.updateSalad(nvo, svo);
						  System.out.println("salad: 들어옴");
						  break;
						  
		case "drink"    : DrinkVO drink = menuservice.selectDrink(dvo);
						  if(dvo.getFilePath() == null) dvo.setFilePath(drink.getFilePath());
						  
						  int drinkIndex = drink.getFilePath().indexOf("/", 20);
							String drinkKey = drink.getFilePath().substring(drinkIndex+1);
							
							if(!uploadImg.getOriginalFilename().equals("")) {
								if(!drinkKey.equals("menu/" + uploadImg)) {
									awss3.delete(drinkKey);
									
									InputStream is = uploadImg.getInputStream();
									String uploadKey = uploadImg.getOriginalFilename();
									String contentType = uploadImg.getContentType();
									long contentLength = uploadImg.getSize();
									
									String bucket = "lubway/menu";
									
									awss3.upload(is, uploadKey, contentType, contentLength, bucket);
									
									String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/menu/" + uploadKey;
									
									dvo.setFilePath(filePath);
								}
							}
						  
						  menuservice.updateDrink(dvo);
						  System.out.println("drink: 들어옴");
						  break;
						  
		case "morning"  : MorningVO morning = menuservice.selectMorning(mvo);
						  if(mvo.getFilePath() == null) mvo.setFilePath(morning.getFilePath());
						  
						  int morningIndex = morning.getFilePath().indexOf("/", 20);
							String morningKey = morning.getFilePath().substring(morningIndex+1);
							
							if(!uploadImg.getOriginalFilename().equals("")) {
								if(!morningKey.equals("menu/" + uploadImg)) {
									awss3.delete(morningKey);
									
									InputStream is = uploadImg.getInputStream();
									String uploadKey = uploadImg.getOriginalFilename();
									String contentType = uploadImg.getContentType();
									long contentLength = uploadImg.getSize();
									
									String bucket = "lubway/menu";
									
									awss3.upload(is, uploadKey, contentType, contentLength, bucket);
									
									String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/menu/" + uploadKey;
									
									mvo.setFilePath(filePath);
								}
							}
						  
						  menuservice.updateMorning(nvo, mvo);
						  System.out.println("morning: 들어옴");
						  break;
						  
		case "cookie"   : CookieVO cookie = menuservice.selectCookie(cvo);
						  if(cvo.getFilePath() == null) cvo.setFilePath(cookie.getFilePath());
						  
						  int cookieIndex = cookie.getFilePath().indexOf("/", 20);
							String cookieKey = cookie.getFilePath().substring(cookieIndex+1);
							
							if(!uploadImg.getOriginalFilename().equals("")) {
								if(!cookieKey.equals("menu/" + uploadImg)) {
									awss3.delete(cookieKey);
									
									InputStream is = uploadImg.getInputStream();
									String uploadKey = uploadImg.getOriginalFilename();
									String contentType = uploadImg.getContentType();
									long contentLength = uploadImg.getSize();
									
									String bucket = "lubway/menu";
									
									awss3.upload(is, uploadKey, contentType, contentLength, bucket);
									
									String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/menu/" + uploadKey;
									
									cvo.setFilePath(filePath);
								}
							}
						  
						  menuservice.updateCookie(nvo, cvo);
						  System.out.println("cookie: 들어옴");
						  break;
						  
		case "was"      : WedgeAndSoupVO was = menuservice.selectWAS(wasvo);
						  if(wasvo.getFilePath() == null) wasvo.setFilePath(was.getFilePath());
						  
						  int wasIndex = was.getFilePath().indexOf("/", 20);
							String wasKey = was.getFilePath().substring(wasIndex+1);
							
							if(!uploadImg.getOriginalFilename().equals("")) {
								if(!wasKey.equals("menu/" + uploadImg)) {
									awss3.delete(wasKey);
									
									InputStream is = uploadImg.getInputStream();
									String uploadKey = uploadImg.getOriginalFilename();
									String contentType = uploadImg.getContentType();
									long contentLength = uploadImg.getSize();
									
									String bucket = "lubway/menu";
									
									awss3.upload(is, uploadKey, contentType, contentLength, bucket);
									
									String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/menu/" + uploadKey;
									
									wasvo.setFilePath(filePath);
								}
							}
						  
						  menuservice.updateWAS(nvo, wasvo);
						  System.out.println("was: 들어옴");
						  break;
		}
		
		System.out.println("수정완료");
		
		return "redirect:/menuList.mdo";
	}
	
	/** 관리자 메뉴 삭제 */
	@PostMapping("/menuDelete.mdo")
	String delete(Model model, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo,
			MorningVO mvo, DrinkVO dvo ,NutrientVO nvo, String code, String select) {
		System.out.println(select);
		System.out.println(code);
		System.out.println("들어옴");
		
		switch (select) { 
		case "sandwich" : menuservice.deleteSandwich(nvo, Svo);
						  System.out.println("sandwich: 들어옴");
						  break;
		case "wrap"     : menuservice.deleteWrap(nvo, wvo);;
						  System.out.println("wrap: 들어옴");
						  break;
		case "salad"    : menuservice.deleteSalad(nvo, svo);
						  System.out.println("salad: 들어옴");
						  break;
		case "drink"    : menuservice.deleteDrink(dvo);
						  System.out.println("drink: 들어옴");
						  break;
		case "morning"  : menuservice.deleteMorning(nvo, mvo);
						  System.out.println("morning: 들어옴");
						  break;
		case "cookie"   : menuservice.deleteCookie(nvo, cvo);
						  System.out.println("cookie: 들어옴");
						  break;
		case "was"      : menuservice.deleteWAS(nvo, wasvo);
						  System.out.println("was: 들어옴");
						  break;
		default         : break;
		}
		return "redirect:/menuList.mdo";
	}
}
