package com.pro2.controller;

import java.io.File;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pro2.constants.ECommerceGlobalConstant;
import com.pro2.dao.ProductDAO;
import com.pro2.dao.entity.Category;
import com.pro2.dao.entity.Product;
import com.pro2.dao.entity.ShopInfo;
import com.pro2.dao.generic.IGenericDAO;
import com.pro2.dao.utils.CommonUtils;

@Controller
public class CommonController {
	
	@Autowired
	IGenericDAO<ShopInfo> shopinfoDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	MailSender mailSender;
	
	private static final Logger LOG = Logger.getLogger("CommonController");

	@RequestMapping(value="/")
	public String showIndex(Model model){
		List<Product> list = productDAO.getAll();
		List<Category> cates = productDAO.getAllCategory();
		model.addAttribute("list", list);
		model.addAttribute("cates", cates);
		return ECommerceGlobalConstant.INDEX_PAGE;
	}
	
	@RequestMapping(value=ECommerceGlobalConstant.ADMIN_DASH_BOARD_URL,method=RequestMethod.GET)
	public String showAdminPage(){
		return ECommerceGlobalConstant.DASH_BOARD_PAGE;
	}
	
	@RequestMapping(value="/admin/shop/update", method=RequestMethod.POST)
	public String saveOrUpdateShop(HttpServletRequest request, ShopInfo shop, Model model, @RequestParam MultipartFile mylogo) {
		String logo = request.getContextPath()+"/resource/logo.jpg";
		File logoFile = new File(context.getRealPath(ECommerceGlobalConstant.RESOURCE_REAL_PATH)+"/logo.jpg");
		if(!logoFile.exists()){
			try {
				mylogo.transferTo(logoFile);
			}catch(Exception e){
				LOG.info(e.getMessage());
			}
		}
		shop.setLogo(logo);
		shopinfoDAO.saveOrUpdateObject(shop);
		model.addAttribute("shop",shop);
		return ECommerceGlobalConstant.REDIRECT+ECommerceGlobalConstant.ADMIN_DASH_BOARD_URL;
	}
	
	
	
	private void deleteOldShop(List<ShopInfo> list, ShopInfo info){
		for(ShopInfo shop : list){
			if(!shop.getName().equals(info.getName())){
				shopinfoDAO.deleteObject(shop);
			}
		}
	}
}
