package com.pro2.dao.entity;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "orders")
public class Order {

	@Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name="uuid2", strategy="uuid2")
	@Column(name = "ID", columnDefinition = "BINARY(16)")
	UUID orderId;
	
	@Column(name="Code")
	String code;
	
	@Column(name="TotalPrice")
	double totalPrice;
	
	@Column(name="Active")
	int active;
	
	@Column(name="Created")
	Date created;
	
	@Column(name="Updated")
	Date updated;
	
	@Column(name="Status")
	Integer status;
	
	@ManyToOne
	@JoinColumn(name="CustomerID")
	Customer customer;

	

	public UUID getOrderId() {
		return orderId;
	}

	public void setOrderId(UUID orderId) {
		this.orderId = orderId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	
	public void setStatus(Integer status){
		this.status = status;
	}
	
	public Integer getStatus(){
		return this.status;
	}
	
	
}
