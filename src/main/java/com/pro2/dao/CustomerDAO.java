package com.pro2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.pro2.dao.entity.Category;
import com.pro2.dao.entity.Customer;
import com.pro2.dao.entity.Product;

@Transactional
@Component("customerDAO")
public class CustomerDAO{
	@Autowired
	SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<Customer> getAll(){
		return getSession().createQuery("from Customer").list();
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
		return getSession().get(Customer.class, id);
	}
	
	public void deleteObject(Object o){
		getSession().delete(o);
	}
}