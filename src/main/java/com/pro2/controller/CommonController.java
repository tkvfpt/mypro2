package com.pro2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro2.constants.ECommerceGlobalConstant;
import com.pro2.dao.utils.CommonUtils;

@Controller
public class CommonController {
	
	@Autowired
	MailSender mailSender;

	@RequestMapping(value="/")
	public String showIndex(){
		return ECommerceGlobalConstant.INDEX_PAGE;
	}
	
	@RequestMapping(value="/sendMail")
	public String sendMail(){
		CommonUtils.sendMail(mailSender);
		return ECommerceGlobalConstant.SUCCESS_PAGE;
	}
	
	@RequestMapping(value= {"/admin/loginform","/loginform"})
	public String redirectLogin() {
		return "admin/loginform";
	}
}
