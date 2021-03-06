package com.pro2.dao;

import java.util.List;
import java.util.Objects;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.pro2.dao.entity.Category;
import com.pro2.dao.entity.Product;

@Transactional
@Component("productDAO")
public class ProductDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<Product> getAll(){
		return getSession().createQuery("from Product").list();
	}
	
	public void saveObject(Object obj){
		getSession().save(obj);
	}
	
	public void updateObject(Object obj){
		getSession().update(obj);
	}
	
	public void saveOrUpdateObject(Object obj){
		getSession().saveOrUpdate(obj);
	}
	
	public Object getObject(int id){
		return getSession().get(Product.class, id);
	}
	
	public Object getCategory(int id){
		return getSession().get(Category.class, id);
	}
	
	public List<Category> getAllCategory(){
		return getSession().createQuery("from Category").list();
	}
	
	public void deleteObject(Object o){
		getSession().delete(o);
	}
	
	public int getPageNumber(int limit){
		List<Product> all = getAll();
		int totalPage = all.size()/limit; 
		if(all.size()%12 != 0 ) {
			return totalPage + 1; 
		}
		return totalPage;
	}
	
	public List<Product> getProductOfPage(int pageNumber, int limit){
		Query q = getSession().createQuery("from Product");
		if(pageNumber == 1 ){
			q.setFirstResult(0);
		}else{
			q.setFirstResult(limit * (pageNumber-1));
		}
		q.setMaxResults(limit);
		return q.list();
	}
	
	public List<Product> search(String name){
		List<Product> list = null;
		if(!name.equals("")) {
			list = getSession().createQuery("from Product where name like '%"+name+"%'").list();
		}
		if(Objects.isNull(list)) {
			list = ((Category)getSession().createQuery("from Category where name like '%"+name+"%'").uniqueResult()).getProductList();
		}
		return list;
	}
}
