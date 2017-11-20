package com.pro2.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro2.dao.CustomerDAO;
import com.pro2.dao.entity.Customer;

@Controller
@RequestMapping("/admin")
public class AdminCustomerController {
	
	@Autowired
	CustomerDAO customerDAO;
	
	@Autowired
	ServletContext context;
	
	public static final Logger logger = Logger.getLogger(AdminCustomerController.class);
	
	@RequestMapping(value="/customer/all")
	public String showAllCustomers(Model model){
		List<Customer> list = customerDAO.getAll();
		model.addAttribute("list",list);
		return "admin/category/list";
	}
	
}