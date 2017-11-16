package com.pro2.dao.entity;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "orderitem")
public class InvoiceDetail {

	@Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name = "uuid2", strategy = "uuid2")
	@Column(name = "ID", columnDefinition = "BINARY(16)")
	UUID orderItemId;

	@Column(name = "Price")
	float price;
	@Column(name="OrderId")
	int orderId;
	
	@Column(name="ProductID")	
	int productId;
	
	
	
	@Column(name="Quantity")
	int quantity;
	


	public UUID getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(UUID orderItemId) {
		this.orderItemId = orderItemId;
	}
	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
}
