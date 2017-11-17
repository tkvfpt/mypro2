package com.pro2.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro2.constants.ECommerceGlobalConstant;
import com.pro2.dao.entity.ShopInfo;
import com.pro2.dao.generic.IGenericDAO;
import com.pro2.dao.utils.CommonUtils;

@Controller
public class CommonController {
	
	@Autowired
	IGenericDAO shopinfoDAO;
	
	@Autowired
	MailSender mailSender;
	
	private static final Logger LOG = Logger.getLogger("CommonController");

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
		return ECommerceGlobalConstant.SHOW_ALL_PRODUCT_PAGE;
	}
	
	@RequestMapping(value="/admin/shop", method=RequestMethod.POST)
	public String saveOrUpdateShop(HttpServletRequest request, Model model,ShopInfo shop) {
		LOG.info("shop: "+shop);
		return ECommerceGlobalConstant.INDEX_PAGE;
	}
}
