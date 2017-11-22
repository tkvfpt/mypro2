package com.pro2.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pro2.dao.entity.Invoice;
import com.pro2.dao.entity.InvoiceDetail;


@Repository("invoiceDAO")
@Transactional	
public class InvoiceDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<Invoice> getAll(){
		Session session = getSession();
		List<Invoice> list = session.createQuery("from Invoice").list();
		for(Invoice invoice : list){
			Hibernate.initialize(invoice.getInvoiceDetail());
			invoice.getInvoiceDetail();
		}
		return list;
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
		Session session = getSession();
		Invoice invoice = (Invoice)session.get(Invoice.class, id);
		Hibernate.initialize(invoice);
		invoice.getInvoiceDetail();
		return invoice;
	}
	
	public void deleteObject(Object o){
		getSession().delete(o);
	}
	
	public List<InvoiceDetail> getAllDetails(int id){
		return ((Invoice)getObject(id)).getInvoiceDetail();
	}
}
