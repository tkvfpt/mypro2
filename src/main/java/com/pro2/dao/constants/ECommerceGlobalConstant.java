package com.pro2.dao.constants;

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
	public static final String SHOW_ALL_CUSTOMER_PAGE = "admin/customer/list";
	public static final String ADD_NEW_CUSTOMER_PAGE = "admin/customer/insert";
	public static final String EDIT_CUSTOMER_PAGE = "admin/customer/update";
	
	public static final String SHOW_ALL_PRODUCT_PAGE = "admin/product/list";
	public static final String EDIT_PRODUCT_PAGE = "admin/product/update";
	public static final String ADD_NEW_PRODUCT_PAGE = "admin/product/insert";
	
	public static final String SHOW_ALL_NEWS_PAGE = "admin/news/list";
	public static final String EDIT_NEWS_PAGE = "admin/news/update";
	public static final String ADD_NEW_NEWS_PAGE = "admin/news/insert";
	
	public static final String SHOW_ALL_ORDER_PAGE = "admin/order/list";
	public static final String EDIT_ORDER_PAGE = "admin/order/update";
	public static final String ADD_NEW_ORDER_PAGE = "admin/order/insert";
	
	public static final String SHOW_ALL_ADS_PAGE = "admin/advertisements/list";
	public static final String EDIT_ADS_PAGE = "admin/advertisements/update";
	public static final String ADD_NEW_ADS_PAGE = "admin/advertisements/insert";
	
	/* Page URL */
	
}
