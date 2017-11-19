package com.pro2.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.pro2.dao.entity.Category;
import com.pro2.dao.generic.GenericDAO;

@Transactional
@Component("categoryDAO")
public class CategoryDAO extends GenericDAO<Category>{

	@Override
	public List<Category> getAll() {
		setClassType(Category.class);
		return super.getAll();
	}
		
}
