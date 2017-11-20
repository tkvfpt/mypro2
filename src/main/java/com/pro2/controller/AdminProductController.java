package com.pro2.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pro2.constants.ECommerceGlobalConstant;
import com.pro2.dao.ProductDAO;
import com.pro2.dao.entity.Category;
import com.pro2.dao.entity.Product;
import com.pro2.dao.entity.User;
import com.pro2.dao.utils.CommonUtils;

@Controller
@RequestMapping("/admin")
public class AdminProductController {
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	ServletContext context;
	
	public static final Logger logger = Logger.getLogger(AdminProductController.class);
	
	/**
	 * Show All Product Page
	 * @author khon.vt
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/product/all","/product"}, method=RequestMethod.GET)
	public String productDetail(Model model){
		model.addAttribute("list", productDAO.getAll());		
		return ECommerceGlobalConstant.SHOW_ALL_PRODUCT_PAGE;
	}
	
	@RequestMapping(value = "/product/edit")
	public String editSP(HttpServletRequest request, Model model) {
		int ma = Integer.parseInt(request.getParameter(ECommerceGlobalConstant.OBJECT_ID));
		Product product = (Product)productDAO.getObject(ma);
		model.addAttribute("product", product);
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
	public String addProduct(HttpServletRequest request,@RequestParam MultipartFile pic,@RequestParam MultipartFile spic, Model model, Product product, Authentication authen){
		String imgName = "";
		String thumb = "";
		File imageFile = null;
		File thumbFile = null;
		if(!pic.isEmpty()){
			 imgName = CommonUtils.getValidImageName(request.getParameter(ECommerceGlobalConstant.OBJECT_NAME))+".jpg";
			 imageFile = new File(context.getRealPath(ECommerceGlobalConstant.RESOURCE_REAL_PATH)+"/"+imgName);
		}
		if(!spic.isEmpty()){
			thumb = imgName + "thumbnail";
			thumbFile = new File(context.getRealPath(ECommerceGlobalConstant.RESOURCE_REAL_PATH)+"/"+thumb);
		}
		try {
			if(Objects.nonNull(imageFile)){
				if(!imageFile.exists()){
					pic.transferTo(imageFile);
				}
				product.setImagePath(request.getContextPath()+"/resource/"+imgName);
			}
			
			logger.info(context.getRealPath(ECommerceGlobalConstant.RESOURCE_REAL_PATH)+"/"+imgName);
			if(Objects.nonNull(thumbFile)){
				if(!thumbFile.exists()){
					spic.transferTo(thumbFile);
				}
				product.setThumbnail(request.getContextPath()+"/resource/"+thumb);
			}
			product.setCategory( (Category)productDAO.getCategory(Integer.parseInt(request.getParameter("mycategory"))));
			product.setUser((User)authen.getPrincipal());
			
			productDAO.saveOrUpdateObject(product);
		} catch (IllegalStateException | IOException e) {
			Logger.getLogger(this.getClass()).info(e.getMessage());
		}
			return "redirect:/admin/product/all";
	}
	/**
	 * Execute Edit Product Action
	 * @author khon.vt
	 * @param model {@link Model}
	 * @param request {@link HttpServletRequest}
	 * @return {@link String}
	 */
	@RequestMapping(value = "/product/update", method = RequestMethod.POST)
	public String suaProduct(HttpServletRequest request,@RequestParam MultipartFile pic,@RequestParam MultipartFile spic,Product product, Model model, Authentication authen) {		
		String imgName = "";
		String thumb = "";
		File imageFile = null;
		File thumbFile = null;
		
		if(!pic.isEmpty()){
			 imgName = CommonUtils.getValidImageName(request.getParameter(ECommerceGlobalConstant.OBJECT_NAME))+".jpg";
			 imageFile = new File(context.getRealPath(ECommerceGlobalConstant.RESOURCE_REAL_PATH)+"/"+imgName);
		}
		if(!spic.isEmpty()){
			thumb = imgName + "thumbnail";
			thumbFile = new File(context.getRealPath(ECommerceGlobalConstant.RESOURCE_REAL_PATH)+"/"+thumb);
		}
		Product tmpProduct = (Product)productDAO.getObject(product.getId());
		try {
			if(Objects.nonNull(imageFile)){
				if(!imageFile.exists()){
					pic.transferTo(imageFile);
				}
				product.setImagePath(request.getContextPath()+"/resource/"+imgName);
			}else{
				product.setImagePath(tmpProduct.getImagePath());
			}
			
			logger.info(context.getRealPath(ECommerceGlobalConstant.RESOURCE_REAL_PATH)+"/"+imgName);
			if(Objects.nonNull(thumbFile)){
				if(!thumbFile.exists()){
					spic.transferTo(thumbFile);
				}
				product.setThumbnail(request.getContextPath()+"/resource/"+thumb);
			}
			else{
				product.setThumbnail(tmpProduct.getThumbnail());
			}
			

			product.setUser((User)authen.getPrincipal());
			product.setCategory( (Category)productDAO.getCategory(Integer.parseInt(request.getParameter("mycategory"))));
			productDAO.saveOrUpdateObject(product);
		} catch (IllegalStateException | IOException e) {
			Logger.getLogger(this.getClass()).info(e.getMessage());
		}
			return "redirect:/admin/product/all";
	}
	
	@RequestMapping(value="/product/delete")
	public String delete(Model model, HttpServletRequest request){
		productDAO.deleteObject(productDAO.getObject(Integer.parseInt(request.getParameter("id"))));
		return "redirect:/admin/product/all";
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
//		List<Product> list = null;
//		
//		int ma = Integer.parseInt(request.getParameter(ECommerceGlobalConstant.OBJECT_ID));
//		Product sp = productDAO.getObj(ma);
//		if(Objects.isNull(session.getAttribute(ECommerceGlobalConstant.CART))){
//			list=editSession(sp,new ArrayList<>());
//		}else{
//			list=editSession(sp, (List<Product>)session.getAttribute(ECommerceGlobalConstant.CART));
//		}
//		session.setAttribute(ECommerceGlobalConstant.CART, list);
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
		/*for(int i=0;i<listProduct.size();i++){
			if(listProduct.get(i).getId()==product.getId()){
				float dongia = listProduct.get(i).getPrice()/listProduct.get(i).getQuantity();
				listProduct.get(i).setQuantity(listProduct.get(i).getQuantity()+1);
				listProduct.get(i).setPrice(listProduct.get(i).getQuantity()* dongia);
				return listProduct;
			}
		}
		product.setQuantity(1);
		listProduct.add(product);
		return listProduct;*/
		return null;
	}
	
	@ModelAttribute
	public void getAllCategory(Model model){
		List<Category> categories = productDAO.getAllCategory();
		model.addAttribute("categories",categories);
	}
}