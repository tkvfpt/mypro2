package com.pro2.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro2.constants.ECommerceGlobalConstant;
import com.pro2.dao.entity.ShopInfo;
import com.pro2.dao.entity.User;
import com.pro2.dao.generic.IGenericDAO;

@Controller
@RequestMapping("/admin")
public class AdminUserController {
	
	@Autowired
	IGenericDAO<User> userDAO;
	
	@Autowired
	ServletContext context;
	
	public static final Logger logger = Logger.getLogger(AdminUserController.class);
	
	/**
	 * Show All User Page
	 * @author khon.vt
	 * @param model
	 * @return
	 */
	@RequestMapping(value = ECommerceGlobalConstant.ALL_USER_URL, method=RequestMethod.GET)
	public String productDetail(Model model){
		model.addAttribute("list", userDAO.getAll());		
		return ECommerceGlobalConstant.SHOW_ALL_USER_PAGE;
	}
	
	/**
	 * Show Edit User Page
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = ECommerceGlobalConstant.EDIT_USER_URL)
	public String editSP(HttpServletRequest request, Model model) {
		User user = userDAO.getObj(request.getParameter("id"));
		request.setAttribute("user", user);
		return ECommerceGlobalConstant.EDIT_USER_PAGE;
	}

	/**
	 *Show Add User Form 
	 * @author khon.vt
	 */
	@RequestMapping(value = "/user/new")
	public String themProduct() {
		return ECommerceGlobalConstant.ADD_NEW_USER_PAGE;
	}
	
	/**
	 * Execute Add New User
	 * @author khon.vt
	 * @param request {@link HttpServletRequest}
	 * @param model {@link Model}
	 * @return {@link String}
	 */
	@RequestMapping(value = "/user/add", method=RequestMethod.POST)
	public String addProduct(HttpServletRequest request, Model model, User user){
		logger.info("context:" +context.getRealPath(""));
		ShopInfo shop = (ShopInfo) request.getAttribute("shop");
		user.setShop(shop);
		user.setRole("ROLE_ADMIN");
		userDAO.saveObject(user);
		return ECommerceGlobalConstant.REDIRECT + ECommerceGlobalConstant.ALL_USER_URL;
	}
	/**
	 * Execute Edit User Action
	 * @author khon.vt
	 * @param model {@link Model}
	 * @param request {@link HttpServletRequest}
	 * @return {@link String}
	 */
	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	public String suaProduct(Model model, HttpServletRequest request, User user) {		
		userDAO.updateObject(user);
		return ECommerceGlobalConstant.REDIRECT +"/admin"+ ECommerceGlobalConstant.ALL_USER_URL;
	}
}