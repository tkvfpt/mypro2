package com.pro2.dao.common;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import com.pro2.constants.ECommerceGlobalConstant;

public class QueryManager {

	private Map<String, String[]> properties;
	
	public QueryManager(Map<String,String[]> map){
		if(Objects.isNull(map)){
			properties = new HashMap<>();
		}
		setProperties(map);
	}
		
	public String generateCriteria(String operator, boolean isAscend){
		StringBuilder builder = new StringBuilder();
		for (Map.Entry<String, String[]> entry : properties.entrySet()){
			builder.append(entry.getKey() +
					operator +
					ECommerceGlobalConstant.QUOTE +
					entry.getValue()[0] +
					ECommerceGlobalConstant.QUOTE);
			if(properties.size() > 1){
				builder.append(ECommerceGlobalConstant.AND);
			}
		}
		if(isAscend == true){
			builder.append("order by asc");
		}
		
		return builder.toString();
	}		

	public Map<String, String[]> getProperties() {
		return properties;
	}

	public void setProperties(Map<String, String[]> properties) {
		this.properties = properties;
	}
	
	
}
