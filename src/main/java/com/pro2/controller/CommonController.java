package com.pro2.controller;

import java.util.List;
import java.util.Objects;
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
	IGenericDAO<ShopInfo> shopinfoDAO;
	
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
	
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String showDashboard(Model model){
		List<ShopInfo> list = shopinfoDAO.getAll();
		if(!list.isEmpty()){
			model.addAttribute("shop",list.get(list.size()-1));
		}
		return ECommerceGlobalConstant.DASH_BOARD_PAGE;
	}
	
	@RequestMapping(value="/admin/shop/update", method=RequestMethod.POST)
	public String saveOrUpdateShop(HttpServletRequest request, Model model,ShopInfo shop) {
		shopinfoDAO.saveOrUpdateObject(shop);
		model.addAttribute("shop",shop.getName());
		return ECommerceGlobalConstant.REDIRECT+"admin";
	}
}
