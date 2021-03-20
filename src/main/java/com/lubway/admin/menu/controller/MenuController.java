package com.lubway.admin.menu.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String insertMenu(NutrientVO nvo, CookieVO cvo,
			SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo, MorningVO mvo, DrinkVO dvo,
		@RequestParam("select") String select,
		@RequestParam("uploadImg") MultipartFile multipart
		) throws IOException,PSQLException {
		
		// aws s3 파일 업로드 처리
			InputStream is = multipart.getInputStream();
			String key = multipart.getOriginalFilename();
			String contentType = multipart.getContentType();
			long contentLength = multipart.getSize();
			awss3.upload(is, key, contentType, contentLength);

			String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/" + key;
			System.out.println(filePath.toString());
		if(select.equals("cookie")){
			System.out.println(filePath.toString());
				cvo.setFilePath(filePath);
				menuservice.cookie(nvo, cvo);
		} else if(select.equals("sandwich")) {
			Svo.setFilePath(filePath);
			menuservice.sandwich(nvo, Svo);
		} else if(select.equals("wrap")) {
			wvo.setFilePath(filePath);
			menuservice.wrap(nvo, wvo);
		}else if(select.equals("was")) {
			wasvo.setFilePath(filePath);
			menuservice.WAS(nvo, wasvo);
		}else if(select.equals("salad")) {
			svo.setFilePath(filePath);
			menuservice.salad(nvo, svo);
		}else if(select.equals("morning")) {
			mvo.setFilePath(filePath);
			menuservice.morning(nvo, mvo);
		}else if(select.equals("drink")) {
			dvo.setFilePath(filePath);
			menuservice.drink(dvo);
		}
		return "menu/menu";
	}
	
	@GetMapping("/menuList.mdo")
	public String selectList(Model model,NutrientVO nvo, CookieVO cvo,
			SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo, 
			MorningVO mvo, DrinkVO dvo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range
			) throws IOException,PSQLException{
		
		
		
		return "menu/menuList";

	}
}
