package com.pro2.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro2.constants.ECommerceGlobalConstant;
import com.pro2.dao.CategoryDAO;
import com.pro2.dao.entity.Category;

@Controller
@RequestMapping("/admin")
public class AdminCategoryController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ServletContext context;
	
	public static final Logger logger = Logger.getLogger(AdminCategoryController.class);
	
	/**
	 * Show All Category Page
	 * @author khon.vt
	 * @param model
	 * @return
	 */
	@RequestMapping(value = ECommerceGlobalConstant.ALL_CATEGORY_URL, method=RequestMethod.GET)
	public String categoryDetail(Model model){
		model.addAttribute("list", categoryDAO.getAll());		
		return ECommerceGlobalConstant.SHOW_ALL_CATEGORY_PAGE;
	}
	
	/**
	 * Show Edit Category Page
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = ECommerceGlobalConstant.EDIT_CATEGORY_URL)
	public String editCategory(HttpServletRequest request, Model model) {
		Category category = (Category)categoryDAO.getObject(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("category", category);
		return ECommerceGlobalConstant.EDIT_CATEGORY_PAGE;
	}

	/**
	 *Show Add Category Form 
	 * @author khon.vt
	 */
	@RequestMapping(value = "/category/new")
	public String themProduct() {
		return ECommerceGlobalConstant.ADD_NEW_CATEGORY_PAGE;
	}
	
	/**
	 * Execute Add New Category
	 * @author khon.vt
	 * @param request {@link HttpServletRequest}
	 * @param model {@link Model}
	 * @return {@link String}
	 */
	@RequestMapping(value = "/category/add", method=RequestMethod.POST)
	public String addProduct(HttpServletRequest request, Model model, Category category){
		categoryDAO.saveObject(category);
		return ECommerceGlobalConstant.REDIRECT +"/admin"+ ECommerceGlobalConstant.ALL_CATEGORY_URL;
	}
	/**
	 * Execute Edit Category Action
	 * @author khon.vt
	 * @param model {@link Model}
	 * @param request {@link HttpServletRequest}
	 * @return {@link String}
	 */
	@RequestMapping(value = "/category/update", method = RequestMethod.POST)
	public String suaProduct(Model model, HttpServletRequest request, Category category) {		
		categoryDAO.updateObject(category);
		return ECommerceGlobalConstant.REDIRECT +"/admin"+ ECommerceGlobalConstant.ALL_CATEGORY_URL;
	}
}