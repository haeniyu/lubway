package com.web.lubway;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
//import org.junit.runner.RunWith;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lubway.admin.AdminVO;
import com.lubway.admin.service.AdminService;

//@RunWith(value = SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/resources/applicationContext.xml","file:src/main/webapp/WEB-INF/config/adminContext/admin-servlet.xml"})
public class ConnectionTest {

	@Autowired
	private AdminService as;

	@Test
	public void testConnection() throws Exception{
		try {
			AdminVO vo = new AdminVO();
			vo.setAdminmember_id("test");
			vo.setAdminmember_password("test");
			
			as.insertAdmin(vo);
			
//			if(pwd.equals(vo.getAdminmember_password())) {
//				System.out.println("로그인 성공");
//			}else {
//				System.out.println("비밀번호 틀림");
//			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

	
}
