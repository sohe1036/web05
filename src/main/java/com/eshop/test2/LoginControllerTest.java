package com.eshop.test2;




import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;


import com.eshop.dto.MemberDTO;
import com.eshop.service.MemberService;


@Controller
public class LoginControllerTest {

	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	@Test
	public void test() throws Exception {  //로그인 테스트
		//System.out.println("Controller Test~!");
		MemberDTO member = new MemberDTO();
		member.setUid("admin");
		member.setUpw("1234");
		//System.out.println("Controller id : "+member.getUid());
	
		if(member.getUid().equals("admin") && member.getUpw().equals("1234")) {
		//	System.out.println("로그인 성공");	
		} else {
			//System.out.println("로그인 실패");
		}
	
	}
}