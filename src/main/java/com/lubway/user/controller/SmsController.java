package com.lubway.user.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lubway.user.service.SmsService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class SmsController {

	@Autowired
	private SmsService smsService;
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST, value = "/sendSms.do")
	public String sendSms(@RequestParam("tell") String tel, HttpSession seesion) {

		System.out.println("전화번호 : " + tel);
		System.out.println("DB에 해당 번호로 조회한 값 : " + smsService.checkTel(tel));
		System.out.println("session findId 값 : " + seesion.getAttribute("findId"));

		if(smsService.checkTel(tel) == 1 && seesion.getAttribute("findId") == null) {
			return "";
		}
		
		String code = codeGen();

		String api_key = "NCSFJMEFEST6QZ5N";
		String api_secret = "7PPSMLSDPX4BEK2VAFLKQCE0SVE2FWPR";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", tel);
		params.put("from", "01058740013");
		params.put("type", "SMS");
		params.put("text", "러브웨이 휴대폰인증 테스트 메시지 : 인증번호는" + "["+ code +"]" + "입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());

		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		return code;
	}

	/** 4자리 난수를 생성하는 메서드 */
	public String codeGen() {

		Random ran = new Random();
		String numStr = ""; // 난수가 저장될 변수

		for (int i = 0; i < 4; i++) {

			// 0~9 까지 난수 생성
			String ranNum = Integer.toString(ran.nextInt(10));

			// 중복된 값이 있는지 검사한다
			if (!numStr.contains(ranNum)) {
				// 중복된 값이 없으면 numStr에 append
				numStr += ranNum;
			} else {
				// 생성된 난수가 중복되면 루틴을 다시 실행한다
				i -= 1;
			}
		}
		System.out.println("codeGen() - 생성된 난수 : " + numStr);
		return numStr;
	}

}
