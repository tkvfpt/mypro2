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
		if(Objects.isNull(session.getAttribute("listCart"))){
			list=editSession(p,new ArrayList<>());
			
		}else{
			list=editSession(p, (List<Product>)session.getAttribute("listCart"));
			
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
	public String removeP(Model model, HttpSession session) {
		List<Product> list = (List<Product>)session.getAttribute("listCart");
		//continue
		return "client/cart";
	}
	
	private List<Product> editSession(Product sp,List<Product> lstSp){
		for(int i=0;i<lstSp.size();i++){
			if(lstSp.get(i).getId()==sp.getId()){
				float dongia = lstSp.get(i).getPrice()/lstSp.get(i).getQuantity();
				lstSp.get(i).setQuantity(lstSp.get(i).getQuantity()+1);
				lstSp.get(i).setPrice(lstSp.get(i).getQuantity()* dongia);
				return lstSp;
			}
		}
		sp.setQuantity(1);
		lstSp.add(sp);
		return lstSp;
	}
	@RequestMapping("/list")
	public String pList(Model model, HttpServletRequest request) {
		model.addAttribute("totalPage", productDAO.getPageNumber());
		int pageNumber = Integer.parseInt(request.getParameter("page"));
		int limit = Integer.parseInt(request.getParameter("limit"));
		model.addAttribute("list", productDAO.getProductOfPage(pageNumber, limit));
		return "client/productlist";
	}
	
}