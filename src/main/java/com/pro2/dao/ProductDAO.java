package com.pro2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.pro2.dao.entity.Product;
import com.pro2.dao.generic.GenericDAO;

@Transactional
@Component("productDAO")
public class ProductDAO extends GenericDAO<Product>{

	@Override
	public List<Product> getAll() {
		setClassType(Product.class);
		return super.getAll();
	}
		
}
