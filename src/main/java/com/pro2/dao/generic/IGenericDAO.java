package com.pro2.dao.generic;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public interface IGenericDAO<T> {

	 SessionFactory getSessionFactory();
	
	 Session getSession();
	 
	 void saveObject(T obj);
	 
	 void saveOrUpdateObject(T obj);
	 
	 void updateObject(T obj);
	 
	 void deleteObject(T obj);
	 
	 T getObj(int a);
	 
	 T getObj(String a);
	 
	 List<T> getAll();
		 
	List<T> executeQuery(String query);
	
}
