package com.pro2.constants;

/**
 * Class contains all the constants in project
 * @author khon.vt
 *
 */
public class ECommerceGlobalConstant {
	
	private ECommerceGlobalConstant(){
		throw new IllegalStateException("Constant Class");
	}
	/* Common Constant */
	public static final String SPACE = " " ;	
	public static final String UNDERSCORE = "_";
	public static final String REDIRECT = "redirect:";
	public static final String RESOURCE_REAL_PATH="/WEB-INF/resource";
	
	/* Common Object Name */
	public static final String CART = "listCart";
	
	/* Common Object Constants */
	public static final String OBJECT_ID = "id";
	public static final String OBJECT_NAME = "name";
	
	/* HQL query */
	public static final String FROM = "from ";
	public static final String WHERE = " where ";
	public static final String AND = " and ";
	public static final String LIKE = " like ";
	public static final String QUOTE="'";	
	
	/*Client Page Name */
	public static final String INDEX_PAGE = "client/index";
	public static final String CART_PAGE = "client/cart";	
	public static final String SUCCESS_PAGE = "";
	
	/* Admin Page Name */
	public static final String LOGIN_PAGE = "admin/loginform";
	public static final String DASH_BOARD_PAGE = "admin/dashboard";
	
	public static final String SHOW_ALL_CUSTOMER_PAGE = "admin/customer/list";
	public static final String ADD_NEW_CUSTOMER_PAGE = "admin/customer/insert";
	public static final String EDIT_CUSTOMER_PAGE = "admin/customer/update";
	
	public static final String SHOW_ALL_PRODUCT_PAGE = "admin/product/list";
	public static final String EDIT_PRODUCT_PAGE = "admin/product/update";
	public static final String ADD_NEW_PRODUCT_PAGE = "admin/product/insert";
	
	public static final String SHOW_ALL_NEWS_PAGE = "admin/news/list";
	public static final String EDIT_NEWS_PAGE = "admin/news/update";
	public static final String ADD_NEW_NEWS_PAGE = "admin/news/insert";
	
	public static final String SHOW_ALL_CATEGORY_PAGE = "admin/category/list";
	public static final String EDIT_CATEGORY_PAGE = "admin/category/update";
	public static final String ADD_NEW_CATEGORY_PAGE = "admin/category/insert";
	
	public static final String SHOW_ALL_USER_PAGE = "admin/user/list";
	public static final String EDIT_USER_PAGE = "admin/user/update";
	public static final String ADD_NEW_USER_PAGE = "admin/user/insert";
	/* Page URL */
	public static final String ADMIN_DASH_BOARD_URL = "/admin";
	public static final String ALL_USER_URL = "/user/all";
	public static final String EDIT_USER_URL = "/user/edit";
	
	public static final String ALL_CATEGORY_URL = "/category/all";
	public static final String EDIT_CATEGORY_URL = "/category/edit";
}
