package com.pro2.dao.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.pro2.constants.ECommerceGlobalConstant;

/**
 * 
 * @author khon.vt
 *
 */
@Entity
@Table(name = "invoice")
public class Invoice {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = ECommerceGlobalConstant.OBJECT_ID)
	int id;
	
	@Column(name="address")
	String address;
	
	@Column(name="district")
	String district;
	
	@Column(name="city")
	String city;
	
	@Column(name="phone")
	String phone;
	
	@Column(name="dated")
	@Temporal(TemporalType.DATE)
	Date date;
	
	@Column(name="status")
	String status;
	
	@Column(name="customer")
	String customer;
	
	@OneToMany(mappedBy="invoice_detail_pk.invoice",cascade=CascadeType.PERSIST,fetch=FetchType.EAGER)
	List<InvoiceDetail> invoiceDetail = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<InvoiceDetail> getInvoiceDetail() {
		return invoiceDetail;
	}

	public void setInvoiceDetail(List<InvoiceDetail> invoiceDetail) {
		this.invoiceDetail = invoiceDetail;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}
	
}
