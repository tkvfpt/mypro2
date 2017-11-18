package com.pro2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.pro2.dao.entity.ShopInfo;
import com.pro2.dao.entity.User;
import com.pro2.dao.generic.IGenericDAO;

@ControllerAdvice
public class GlobalObjectController {
	
	@Autowired
	IGenericDAO<ShopInfo> shopinfoDAO;

	@ModelAttribute("user")
	public User getCurrentUser(Authentication authen){
		return (User)authen.getPrincipal();
	}
	
	@ModelAttribute
	public void showDashboard(Model model){
		List<ShopInfo> list = shopinfoDAO.getAll();
		if(!list.isEmpty()){
			model.addAttribute("shop",list.get(list.size()-1));
		}
	}
}
