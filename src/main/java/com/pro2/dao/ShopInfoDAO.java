package com.pro2.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.pro2.dao.entity.ShopInfo;
import com.pro2.dao.generic.GenericDAO;

@Component("shopinfoDAO")
public class ShopInfoDAO extends GenericDAO<ShopInfo>{

	@Override
	public List<ShopInfo> getAll() {
		setClassType(ShopInfo.class);
		return super.getAll();
	}
}
