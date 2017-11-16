package com.pro2.dao.utils;

import com.pro2.constants.ECommerceGlobalConstant;
import com.pro2.dao.common.QueryManager;

public class QueryUtils {

	public static String createQueryWithCrit(Object obj,QueryManager queryManager){
		if(queryManager.generateCriteria(ECommerceGlobalConstant.LIKE,true).equals("")){
			return ECommerceGlobalConstant.FROM + obj.getClass().getSimpleName();
		}
		return ECommerceGlobalConstant.FROM + obj.getClass().getSimpleName()+ ECommerceGlobalConstant.WHERE + queryManager.generateCriteria(ECommerceGlobalConstant.LIKE,true);
	}
	
}
