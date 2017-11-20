package com.pro2.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro2.constants.ECommerceGlobalConstant;
import com.pro2.dao.ProductDAO;
import com.pro2.dao.entity.Product;

@Controller
@RequestMapping("/product")
public class ClientProductController {
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	ServletContext context;
	
	public static final Logger logger = Logger.getLogger(AdminProductController.class);
	
	@RequestMapping("/detail")
	public String pDetail(Model model, HttpServletRequest request) {
		Product p = (Product) productDAO.getObject(Integer.parseInt(request.getParameter("id")));
		model.addAttribute("p", p);
		return "client/productdetail";
	}
	
	@RequestMapping("/addcart")
	public String addCart(Model model, HttpSession session, HttpServletRequest request) {
		List<Product> list = null;
		
		int id = Integer.parseInt(request.getParameter(ECommerceGlobalConstant.OBJECT_ID));
		Product p = (Product)productDAO.getObject(id);
		int quantity = 0;
			if(Objects.nonNull(request.getParameter("quantity")) && !request.getParameter("quantity").equals("") && Integer.parseInt(request.getParameter("quantity")) != 0){
				quantity =Integer.parseInt(request.getParameter("quantity")); 
			}
		
		if(Objects.isNull(session.getAttribute("listCart"))){
			list=editSession(p,new ArrayList<>(),quantity);
			
		}else{
			list=editSession(p, (List<Product>)session.getAttribute("listCart"),quantity);
			
		}
		session.setAttribute("listCart", list);
		return "client/cart";
	}
	
	@RequestMapping("/cart")
	public String cart(Model model, HttpSession session) {
		
		return "client/cart";
	}
	
	@RequestMapping("/cart/clear")
	public String clearCart(Model model, HttpSession session) {
		session.setAttribute("listCart", new ArrayList<Product>());
		return "client/cart";
	}
	
	@RequestMapping("/cart/remove")
	public String removeP(Model model, HttpSession session, HttpServletRequest request) {
		List<Product> list = (List<Product>)session.getAttribute("listCart");
		Product p =(Product) productDAO.getObject(Integer.parseInt(request.getParameter("id")));
		for(Product p1 : list){
			if(p1.getId() == p.getId()){
				list.remove(p1);
				break;
			}
		}
		session.setAttribute("listCart", list);
		return "client/cart";
	}
	
	private List<Product> editSession(Product sp,List<Product> lstSp,int quantity){
		for(int i=0;i<lstSp.size();i++){
			if(lstSp.get(i).getId()==sp.getId()){
				lstSp.get(i).setQuantity(lstSp.get(i).getQuantity()+1);
				return lstSp;
			}
		}
		if(quantity == 0){
			sp.setQuantity(1);
		}else{
			sp.setQuantity(quantity);
		}
		
		lstSp.add(sp);
		return lstSp;
	}
	@RequestMapping("/list")
	public String pList(Model model, HttpServletRequest request) {
		int limit = Integer.parseInt(request.getParameter("limit"));
		model.addAttribute("totalPage", productDAO.getPageNumber(limit));
		int pageNumber = Integer.parseInt(request.getParameter("page"));
		model.addAttribute("list", productDAO.getProductOfPage(pageNumber, limit));
		return "client/productlist";
	}
	
}