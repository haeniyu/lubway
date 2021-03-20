package com.lubway.admin.menu.controller;

import java.io.IOException;
import java.io.InputStream;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lubway.admin.AwsS3;
import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.NutrientVO;
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
	public String insertMenu(CookieVO vo, MultipartFile multipart,
		@RequestParam("code") String code,
		@RequestParam("name") String name,
		@RequestParam("price") String price,
		@RequestParam("ttl") String ttl,
		@RequestParam("cal") String cal,
		@RequestParam("sug") String sug,
		@RequestParam("pro") String pro,
		@RequestParam("fat") String fat,
		@RequestParam("sod") String sod
		) throws IOException,PSQLException {
		System.out.println(code);
		System.out.println(name);
		System.out.println(price);
		System.out.println();
		System.out.println(code);
		System.out.println(code);
		System.out.println(code);
		System.out.println(code);
		System.out.println(code);
		System.out.println(multipart.toString());
		if (!multipart.getOriginalFilename().equals("")) {
			// aws s3 파일 업로드 처리
			InputStream is = multipart.getInputStream();
			String key = multipart.getOriginalFilename();
			String contentType = multipart.getContentType();
			long contentLength = multipart.getSize();
			awss3.upload(is, key, contentType, contentLength);

			String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/" + key;

			vo.setFilePath(filePath);
		}

		
		
		CookieVO vo1 = new CookieVO();
		NutrientVO vo2 = new NutrientVO();
		
		vo1.setCode(code);
		vo1.setName(name);
		vo1.setPrice(price);
		vo2.setCal(cal);
		vo2.setCode(code);
		vo2.setFat(fat);
		vo2.setPro(pro);
		vo2.setSod(sod);
		vo2.setSug(sug);
		vo2.setTtl(ttl);
		
		
		System.out.println(vo1.toString());
		System.out.println(vo2.toString());
	
		menuservice.register(vo2, vo1);
		System.out.println(vo2.toString());
		System.out.println(vo1.toString());
		return "menu/menu";
	}
}
