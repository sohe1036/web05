package com.eshop.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eshop.service.MemberService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Autowired
	HttpSession session;
	
    @RequestMapping(value="/", method = RequestMethod.GET)
    public String AdminRoot() {
        return "admin/admin";
    }
	
    @RequestMapping(value="admin.do", method = RequestMethod.GET)
    public String Admin() {
        return "admin/admin";
    }
}