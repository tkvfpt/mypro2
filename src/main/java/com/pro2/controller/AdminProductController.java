package com.pro2.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pro2.dao.common.QueryManager;
import com.pro2.dao.constants.ECommerceGlobalConstant;
import com.pro2.dao.entity.Product;
import com.pro2.dao.generic.IGenericDAO;
import com.pro2.dao.utils.CommonUtils;
import com.pro2.dao.utils.QueryUtils;

@Controller
@RequestMapping("/admin")
public class AdminProductController {
	
	@Autowired
	IGenericDAO<Product> productDAO;
	
	@Autowired
	ServletContext context;
	
	public static final Logger logger = Logger.getLogger(AdminProductController.class);
	
	/**
	 * Show All Product Page
	 * @author khon.vt
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/product/all"}, method=RequestMethod.GET)
	public String productDetail(Model model){
		model.addAttribute("list", productDAO.getAll());		
		return ECommerceGlobalConstant.SHOW_ALL_PRODUCT_PAGE;
	}
	
	@RequestMapping(value = "/product/edit")
	public String editSP(HttpServletRequest request, Model model) {
		int ma = Integer.parseInt(request.getParameter(ECommerceGlobalConstant.OBJECT_ID));
		Product product = productDAO.getObj(ma);
		request.setAttribute("product", product);
		return ECommerceGlobalConstant.EDIT_PRODUCT_PAGE;
	}

	/**
	 *Show Add Product Form 
	 * @author khon.vt
	 */
	@RequestMapping(value = "/product/new")
	public String themProduct() {
		return ECommerceGlobalConstant.ADD_NEW_PRODUCT_PAGE;
	}
	
	/**
	 * Execute Add New Product
	 * @author khon.vt
	 * @param request {@link HttpServletRequest}
	 * @param image {@link MultipartFile}
	 * @param model {@link Model}
	 * @return {@link String}
	 */
	@RequestMapping(value = "/product/add", method=RequestMethod.POST)
	public String addProduct(HttpServletRequest request,@RequestParam MultipartFile image,@RequestParam MultipartFile thumbnail, Model model, Product product){
		logger.info("context:" +context.getRealPath(""));
		String imgName = CommonUtils.getValidImageName(request.getParameter(ECommerceGlobalConstant.OBJECT_NAME))+".jpg";
		String thumb = imgName + "thumbnail";
		try {
			image.transferTo(new File(context.getRealPath("/WEB-INF/resource")+imgName));
			thumbnail.transferTo(new File(context.getRealPath("/WEB-INF/resource")));
		} catch (IllegalStateException | IOException e) {
			Logger.getLogger(this.getClass()).info(e.getMessage());
		}
			product.setImagePath(imgName);
			product.setThumbnail(thumb);
			productDAO.saveObject(product);
			return "redirect:/product/all";
	}
	/**
	 * Execute Edit Product Action
	 * @author khon.vt
	 * @param model {@link Model}
	 * @param request {@link HttpServletRequest}
	 * @return {@link String}
	 */
	@RequestMapping(value = "/product/update", method = RequestMethod.GET)
	public String suaProduct(Model model, HttpServletRequest request) {		
		int ma = Integer.parseInt(request.getParameter(ECommerceGlobalConstant.OBJECT_ID));
		Product sp = productDAO.getObj(ma);
		sp = (Product) CommonUtils.settingAttributeForObject(sp, request);
		productDAO.updateObject(sp);
		return "redirect:/";
	}

	/**
	 * Execute Search Action
	 * @author khon.vt
	 * @param request {@link HttpServletRequest}
	 * @param model {@link Model}
	 * @return {@link String}
	 */
	@RequestMapping("/search")
	public String search(HttpServletRequest request, Model model) {
		model.addAttribute("list", productDAO.executeQuery(QueryUtils.createQueryWithCrit(new Product(),new QueryManager(request.getParameterMap())) ) );
		return ECommerceGlobalConstant.SHOW_ALL_PRODUCT_PAGE;
	}
	
	/**
	 * execute to cart action
	 * @author khon.vt
	 * @param request
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/cart")
	public String cart(HttpServletRequest request, Model model,HttpSession session) {
		List<Product> list = null;
		
		int ma = Integer.parseInt(request.getParameter(ECommerceGlobalConstant.OBJECT_ID));
		Product sp = productDAO.getObj(ma);
		if(Objects.isNull(session.getAttribute(ECommerceGlobalConstant.CART))){
			list=editSession(sp,new ArrayList<>());
		}else{
			list=editSession(sp, (List<Product>)session.getAttribute(ECommerceGlobalConstant.CART));
		}
		session.setAttribute(ECommerceGlobalConstant.CART, list);
		return ECommerceGlobalConstant.CART_PAGE;
	}
	
	/**
	 * Check if session contains the product
	 * @author khon.vt
	 * @param product
	 * @param listProduct
	 * @return
	 */
	private List<Product> editSession(Product product, List<Product> listProduct){
		for(int i=0;i<listProduct.size();i++){
			if(listProduct.get(i).getId()==product.getId()){
				float dongia = listProduct.get(i).getPrice()/listProduct.get(i).getQuantity();
				listProduct.get(i).setQuantity(listProduct.get(i).getQuantity()+1);
				listProduct.get(i).setPrice(listProduct.get(i).getQuantity()* dongia);
				return listProduct;
			}
		}
		product.setQuantity(1);
		listProduct.add(product);
		return listProduct;
	}
}