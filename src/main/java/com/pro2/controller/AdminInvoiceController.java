package com.pro2.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro2.dao.InvoiceDAO;
import com.pro2.dao.entity.Invoice;

@Controller
@RequestMapping("/admin")
public class AdminInvoiceController {
	
	@Autowired
	InvoiceDAO invoiceDAO;
	
	@Autowired
	ServletContext context;
	
	public static final Logger LOG = Logger.getLogger(AdminInvoiceController.class);
	
	@RequestMapping(value="/invoice/all", method=RequestMethod.GET)
	public String showAll(Model model){
		List<Invoice> list = invoiceDAO.getAll();
		model.addAttribute("list",list);
		LOG.info("showAll running");
		return "admin/invoice/list";
	}
	
	@RequestMapping(value="/invoice/detail")
	public String detail(Model model, HttpServletRequest request){
		Invoice invoice =(Invoice) invoiceDAO.getObject(Integer.parseInt(request.getParameter("id")));
		model.addAttribute("invoice",invoice);
		return "admin/invoice/update";
	}
	
	
}